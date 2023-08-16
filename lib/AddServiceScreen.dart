import 'dart:convert';
import 'dart:io';


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:veeki/models/businessLayer/global.dart' as global;
import 'package:veeki/sendSOS.dart';

import 'package:veeki/utils/global.colors.dart';
import 'package:veeki/widgets/MyDropDownForm.dart';

import 'package:veeki/widgets/button.global.dart';
import 'package:veeki/widgets/text.form.global.dart';

import 'SignUpScreen.dart';
import 'models/businessLayer/base.dart';
import 'models/request/addservice_request.dart';
import 'models/request/login_request.dart';
import 'models/response/category_response.dart';
import 'models/response/state_response.dart';

class AddServiceScreen extends Base {

  @override
  _AddServiceScreenState createState() => _AddServiceScreenState();
}
class _AddServiceScreenState extends BaseState{


  Category? _selectedCategory;
  final TextEditingController _ctitle = TextEditingController();
  final TextEditingController _cdescription = TextEditingController();
  final TextEditingController _camount = TextEditingController();
 // final TextEditingController _camount = TextEditingController();
 // final TextEditingController _camount = TextEditingController();
  final TextEditingController _cPassword = TextEditingController();
  GlobalKey<ScaffoldState> _scaffoldkey  = GlobalKey<ScaffoldState>();
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  AddServiceRequest _addServiceRequest = new AddServiceRequest();
  Box? box;
  bool isLoading = false;
  File? _tImage;
  File? _tImage1;
  File? _tImage2;
  File? _tImage3;
  File? _tImage4;
  String? imageFlag;
  bool _isDataLoaded = false;
  bool _isRecordPending = true;
  List<Category> _categoryList = [];
  List<File> images = [];

//Drop down to select per day, per hour, per week or per month
  List<States> _stateList = [];
  List<Area> _areaList = [];
  int? selected_area;
  States? _selectedState;
  String ? _selectedStateName;
  String ? _selectedDuration;
  Area? _selectedArea;
  var duration = [
    "Per Hour",
    "Per Day",
    "Per Week",
    "Per Month",
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key:_scaffoldkey,
      appBar: AppBar(title: Text('Add Service'),),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(15.0),
            child: Form(
              key: _formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  const SizedBox(height: 55),
                  // Text(
                  //   'Add Service',
                  //   style: TextStyle(
                  //       color: GlobalColors.textColor,
                  //       fontSize: 25,
                  //       fontWeight: FontWeight.bold),
                  // ),
                  const SizedBox(height: 10),
                  Text(
                    'Add service to continue',
                    style: TextStyle(
                        color: GlobalColors.textColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 40),

                  TextFormGlobal(
                    controller: _ctitle,
                    text: 'Title',
                    obscure: false,
                    textInputType: TextInputType.text,
                  ),
                  const SizedBox(height: 15),
                  // TextFormGlobal(
                  //   controller: _cdescription,
                  //   text: 'Description',
                  //   obscure: false,
                  //   textInputType: TextInputType.emailAddress,
                  // ),



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
                    controller: _camount,
                    text: 'Amount',
                    obscure: false,
                    textInputType: TextInputType.number,
                  ),
                  const SizedBox(height: 10),
                  Container(
                    width:200,
                    child: MyDropdownFormField<String>(
                      items: duration,
                      displayText: (usertype) => usertype,
                      onSelected: (usertype) {
                        setState(() {
                          _selectedDuration = usertype;
                        });
                      },
                      labelText: 'Select Duration',
                    ),
                  ),
                  const SizedBox(height: 15),

                  GestureDetector(
                    onTap: (){

                      showImagePicker(context);

                    },
                    child: Center(
                      child:   _tImage != null? Image.file(_tImage!, height: 155,):
                      Container(
                        height: 155,
                        width: 400,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            Image.asset('assets/cloud.png',width: 49.0, height: 49,),
                            const SizedBox(height: 10,),
                            Text('Upload a picture')
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Text('Upload multiple images'),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _tImage1 != null? Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Image.file(_tImage1!, height: 155,),
                        ),
                      ):

                      GestureDetector(
                        onTap: (){
                          imageFlag = 'image1';
                          showImagePicker1(context);
                        },
                        child: Container (height: 50, width: 50, decoration:
                        BoxDecoration (shape: BoxShape.circle, color: Color (0xffF7825C),),
                          alignment: Alignment.center, child: Icon (Icons.add, color: Colors.white,),),
                      ),


                      _tImage2 != null? Expanded(child: Image.file(_tImage2!, height: 155,)):

                      GestureDetector(
                        onTap: (){
                          imageFlag = 'image2';

                          setState(() { });
                          showImagePicker1(context);
                        },
                        child: Container (height: 50, width: 50, decoration:
                        BoxDecoration (shape: BoxShape.circle, color: Color (0xffF7825C),),
                          alignment: Alignment.center, child: Icon (Icons.add, color: Colors.white,),),
                      ),

                      _tImage3 != null? Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Image.file(_tImage3!, height: 155,),
                        ),
                      ):

                      GestureDetector(
                        onTap: (){
                          imageFlag = 'image3';

                          setState(() { });
                          showImagePicker1(context);
                        },
                        child: Container (height: 50, width: 50, decoration:
                        BoxDecoration (shape: BoxShape.circle, color: Color (0xffF7825C),),
                          alignment: Alignment.center, child: Icon (Icons.add, color: Colors.white,),),
                      ),

                      _tImage4 != null? Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Image.file(_tImage4!, height: 155,),
                        ),
                      ):

                      GestureDetector(
                        onTap: (){
                          imageFlag = 'image4';

                          setState(() { });
                          showImagePicker1(context);
                        },
                        child: Container (height: 50, width: 50, decoration:
                        BoxDecoration (shape: BoxShape.circle, color: Color (0xffF7825C),),
                          alignment: Alignment.center, child: Icon (Icons.add, color: Colors.white,),),
                      ),
                    ],
                  ),

                  const SizedBox(height: 15),
                  MyDropdownFormField<States>(
                    items: _stateList,
                    displayText: (state) => state.name!,
                    onSelected: (state) {
                      setState(() {
                        _selectedState = state;
                        _selectedStateName  = state.name;
                        getArea(state.id);
                      });
                    },
                    labelText: 'State',
                  ),
                  const SizedBox(height: 15),
                  _areaList.length>0? MyDropdownFormField<Area>(
                    items: _areaList,
                    displayText: (area) => area.localName!,
                    onSelected: (area) {
                      setState(() {
                        _selectedArea = area;
                      });
                    },
                    labelText: 'Area',
                  ):SizedBox(),
                  const SizedBox(height: 20),
                  Text('Qualifications Description'),
                  const SizedBox(height: 10),

                  TextFormField(
                    controller: _cdescription,
                    keyboardType: TextInputType.multiline,
                    maxLines: 3,
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
                      hintText: "What qualifies you as a service provider, tell users why they should prefer your service to others  ",
                      hintStyle: TextStyle(
                        fontSize: 14.0,
                        color: Color.fromRGBO(105, 108, 121, 0.7),
                      ),
                    ),
                  ),

                  const SizedBox(height: 40),
                  ButtonGlobal(
                    isLoading:isLoading ,
                    ontap:(){
                      addservice();
                    },
                  //  OnBoardingPage(),
                    text: 'Add Service',
                    color: GlobalColors.primaryColor,
                    fontsize: 15,
                  ),
                  const SizedBox(height: 60),



                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 50,
        color: Colors.white24,
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Can\'t submit service, send a feedback?',
            ),
            InkWell(
              onTap: (){
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => sendSOS()),
                );
              },
              child: Text(
                ' Click here',
                style: TextStyle(
                  color: GlobalColors.primaryColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future getImage1(ImageSource imageSource, BuildContext context)async{
    try {
      final image = await ImagePicker().pickImage(source: imageSource,
        // maxHeight: 150.0,
        maxWidth: 500.0,

      );
      if (image == null) {
        return;
      }else{
        print(image.path.toString());
        final imageTemporary = File(image.path);

      if(imageFlag=="image1")
        {
          setState(() {
            _tImage1 = imageTemporary;
            images.add(_tImage1!);
          });
        }else if(imageFlag=="image2"){
        setState(() {
          _tImage2 = imageTemporary;
          images.add(_tImage2!);
        });
        }else if(imageFlag=="image3"){
          setState(() {
            _tImage3 = imageTemporary;
            images.add(_tImage3!);
          });
        }
        else if(imageFlag=="image4"){
          setState(() {
            _tImage4 = imageTemporary;
            images.add(_tImage4!);
          });
      }

      }
      Navigator.of(context).pop();


    } catch(e){
      print("error::::::::: $e");
    }
  }

  Future getImage(ImageSource imageSource, BuildContext context)async{
    try {
      final image = await ImagePicker().pickImage(source: imageSource,
        // maxHeight: 150.0,
        maxWidth: 500.0,

      );
      if (image == null) {
        return;
      }else{
        print(image.path.toString());
        final imageTemporary = File(image.path);


        setState(() {
          _tImage = imageTemporary;
        });
      }
      Navigator.of(context).pop();


    } catch(e){
      print("error::::::::: $e");
    }
  }


  void showImagePicker(BuildContext context) {

    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Wrap(
          children: [
            ListTile(
              onTap: (){
                getImage(ImageSource.camera, context);
              },
              leading: Icon(Icons.camera),
              title: Text('Use Camera'),
            ),
            ListTile(
              onTap: (){
                getImage(ImageSource.gallery, context);
              },
              leading: Icon(Icons.picture_in_picture),
              title: Text('Choose Gallery'),
            ),

          ],
        );
      },
    );


  }





  void showImagePicker1(BuildContext context) {

    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Wrap(
          children: [
            ListTile(
              onTap: (){
                getImage1(ImageSource.camera, context);
              },
              leading: Icon(Icons.camera),
              title: Text('Use Camera'),
            ),
            ListTile(
              onTap: (){
                getImage1(ImageSource.gallery, context);
              },
              leading: Icon(Icons.picture_in_picture),
              title: Text('Choose Gallery'),
            ),

          ],
        );
      },
    );


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
      print("Exception - hopCategoryScreen.dart - _getCategory():" +
          e.toString());
    }
  }
  _getState() async {
    _stateList.clear();
    // _areaList.clear();
    setState(() { });
    try {
      bool isConnected = await br!.checkConnectivity();
      if (isConnected) {
        if (_isRecordPending) {
          // showOnlyLoaderDialog();
          await apiHelper?.getAllState().then((result) {
            //  hideLoader();
            if (result != null) {
              if (result.resp_code == "00") {
                List<States> _tList = result.recordList;

                //  print(_tList[0].name);

                // ref.watch(myprovider).setZone(_tList);

                if (_tList.isEmpty) {
                  _isRecordPending = false;
                }


                _stateList.addAll(_tList);
                print(" goit here");
                setState(() { });

                // } else {
                //   _zoneList = [];
              }
            }
          });
        }
      } else {
        showNetworkErrorSnackBar(_scaffoldkey);
      }
    } catch (e) {
      print("Exception - signupscreen.dart - _getstate():" + e.toString());
    }
  }

  void getArea(int? id) async {

    _areaList.clear();
    setState(() { });
   // _areaList.add(Area(id: 1));

    try {
      bool isConnected = await br!.checkConnectivity();
      if (isConnected) {
        if (_isRecordPending) {
          //showOnlyLoaderDialog();
          await apiHelper?.getAreaList(id!).then((result) {
            //  hideLoader();
            if (result != null) {
              if (result.resp_code == "00") {
                List<Area> _tList = result.recordList;

                if (_tList.isEmpty) {
                  _isRecordPending = false;
                }

                // ref.watch(myprovider).setArea(_tList);

                _areaList.addAll(_tList);

                setState(() {
                  //  _isMoreDataLoaded = false;
                });

                // } else {
                //   _zoneList = [];
              }
            }
          });
        }
      } else {
        showNetworkErrorSnackBar(_scaffoldkey);
      }
    } catch (e) {
      print("Exception - signupscreen.dart - _getarea():" + e.toString());
    }
  }
  _init() async {
    try {
      await  _getState();
      await  _getAllCategory() ;


      _isDataLoaded = true;
      setState(() {});
    } catch (e) {
      print("Exception - initcatgory.dart - _initFinal():" + e.toString());
    }
  }

  void addservice() async{
    try {

      _addServiceRequest.title = _ctitle.text.trim();
      _addServiceRequest.desc = _cdescription.text.trim();
      _addServiceRequest.amount = _camount.text.trim();



      if (_selectedCategory?.id == null) {
        showSnack(snackBarMessage:" please choose a category" );
        return;
      } else if (_ctitle.text.isEmpty ||  _camount.text.isEmpty|| _cdescription.text.isEmpty
          ) {
        showSnack(snackBarMessage:"Enter all fields ");

        return;
      }
      // else if (_tImage ==null ||_tImage3==null ||_tImage1==null||
      //     _tImage2==null||_tImage4==null ) {
      //
      //
      //   showSnack(snackBarMessage:"Choose one more image ");
      //
      //   return;
      // }
      else if (_tImage == null ) {


        showSnack(snackBarMessage:"Choose an image ");

        return;
      }
      else if (_selectedState == null ) {
        showSnack(snackBarMessage:"Select an state ");

        return;
      }
      else if (_selectedArea == null ) {
        showSnack(snackBarMessage:"Select an area ");

        return;
      }


        bool isConnected = await br!.checkConnectivity();
        if (isConnected) {
          setState(() {
            isLoading = true;
          });


          await apiHelper!.addService(id:global.user.id!,user_image:_tImage,
          title: _ctitle.text.trim(), desc: _cdescription.text.trim(),amount:
              _camount.text.trim(),state_id: _selectedState!.id,
              area_id: _selectedArea!.id,
            cat_id: _selectedCategory!.id,amountrange: '',unit: _selectedDuration
          ).then((result) async {
            if (result != null) {
              if (result.resp_code == "00") {
                setState(() {
                  isLoading = false;
                });
             int serviceid = result.data.id;
                print(serviceid);
              if(_tImage1 != null ||_tImage2  != null ||_tImage3 != null  ||_tImage1 != null ){
                addserviceImages(serviceid);
              }else{
                hideLoader();
                showSnackBar(snackBarMessage: 'Service submitted successfully');
              }


              //


              //


            //   Navigator.of(context).pushNamedAndRemoveUntil('home', (Route<dynamic> route) => false);


              }
              // else if(result.resp_code =="01" && result.resp_message.contains("please complete registration process"))
              // {
              //   nextScreen(context, 'login');
              // }


              else if(result.resp_code =="01")
              {
                hideLoader();
                showSnack(snackBarMessage: result.resp_message.toString());
              }

              else {
                hideLoader();



                if(result.errors[0].message != null){
                  showSnack( snackBarMessage: result.errors[0].message.toString());
                }else{
                  showSnack(snackBarMessage: result.resp_message.toString());
                }
              }
            }
          });
        }

        else {

          showSnack(snackBarMessage:" No network connection" );
        }

    } catch (e) {
      print("Exception - addserviceScreen.dart - _addsevice():" + e.toString());
    }
  }


  void addserviceImages(int serviceid) async{
    try {



      bool isConnected = await br!.checkConnectivity();
        if (isConnected) {
          //showOnlyLoaderDialog();
          await apiHelper!.addServiceImages(userid:global.user.id!,user_image:images,
              serviceid: serviceid
          ).then((result) async {
            if (result != null) {
              if (result.resp_code == "00") {



                showSnackBar(snackBarMessage: result.resp_message.toString());


                //hideLoader();


                Navigator.of(context).pushNamedAndRemoveUntil('home', (Route<dynamic> route) => false);


              }
              // else if(result.resp_code =="01" && result.resp_message.contains("please complete registration process"))
              // {
              //   nextScreen(context, 'login');
              // }


              else if(result.resp_code =="01")
              {
                hideLoader();
                showSnack(snackBarMessage: result.resp_message.toString());
              }

              else {
                hideLoader();



                if(result.errors[0].message != null){
                  showSnack( snackBarMessage: result.errors[0].message.toString());
                }else{
                  showSnack(snackBarMessage: result.message.toString());
                }
              }
            }
          });
        }

        else {

          showSnack(snackBarMessage:" No network connection" );
        }

    } catch (e) {
      print("Exception - signInScreen.dart - _loginWithEmail():" + e.toString());
    }
  }

  _showCupertinoModalSheet() {
    try {
      showCupertinoModalPopup(
        context: context,
        builder: (BuildContext context) => CupertinoActionSheet(
          title: Text(" Select Image"),
          actions: [
            CupertinoActionSheetAction(
              child: Text("Take a picture", style: TextStyle(color: Color(0xFF171D2C))),
              onPressed: () async {
                Navigator.pop(context);
                showOnlyLoaderDialog();
                _tImage = await br?.openCamera();
                hideLoader();

                setState(() {});
              },
            ),
            CupertinoActionSheetAction(
              child: Text("Choose from gallery", style: TextStyle(color: Color(0xFF171D2C))),
              onPressed: () async {
                Navigator.pop(context);
                showOnlyLoaderDialog();
                _tImage = await br?.selectImageFromGallery();
                hideLoader();

                setState(() {});
              },
            )
          ],
          cancelButton: CupertinoActionSheetAction(
            child: Text("Cancel", style: TextStyle(color: Color(0xFFFA692C))),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      );
    } catch (e) {
      print("Exception - accountSettingScreen.dart - _showCupertinoModalSheet():" + e.toString());
    }
  }



  @override
  void initState() {
    _init();

    // TODO: implement initState
    super.initState();
  }
}
