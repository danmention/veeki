import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shimmer/shimmer.dart';
import 'package:veeki/HomePage.dart';
import 'package:veeki/models/businessLayer/global.dart' as global;
import 'package:veeki/utils/global.colors.dart';
import 'package:veeki/widgets/BottomNavBar.dart';
import 'package:veeki/widgets/Profile.Buttons.dart';
import 'package:veeki/widgets/back.button.global.dart';

import 'LoginScreen.dart';
import 'models/businessLayer/base.dart';
import 'models/userModel.dart';

class Profile extends Base {
  @override
  _ProfileState createState() => _ProfileState();
  Profile ({Key? key,});
}

class _ProfileState extends BaseState{

  GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool _isDataLoaded = true;
  File? _tImage;
  SharedPreferences? prefs;
  List<CurrentUser> ? _userList;
  CurrentUser? _user;
  String? savedPath ;
  bool isSwitched = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20.0),
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Container(
                      height: 10,
                        child: BackButtonGlobal(
                          widget: HomePage(),
                        )
                    ),
                  ],
                ),
                Container(
                  //margin: EdgeInsets.only(bottom: 50),
                  height: 280,
                  child:Column(

                    children: [
                      _tImage != null?

                      Container(
                        margin: EdgeInsets.only(top: 10),
                        height: MediaQuery.of(context).size.height * 0.20,
                        width: MediaQuery.of(context).size.height * 0.20,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Theme.of(context).cardTheme.color,
                          borderRadius: new BorderRadius.all(
                            new Radius.circular(MediaQuery.of(context).size.height * 0.17),
                          ),
                          image: DecorationImage(
                              image: FileImage(_tImage!),
                              fit: BoxFit.cover
                          ),
                          border: new Border.all(
                            color: Theme.of(context).primaryColor,
                            width: 3.0,
                          ),
                        ),
                      )
                          :
                      Center(
                        child:
                        global.user.profileImage != null
                            ?
                        //
                          Container(
                            height: MediaQuery.of(context).size.height * 0.2,
                            width: MediaQuery.of(context).size.height * 0.2,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100.0),
                              image: DecorationImage(
                                  image: NetworkImage(
                                     '${global.user.profileImage}'
                                  ), fit: BoxFit.cover)
                          ),
                        )

                        // CachedNetworkImage(
                        //   //imageUrl: '${global.baseUrlForImage}${global.user.photoPath}',
                        //   imageUrl: '${global.user.profileImage}',
                        //   imageBuilder: (context, imageProvider) => Container(
                        //     height: MediaQuery.of(context).size.height * 0.17,
                        //     width: MediaQuery.of(context).size.height * 0.17,
                        //     alignment: Alignment.center,
                        //     decoration: BoxDecoration(
                        //       color: Theme.of(context).cardTheme.color,
                        //       borderRadius: new BorderRadius.all(
                        //         new Radius.circular(MediaQuery.of(context).size.height * 0.17),
                        //       ),
                        //       image: DecorationImage(image: imageProvider),
                        //       border: new Border.all(
                        //         color: Theme.of(context).primaryColor,
                        //         width: 3.0,
                        //       ),
                        //     ),
                        //   ),
                        //   placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                        //   errorWidget: (context, url, error) => Icon(Icons.error),
                        // )
                            :

                        Container(
                          margin: EdgeInsets.only(top: 20),
                          height: MediaQuery.of(context).size.height * 0.17,
                          width: MediaQuery.of(context).size.height * 0.17,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                                    '${ savedPath}'
                                ), fit: BoxFit.cover)

                            ,
                            color: Theme.of(context).cardTheme.color,
                            borderRadius: new BorderRadius.all(
                              new Radius.circular(MediaQuery.of(context).size.height * 0.17),
                            ),
                            border: new Border.all(
                              color: Theme.of(context).primaryColor,
                              width: 3.0,
                            ),
                          ),
                          child: Icon(
                            Icons.person,
                            size: 50,
                          ),
                        ),
                      ),







                      TextButton(
                          child: Text('Change Image'),
                          onPressed: () {
                            _showCupertinoModalSheet();
                          }
                      ),


                      Text(
                        '${global.user.fullName}',
                        style: TextStyle(

                          fontSize: 20,fontFamily: 'Lato',
                        ),
                      ),
                      Row(
                        children: [
                          Text('Are you available for work ? ',   style: TextStyle(

                            fontSize: 15,fontFamily: 'Roboto',
                          ),),
                      Switch(
                      value: isSwitched,
                          onChanged: (value) {
                          setState(() {
                          isSwitched = value;
                          print(isSwitched);

                          _setavailability();
                          });})
                        ],
                      ),

                      // Text("Fahim Ekan",
                      //   style: TextStyle(
                      //     fontWeight: FontWeight.bold,
                      //     fontSize: 20,
                      //   ),
                      // ),
                      SizedBox(height: 10,),
                    ],
                  ),
                ),
                GestureDetector(
                    onTap: (){
                      nextScreen(context, 'editprofile');
                    },
                    child: ProfileButton(text1: "Account Settings", text2: "Name, email, address, contact number", icon: Icons.person)),
                ProfileButton(text1: "Payment Method", text2: "Add a new payment card", icon: Icons.credit_card_outlined),
                 ProfileButton(text1: "Booking Management", text2: "Manage your booking system", icon: Icons.cases_outlined),
                // ProfileButton(text1: "Reward points program", text2: "You've 50 reward points", icon: Icons.card_giftcard_outlined),
               // ProfileButton(text1: "Pricing and offers", text2: "Get every week special offers and affor...", icon: Icons.local_offer_outlined),
                GestureDetector(
                    onTap: (){
                      nextScreen(context, "resetpassword");
                    },
                    child: ProfileButton(text1: "Change Password", text2: "Get a new password", icon: Icons.local_offer_outlined)),
                ProfileButton(text1: "Terms and services", text2: "See our terms and services", icon: Icons.design_services_outlined),

                GestureDetector(
                  onTap: ()async{
                    global.sp?.remove("currentUser");

                   nextScreen(context, "login");
                    global.user = new CurrentUser();
                  },
                  child: Container(
                    margin: EdgeInsets.only(top: 20),
                    padding: EdgeInsets.only(top: 5),
                    height: 40,
                    width: 150,
                    decoration: BoxDecoration(
                      color: GlobalColors.secondaryColor,
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(
                            Icons.logout_rounded,
                          color: Colors.white,
                          size: 17,
                        ),
                        Text(
                          "Sign Out",
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




  @override
  void initState() {

    // TODO: implement initState
    super.initState();

    if (global.user.id == null) {
      Future.delayed(Duration.zero, () {
        Navigator.of(context).push(
          MaterialPageRoute(
              builder: (context) => LoginScreen(

              )),
        );
      });
    }
    _init();
  }

  _init() async {
    try {

      await _getUserProfile();
      _isDataLoaded = true;
      if (global.user.availability != null){
        if(global.user.availability == "ACTIVE"){
          isSwitched = true;
        }else if(global.user.availability == "INACTIVE"){
          isSwitched = false;
        }
      }


      setState(() {});
    } catch (e) {
      print("Exception - profileScreen.dart - _init():" + e.toString());
    }
  }



  _setavailability() async {
    try {
      bool isConnected = await br!.checkConnectivity();
      if (isConnected) {
        await apiHelper?.setAvailability(global.user.id!, isSwitched==true?"ACTIVE":"INACTIVE").then((result) {
          if (result != null) {
            if (result.resp_code == "00") {





            }
          }
        });
      } else {
        showNetworkErrorSnackBar(_scaffoldKey);
      }
    } catch (e) {
      print("Exception - profileScreen.dart - _getUserProfile():" + e.toString());
    }
  }




  _getUserProfile() async {
    try {
      bool isConnected = await br!.checkConnectivity();
      if (isConnected) {
        await apiHelper?.getUserProfile(global.user.id!).then((result) {
          if (result != null) {
            if (result.resp_code == "00") {
              global.user  = result.recordList[0];





              global.sp?.setString('currentUser', json.encode(global.user.toJson()));
              //     _user = result.recordList;
              //  int _tCartCount = global.user.cart_count;
              // global.user = _user!;
              //global.user.cart_count = _tCartCount;

              //  global.sp!.setString('currentUser', json.encode(global.user.toJson()));
              //global.sp!.setString('currentUser', json.encode(global.user.toJson()));
            }
          }
        });
      } else {
        showNetworkErrorSnackBar(_scaffoldKey);
      }
    } catch (e) {
      print("Exception - profileScreen.dart - _getUserProfile():" + e.toString());
    }
  }

  Future<void> savePath(String path) async {
     prefs = await SharedPreferences.getInstance();
    await prefs!.setString('path', path);
  }

  Future<String> getPath() async {
     prefs = await SharedPreferences.getInstance();
    String path = prefs!.getString('path') ?? '';
    return path;
  }
  _updateUserProfileImage(File? _tImage) async {
    try {
      bool isConnected = await br!.checkConnectivity();
      if (isConnected) {
        await apiHelper?.updateProfileImage(id:global.user.id!,user_image:_tImage ).then((result) {
          if (result != null) {
            if (result.resp_code == "00") {
              _user = result.recordList;
              savePath(_user!.profileImage!);

              print(_user!.profileImage);
              showSnack(snackBarMessage: 'Image uploaded successfully ');

              // global.user = _user!;


              //  global.sp!.setString('currentUser', json.encode(global.user.toJson()));
            }
          }
        });
      } else {
        showSnack(snackBarMessage: 'No Internet Connection ');
      }
    } catch (e) {
      print("Exception - profileScreen.dart - _getUserProfile():" + e.toString());
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
                _tImage = await br?.getCameraImage();
                _updateUserProfileImage(_tImage);
                hideLoader();

                setState(() {});
              },
            ),
            CupertinoActionSheetAction(
              child: Text("Choose from gallery", style: TextStyle(color: Color(0xFF171D2C))),
              onPressed: () async {
                Navigator.pop(context);
                showOnlyLoaderDialog();
                _tImage = await br?.getGalleryImage();
                _updateUserProfileImage(_tImage);
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




  Widget _shimmer() {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: SingleChildScrollView(
          child: Column(
            children: [
              CircleAvatar(
                radius: 60,
                child: Card(),
              ),
              SizedBox(
                height: 10,
              ),
              ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 5,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 80,
                              height: 80,
                              child: Card(margin: EdgeInsets.only(top: 5, bottom: 5)),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: MediaQuery.of(context).size.width - 220,
                                  height: 40,
                                  child: Card(margin: EdgeInsets.only(top: 5, bottom: 5, left: 5)),
                                ),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width - 120,
                                  height: 40,
                                  child: Card(margin: EdgeInsets.only(top: 5, bottom: 5, left: 5)),
                                ),
                              ],
                            )
                          ],
                        ),
                        SizedBox(
                          height: 25,
                        )
                      ],
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }



}
