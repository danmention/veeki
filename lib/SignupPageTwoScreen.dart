import 'package:flutter/material.dart';
import 'package:veeki/utils/global.colors.dart';
import 'package:veeki/widgets/MyDropDownForm.dart';
import 'package:veeki/widgets/button.global.dart';
import 'package:veeki/widgets/text.form.global.dart';
import 'package:veeki/models/businessLayer/global.dart' as global;
import 'models/businessLayer/base.dart';
import 'models/request/signup_request.dart';
import 'models/response/category_response.dart';
import 'models/response/state_response.dart';

class SignupPageTwoScreen extends Base{
  SignupPageTwoScreen(this.signupRequest);
  SignupRequest signupRequest = SignupRequest();

  @override
  SignupPageTwoScreenState createState() {
    // TODO: implement createState
    return SignupPageTwoScreenState(this.signupRequest);
  }
  
}
class SignupPageTwoScreenState extends BaseState{
  SignupPageTwoScreenState(this.signupRequest);
  SignupRequest signupRequest = SignupRequest();

  String? birthDateInString;
  DateTime? birthDate;
  bool?  isDateSelected ;
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();
  bool _isDataLoaded = false;
  bool _isRecordPending = true;
  List<Category> _categoryList = [];
  List<States> _stateList = [];
  List<Area> _areaList = [];
  int? selected_area;
  String? _selectedGender;
  String? _selectedUserType;
  Category? _selectedCategory;
  States? _selectedState;
  String ? _selectedStateName;
  Area? _selectedArea;
  var gender = [
    "Male",
    "Female",
  ];

  var usertype = [
    "SERVICE_PROVIDER",
    "USER",
  ];

