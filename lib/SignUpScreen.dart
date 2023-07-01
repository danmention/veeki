import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:veeki/LoginScreen.dart';
import 'package:veeki/SignupPageTwoScreen.dart';
import 'package:veeki/utils/constant.dart';
import 'package:veeki/utils/global.colors.dart';
import 'package:veeki/widgets/MyDropDownForm.dart';
import 'package:veeki/widgets/back.button.global.dart';
import 'package:veeki/widgets/button.global.dart';
import 'package:veeki/widgets/dropdown.global.dart';
import 'package:veeki/widgets/text.form.global.dart';

import 'models/businessLayer/base.dart';
import 'models/request/signup_request.dart';
import 'models/response/category_response.dart';
import 'models/response/state_response.dart';

class SignUpScreen extends Base {

  @override
  _SignUpState createState() => _SignUpState();
}


class _SignUpState extends BaseState{
  SignupRequest signupRequest = SignupRequest();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController streetController = TextEditingController();

  GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();
  bool _isDataLoaded = false;
  bool _isRecordPending = true;



  bool _isPasswordVisible = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldkey,
      body: SingleChildScrollView(
        child: SafeArea(
 
          child: Container(
            
            width: double.infinity,
            padding: const EdgeInsets.all(15.0),
            child: Form(
              key: _formkey,
              child: Column(

                crossAxisAlignment: CrossAxisAlignment.start,
                children:  [
                  BackButtonGlobal(
                    widget: LoginScreen(),
                  ),
                  const SizedBox(height: 55),
                  Text(
                    'Warm welcome',
                    style: TextStyle(
                        color: GlobalColors.textColor,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Sign up to join',
                    style: TextStyle(
                        color: GlobalColors.textColor,
                        fontSize: 13,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 40),

                  TextFormGlobal(
                    controller: nameController,
                    text: 'Name',
                    obscure: false,
                    textInputType: TextInputType.text,
                  ),
                  const SizedBox(height: 20),
                  TextFormGlobal(
                    controller: emailController,
                    text: 'Email',
                    obscure: false,
                    textInputType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 10),

                  TextFormGlobal(
                    controller: mobileController,
                    text: 'Mobile',
                    obscure: false,
                    textInputType: TextInputType.phone,
                  ),
                  const SizedBox(height: 10),
                  TextFormGlobal(
                    controller: passwordController,
                    text: 'Password',

                    textInputType: TextInputType.text,
                    sufficeIcon:  IconButton(
                      icon: Icon(_isPasswordVisible ? Icons.visibility_off : Icons.visibility, color:  IconTheme.of(context).color),
                      onPressed: () {
                        _isPasswordVisible = !_isPasswordVisible;
                        setState(() {});
                      },
                    ),
                    obscure: _isPasswordVisible,
                  ),





                  const SizedBox(height: 70),
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
                                    value: true,
                                    checkColor: Colors.white,
                                    activeColor: GlobalColors.primaryColor,
                                    onChanged: (value) {
                                      value = false;
                                    },
                                  ),
                                  Text(
                                    'I agree to the ',
                                    style: TextStyle(
                                        color: GlobalColors.textColor,
                                    ),
                                  ),Text(
                                    'Term of service',
                                    style: TextStyle(
                                        color: GlobalColors.textColor,
                                        fontWeight: FontWeight.bold
                                    ),
                                  ),
                                ],
                              ),
                            )),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  ButtonGlobal(
                    ontap:(){
                      _signUp();
                    } ,
                    text: 'Next',
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
              'Already have an account?',
            ),
            InkWell(
              onTap: (){
                nextScreen(context, "login");
              },
              child: Text(
                ' Sign In ',
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
  @override
  void initState() {
    //_init();
    // TODO: implement initState
    super.initState();
  }




  _signUp() async {
    try {




      signupRequest.fullname = nameController.text.trim();
      signupRequest.email = emailController.text.trim();
      signupRequest.phone = mobileController.text.trim();
      signupRequest.password = passwordController.text.trim();
      //
      // signupRequest.category_id = 1;
      // signupRequest.gender = "Male";
      // signupRequest.user_type = "USER";
      // signupRequest.StreetAddress = "00";
      // signupRequest.state = "lagos";
      // signupRequest.city = "Lagos";
      // signupRequest.DateOfBirth = "24-12-1990";



      // if (_cName.text.isNotEmpty &&
      //     EmailValidator.validate(_cEmail.text) && _cEmail.text.isNotEmpty && _cMobile.text.isNotEmpty && _cMobile.text.trim().length == 10 && _cPassword.text.isNotEmpty &&
      //     _cPassword.text.trim().length >= 6
      //
      //     )


      if (nameController.text.isEmpty) {
        showSnack( snackBarMessage: txt_please_enter_your_name);
        return;
      } else if (emailController.text.isEmpty) {
        showSnack( snackBarMessage: txt_please_enter_your_email);
        return;
      } else if (emailController.text.isNotEmpty && !EmailValidator.validate(emailController.text)) {
        showSnack( snackBarMessage: txt_please_enter_your_valid_email);
        return;
      } else if (mobileController.text.isEmpty || (mobileController.text.isNotEmpty && mobileController.text.trim().length < 10)) {
        showSnack( snackBarMessage: txt_please_enter_valid_mobile_number);
        return;
      } else if (passwordController.text.isEmpty) {
        showSnack( snackBarMessage: txt_please_enter_your_password);
        return;
      } else if (passwordController.text.isNotEmpty && passwordController.text.trim().length < 6) {
        showSnack( snackBarMessage: txt_password_should_be_of_minimum_8_character);
        return;
      }


      bool isConnected = await br!.checkConnectivity();
      if (isConnected) {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) =>
              SignupPageTwoScreen(signupRequest)),);

      } else {
        showNetworkErrorSnackBar(_scaffoldkey);
      }



    } catch (e) {
      print("Exception - signUpScreen.dart - _signUp():" + e.toString());
    }
  }
}
