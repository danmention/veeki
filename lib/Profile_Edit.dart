import 'package:flutter/material.dart';

import 'package:veeki/HomePage.dart';
import 'package:veeki/utils/global.colors.dart';
import 'package:veeki/widgets/BottomNavBar.dart';
import 'package:veeki/widgets/MyDropDownForm.dart';
import 'package:veeki/widgets/Profile.Buttons.dart';
import 'package:veeki/widgets/back.button.global.dart';
import 'package:veeki/widgets/text.form.global.dart';
import 'package:veeki/models/businessLayer/global.dart' as global;
import 'models/businessLayer/base.dart';
import 'models/request/signup_request.dart';
import 'models/response/category_response.dart';
import 'models/response/state_response.dart';

class EditProfile extends Base {
  @override
  _EditProfileState createState() => _EditProfileState();
  EditProfile ({Key? key,});
}

class _EditProfileState extends BaseState{

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
    "MALE",
    "FEMALE",
  ];

  var usertype = [
    "SERVICE_PROVIDER",
    "USER",
  ];

  final TextEditingController streetController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  SignupRequest signupRequest = SignupRequest();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar( elevation: 0,
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        backgroundColor: Colors.transparent,),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [


                Container(
                  //margin: EdgeInsets.only(bottom: 50),
                  height: 170,
                  child:Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      global.user.profileImage != ''?
                    CircleAvatar(
                    backgroundColor: GlobalColors.primaryColor,
                    radius: 55,
                    child: CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage('${ global.user.profileImage }'),
                    ),
                  )

                          :
                      CircleAvatar(
                        backgroundColor: GlobalColors.primaryColor,
                        radius: 55,
                        child: CircleAvatar(
                          radius: 50,
                          backgroundImage: AssetImage('Images/download.png'),
                        ),
                      ),
                      Text(
                        '${global.user.fullName}',
                        style: TextStyle(

                          fontSize: 20,fontFamily: 'Lato',
                        ),
                      ),
                      SizedBox(height: 20,),
                    ],
                  ),
                ),

                Column(children: [
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



                  const SizedBox(height: 10),

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
                  TextFormGlobal(
                    controller: mobileController,
                    text: 'Phone number',
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

                ],),



                GestureDetector(
                  onTap: (){
                    _updateProfile();
                  },
                  child: Container(
                    margin: EdgeInsets.only(top: 20),

                    height: 50,
                    width: 150,
                    decoration: BoxDecoration(
                      color: GlobalColors.secondaryColor,
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [

                        Text(
                          "Update Profile",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                            fontSize: 17,
                          ),

                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(height: 40,)

              ],
            ),
          ),

        ),
      ),
      bottomNavigationBar: Container(
        height: 60,
          child: BottomNavBar(id: "profile",)
      ),
    );
  }




  _updateProfile() async {
    try {
    //  if (_selectedState &&  ) {
        bool isConnected = await br!.checkConnectivity();
        if (isConnected) {
         // showOnlyLoaderDialog();
          await apiHelper?.updateProfile(
              global.user.id!,mobileController.text.trim(),
              birthDateInString!,_selectedArea!.localName!,
              _selectedState!.name!, streetController.text.trim()
          ).then((result) {
            if (result != null) {
              if (result.resp_code == "00") {
             //   hideLoader();

                showSnack( snackBarMessage: '${result.resp_description}');

                setState(() {});
              } else {
                hideLoader();
                showSnack( snackBarMessage: '${result.resp_message}');
              }
            }
          });
        } else {
          showSnack(snackBarMessage: "No network  connection");
        }
      // } else if (passwordController.text.isEmpty || passwordController.text.trim().length < 6) {
      //   showSnackBar(key: _scaffoldKey, snackBarMessage: 'Password should be of minimun 6 characters');
      // } else if (confirmpasswordController.text.isEmpty || confirmpasswordController.text.trim() != passwordController.text.trim()) {
      //   showSnackBar(key: _scaffoldKey, snackBarMessage: 'Passwords do not match');
      // }
      // else if (currentpasswordController.text.isEmpty ) {
      //   showSnackBar(key: _scaffoldKey, snackBarMessage: 'Enter current password');
      // }
    } catch (e) {
      print("Exception - resetPasswordScreen.dart - _changePassword():" + e.toString());
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
      print("Exception - hopCategoryScreen.dart - _getCategory():" +
          e.toString());
    }
  }

  _init() async {
    try {
      if(global.user.phone != null)
      mobileController.text = global.user.phone!;

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

  @override
  void initState() {
    _init();

    // TODO: implement initState
    super.initState();
  }
}
