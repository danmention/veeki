import 'dart:convert';




import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:hive_flutter/hive_flutter.dart';


import 'package:veeki/models/businessLayer/global.dart' as global;


import 'package:veeki/ForgotPasswordScreen.dart';
import 'package:veeki/HomePage.dart';
import 'package:veeki/models/businessLayer/global.dart';
import 'package:veeki/utils/constant.dart';
import 'package:veeki/utils/global.colors.dart';
import 'package:veeki/widgets/SplashScreen.dart';
import 'package:veeki/widgets/button.global.dart';
import 'package:veeki/widgets/text.form.global.dart';
import 'SignUpScreen.dart';
import 'models/businessLayer/base.dart';
import 'models/request/login_request.dart';

class LoginScreen extends Base {

  @override
  _LoginScrrenState createState() => _LoginScrrenState();
}
class _LoginScrrenState extends BaseState{



  final TextEditingController _cEmail = TextEditingController();
  final TextEditingController _cPassword = TextEditingController();
  GlobalKey<ScaffoldState> _scaffoldKey1  = GlobalKey<ScaffoldState>();
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  Box? box;
  bool _isRemember = false;
  bool _isPasswordVisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

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
                  Text(
                    'Welcome Back',
                    style: TextStyle(
                        color: GlobalColors.textColor,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Sign in to continue',
                    style: TextStyle(
                        color: GlobalColors.textColor,
                        fontSize: 13,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 70),
                  ////EMAIL INPUT
                  TextFormGlobal(
                    controller: _cEmail,
                    text: 'Email',
                    obscure: false,
                    textInputType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 20),
                  ////PASSWORD INPUT
                  TextFormGlobal(
                    controller: _cPassword,
                    text: 'Password',
                    sufficeIcon:  IconButton(
                      icon: Icon(_isPasswordVisible ? Icons.visibility_off : Icons.visibility, color:  IconTheme.of(context).color),
                      onPressed: () {
                        _isPasswordVisible = !_isPasswordVisible;
                        setState(() {});
                      },
                    ),
                    obscure: _isPasswordVisible,
                    textInputType: TextInputType.text,
                  ),
                  const SizedBox(height: 15),
                  Container(
                    height: 20,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Theme(
                            data: ThemeData(
                                unselectedWidgetColor: Color(0xff138D1f)),
                            child: Container(
                              child: Row(
                                children: <Widget>[
                                  Checkbox(
                                  //  value: _isRemember,
                                    value: true,
                                    checkColor: Colors.white,
                                    activeColor: GlobalColors.primaryColor,
                                    onChanged: (value) {
                                      //value = _isRemember;
                                      value = false;

                                      // if (_isRemember) {
                                      //   global.sp!.remove('isRememberMeEmail');
                                      // }
                                      // _isRemember = !_isRemember;
                                      // setState(() {});
                                    },
                                  ),
                                  Text(
                                    'Remember me',
                                    style: TextStyle(
                                        color: GlobalColors.textColor,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            )),
                        InkWell(
                          onTap: (){
                            Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) => ForgotPasswordScreen()),
                            );
                          },
                          child: Text('Forgot Password?',
                              style: TextStyle(
                                  color: GlobalColors.primaryColor,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 40),
                  ButtonGlobal(
                    ontap:(){
                      login();
                    },
                  //  OnBoardingPage(),
                    text: 'Sign In',
                    color: GlobalColors.primaryColor,
                    fontsize: 20,
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
              'You don\'t have an account?',
            ),
            InkWell(
              onTap: (){
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => SignUpScreen()),
                );
              },
              child: Text(
                ' Sign Up ',
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


  final assetsAudioPlayer = AssetsAudioPlayer();

  void login() async{
    try {


      Loginrequest _user = new Loginrequest();
      _user.email = _cEmail.text.trim();
      _user.password = _cPassword.text.trim();


      if (_cEmail.text.isNotEmpty && _cPassword.text.isNotEmpty && EmailValidator.validate(_cEmail.text) ) {
        bool isConnected = await br!.checkConnectivity();
        if (isConnected) {
        // showOnlyLoaderDialog();
          await apiHelper!.loginWithEmail(_user).then((result) async {
            if (result != null) {
              if (result.resp_code == "00") {

                global.user = result.recordList.user;
                global.token = result.recordList.tokenData;


                global.sp?.setString('currentUser', json.encode(global.user.toJson()));
                global.sp?.setString('currentToken', json.encode(global.token.toJson()));

                box = await Hive.openBox("user");
                box!.put('email', '${global.user.email}');


                print("This is the key of the house >>>>>>>>>>>>>>>>>${global.firebaseToken}");
                // global.sp?.setString('email',_cEmail.text );
                //
                // hideLoader();
                // hideLoader();




               Navigator.of(context).pushNamedAndRemoveUntil('home', (Route<dynamic> route) => false);

                if (_isRemember) {
                  global.sp?.setString('isRememberMeEmail', global.user.email!);
                }
                // await getCurrentPosition().then((_) async {
                //   if (global.lat != null && global.lng != null) {
                //     hideLoader();
                //
                //   } else {
                //     hideLoader();
                //     showSnack(snackBarMessage: txt_please_enablet_location_permission_to_use_app);
                //   }
                // });
              }
              // else if(result.resp_code =="01" && result.resp_message.contains("please complete registration process"))
              // {
              //   nextScreen(context, 'login');
              // }


              else if(result.resp_code =="01")
              {
                //hideLoader();
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
      } else if (_cEmail.text.isEmpty) {
        //showSnackBar(key: _scaffoldKey, snackBarMessage: txt_please_enter_your_email);
        //ScaffoldMessenger.of(context).showSnackBar(_snackBar);
        showSnack(snackBarMessage:txt_please_enter_your_email );

      } else if (_cEmail.text.isNotEmpty && !EmailValidator.validate(_cEmail.text)) {
        showSnack(snackBarMessage:txt_please_enter_your_valid_email );

        // showSnackBar(key: _scaffoldKey, snackBarMessage: txt_please_enter_your_valid_email);
      } else if (_cPassword.text.isEmpty || _cPassword.text.trim().length < 5) {
        showSnack(snackBarMessage: txt_password_should_be_of_minimum_8_character);
      }
    } catch (e) {
      print("Exception - signInScreen.dart - _loginWithEmail():" + e.toString());
    }
  }

  void addemail()async {
    box = await Hive.openBox("user");
    if( box!.get('email') !=  null){
      _cEmail.text = box!.get('email');}
  }



  @override
  void initState() {

    addemail();
    // TODO: implement initState
    super.initState();
  }
}