  final TextEditingController streetController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text('Step Two'),),
       body: SafeArea(
         child: SingleChildScrollView(
           child:   Padding(
             padding: const EdgeInsets.symmetric(horizontal: 16.0),
             child: Column(children: [
               const SizedBox(height: 25),
              Text('Complete the Registration Process',style: TextStyle(fontSize: 23, fontFamily: 'Roboto', fontWeight: FontWeight.w400),),
               const SizedBox(height: 35),






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
               Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [


                   Container(
                     width:200,
                     child: MyDropdownFormField<String>(
                       items: usertype,
                       displayText: (usertype) => usertype,
                       onSelected: (usertype) {
                         setState(() {
                           _selectedUserType = usertype;
                         });
                       },
                       labelText: 'Select Usertype',
                     ),
                   ),
                   // SizedBox(width: 10,),


                   Container(
                     width:150,
                     child: MyDropdownFormField<String>(
                       items: gender,
                       displayText: (area) => area,
                       onSelected: (area) {
                         setState(() {
                           _selectedGender = area;
                         });
                       },
                       labelText: 'Select Gender',
                     ),
                   ),

                 ],),
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
               MyDropdownFormField<Area>(
                 items: _areaList,
                 displayText: (area) => area.localName!,
                 onSelected: (area) {
                   setState(() {
                     _selectedArea = area;
                   });
                 },
                 labelText: 'Area',
               ),
               const SizedBox(height: 15),
               TextFormGlobal(
                 controller: streetController,
                 text: 'Enter Street Name',
                 obscure: false,
                 textInputType: TextInputType.streetAddress,
               ),

               const SizedBox(height: 15),
               Container(
                 height: 60,
                 child:   Row(

                   children: [
                     Padding(
                       padding: const EdgeInsets.all(8.0),
                       child: Text(birthDateInString ?? " Date of Birth", style: TextStyle(fontSize: 16),),
                     ), SizedBox(width: 5,),
                     Padding(
                       padding: const EdgeInsets.all(8.0),
                       child: GestureDetector(
                           child: new Icon(Icons.calendar_today),
                           onTap: ()async{
                             final datePick= await showDatePicker(
                                 context: context,
                                 initialDate: new DateTime.now(),
                                 firstDate: new DateTime(1900),
                                 lastDate: new DateTime(2100)
                             );
                             if(datePick!=null && datePick!=birthDate){
                               setState(() {
                                 birthDate=datePick;
                                 isDateSelected= true;

                                 // put it here
                                 birthDateInString = "${birthDate!.day}-${birthDate!.month}-${birthDate!.year}"; // 08/14/2019

                                 signupRequest.DateOfBirth = birthDateInString;

                                 print(birthDateInString);

                               });
                             }
                           }
                       ),
                     ) ,
                   ],
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 ),
                 decoration: BoxDecoration(
                   border: Border.all(width: 1, color: Colors.black12,),

                   borderRadius: BorderRadius.all(
                     Radius.circular(5.0),
                   ),


                 ),

               ),
               SizedBox(height: 40,),
               ButtonGlobal(
                 ontap:(){
                   _signUp();
                 } ,
                 text: 'Sign Up',
                 color: GlobalColors.primaryColor,
                 fontsize: 20,
               ),



               SizedBox(height: 40,)
             ],),
           ),





         ),
       ),
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

                // setState(() {
                //     _isMoreDataLoaded = false;
                // });
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

  _init() async {
    try {


      await  _getAllCategory() ;
     await  _getState();

      _isDataLoaded = true;
      setState(() {});
    } catch (e) {
      print("Exception - initcatgory.dart - _initFinal():" + e.toString());
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
        //  showOnlyLoaderDialog();
        //   CircularProgressIndicator(
        //     value: 0.3,
        //     color: Colors.greenAccent, //<-- SEE HERE
        //     backgroundColor: Colors.grey, //<-- SEE HERE
        //   );
          await apiHelper?.getAllState().then((result) {
           // hideLoader();
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
    try {
      bool isConnected = await br!.checkConnectivity();
      if (isConnected) {
        if (_isRecordPending) {
       //   showOnlyLoaderDialog();
          await apiHelper?.getAreaList(id!).then((result) {
           // hideLoader();
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

  @override
  void initState() {
    _init();

    // TODO: implement initState
    super.initState();
  }




  _signUp() async {
    try {





      signupRequest.category_id = _selectedCategory!.id;
      signupRequest.gender = _selectedGender;
      signupRequest.user_type = _selectedUserType;
      signupRequest.StreetAddress = streetController.text.trim();
      signupRequest.state = _selectedState!.name;
      signupRequest.city = _selectedArea!.localName;




      if (streetController.text.isEmpty) {
        showSnack( snackBarMessage: "Enter street address");
        return;

      }else  if (signupRequest.DateOfBirth == null) {
        showSnack( snackBarMessage: "Enter Date of birth");
        return;

      }
      else  if (signupRequest.gender == null) {
        showSnack( snackBarMessage: "Enter gender");
        return;

      }else  if (signupRequest.user_type == null) {
        showSnack( snackBarMessage: "Enter user type");
        return;

      }else  if (signupRequest.state == null) {
        showSnack( snackBarMessage: "Enter state");
        return;

      }


      bool isConnected = await br!.checkConnectivity();
      if (isConnected) {
       // showOnlyLoaderDialog();
        await apiHelper?.signUp(signupRequest).then((result) async {
          if (result != null) {


            if (result.resp_code == "00" ) {

             // hideLoader();
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => ChooseCategory(user_id:result.recordList.id ,)),
              // );
              //  ref.read(myprovider).setuserid(result.recordList.id );

              showSnack( snackBarMessage: " Sign up successful, pls login");
              nextScreen(context, 'login');

              //  await _sendOTP(_cMobile.text.trim());
            } else {
              hideLoader();



              if(result.errors[0].message != null){
                showSnack( snackBarMessage: result.errors[0].message.toString());
              }else{
                showSnack( snackBarMessage: result.message.toString());
              }
            }
          }


        });
      } else {
        showNetworkErrorSnackBar(_scaffoldkey);
      }



    } catch (e) {
      print("Exception - signUpScreen.dart - _signUp():" + e.toString());
    }
  }


}