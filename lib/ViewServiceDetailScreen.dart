import 'package:flutter/material.dart';
import 'package:veeki/utils/global.colors.dart';
import 'package:veeki/widgets/MyDropDownForm.dart';
import 'package:veeki/widgets/appbar.dart';
import 'package:veeki/widgets/button.global.dart';
import 'package:veeki/widgets/text.form.global.dart';

import 'models/businessLayer/base.dart';
import 'models/request/addservice_request.dart';
import 'models/response/category_response.dart';
import 'models/response/service_response.dart';

class ViewServiceDetailScreen extends Base {
   ViewServiceDetailScreen({this.service}) ;
  final  Service? service;

  @override
  _ViewServiceDetailScreenState createState() => _ViewServiceDetailScreenState(this.service);
}

class _ViewServiceDetailScreenState extends BaseState {
  _ViewServiceDetailScreenState(this.service);
    Service? service;
  Category? _selectedCategory;
  final TextEditingController _ctitle = TextEditingController();
  final TextEditingController _cdescription = TextEditingController();
  final TextEditingController _camount = TextEditingController();
  bool _isDataLoaded = false;
  bool _isRecordPending = true;
  List<Category> _categoryList = [];
  GlobalKey<ScaffoldState> _scaffoldkey  = GlobalKey<ScaffoldState>();
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  AddServiceRequest _addServiceRequest = new AddServiceRequest();

  @override
  void initState() {
    _init();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('View Service Detail'),),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 18.0 , horizontal: 24),
          child: Container(
            child: Column(children: [




              TextFormGlobal(
                controller: _ctitle ,
                text: 'Title',
                obscure: false,
                textInputType: TextInputType.text,
              ),
              const SizedBox(height: 15),


              MyDropdownFormField<Category>(
                items: _categoryList,
                displayText: (category) => category.title!,
                onSelected: (category) {
                  setState(() {
                    _selectedCategory = category;
                  });
                },
                labelText: 'Category',
              ),
              const SizedBox(height: 15),
              TextFormGlobal(
                controller: _camount ,
                text: 'Title',
                obscure: false,
                textInputType: TextInputType.number,
              ),
              const SizedBox(height: 15),
              TextFormField(
                controller: _cdescription,
                keyboardType: TextInputType.multiline,
                maxLines: 10,
                decoration: InputDecoration(
                  // prefixIcon: prefixIcon == null ? prefixIcon : Icon(prefixIcon,
                  //   color: Color.fromRGBO(105, 108, 121, 1),
                  // ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromRGBO(74, 77, 84, 0.2),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black12,
                    ),
                  ),
                  hintText: "Describe your service  ",
                  hintStyle: TextStyle(
                    fontSize: 14.0,
                    color: Color.fromRGBO(105, 108, 121, 0.7),
                  ),
                ),
              ),


              const SizedBox(height: 40),
              ButtonGlobal(
                isLoading: false,
                ontap:(){
                  editservice();
                },
                //  OnBoardingPage(),
                text: 'Edit Service',
                color: GlobalColors.primaryColor,
                fontsize: 15,
              ),
              SizedBox(height: 15),
              ButtonGlobal(
                isLoading: false,
                ontap:(){
                  deleteservice();
                },
                //  OnBoardingPage(),
                text: 'Delete Service',
                color:GlobalColors.redColor,
                fontsize: 15,
              ),

            ],)
          ),
        ),
      ),
    );
  }

  void editservice() async{
    try {
      bool isConnected = await br!.checkConnectivity();
      if (isConnected) {

        if (_selectedCategory?.id == null) {
          showSnack(snackBarMessage:" please choose a category" );
          return;
        }

        await apiHelper?.editMySerivice(service!.id!, _selectedCategory!.id!, _ctitle.text, _cdescription.text,int.parse(_camount.text)).then((result) {
              //hideLoader();
             // if (result != null) {
              if (result.resp_code == "00") {

              showSnack(snackBarMessage: "Updated Successfully");
              nextScreen(context, 'profile');

              }   else if(result.resp_code =="01")
              {

              showSnack(snackBarMessage: result.resp_message.toString());
              }
           //   }
              });

              } else {
              hideLoader();
              showSnack( snackBarMessage: " No Network Available");

              }
              } catch (e) {
              print("Exception - viewMyBookingScreen.dart - _getAllMyBooking():" +
              e.toString());
              }
  }

  void deleteservice() async{


      try {
        bool isConnected = await br!.checkConnectivity();
        if (isConnected) {


            await apiHelper?.deleteMySerivice("${service!.id}").then((result) {
              //hideLoader();
              if (result != null) {
                if (result.resp_code == "00") {

                  showSnack(snackBarMessage: "Service deleted successfully");

                  nextScreen(context, 'profile');

                }   else if(result.resp_code =="01")
                {

                  showSnack(snackBarMessage: result.resp_message.toString());
                }
              }
            });

        } else {
          hideLoader();
          showSnack( snackBarMessage: " No Network Available");

        }
      } catch (e) {
        print("Exception - viewMyBookingScreen.dart - _getAllMyBooking():" +
            e.toString());
      }

  }



  _getAllCategory() async {
    try {
      bool isConnected = await br!.checkConnectivity();
      if (isConnected) {
        // showOnlyLoaderDialog();
        if (_isRecordPending) {
          await apiHelper?.getAllCategory().then((result) {
            // hideLoader();
            if (result != null) {
              if (result.resp_code == "00") {
                List<Category> _tList = result.recordList;

                if (_tList.isEmpty) {
                  _isRecordPending = false;
                }

                _categoryList.addAll(_tList);

                setState(() {
                  //  _isMoreDataLoaded = false;
                });
              } else {
                _categoryList = [];
              }
            }
          });
        }
      } else {
        hideLoader();
        showNetworkErrorSnackBar(_scaffoldkey);

      }
    } catch (e) {
      print("Exception - viewservicedetailScreen.dart - _getCategory():" +
          e.toString());
    }
  }

  _init() async {
    try {
      _ctitle.text = service!.title!;
      _cdescription.text = service!.desc!;
      _camount.text = service!.amount!;
      await  _getAllCategory() ;


      _isDataLoaded = true;
      setState(() {});
    } catch (e) {
      print("Exception - initcatgory.dart - _initFinal():" + e.toString());
    }
  }

}
