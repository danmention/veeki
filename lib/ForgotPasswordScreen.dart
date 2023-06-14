import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:veeki/LoginScreen.dart';
import 'package:veeki/VerifyingNumberScreen.dart';
import 'package:veeki/utils/constant.dart';
import 'package:veeki/utils/global.colors.dart';
import 'package:veeki/widgets/back.button.global.dart';
import 'package:veeki/widgets/button.global.dart';
import 'package:veeki/widgets/text.form.global.dart';

import 'models/businessLayer/base.dart';

class ForgotPasswordScreen extends Base {
  ForgotPasswordScreen({Key? key}) ;


  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends BaseState {

  final TextEditingController _cEmail = TextEditingController();
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     key: _scaffoldKey,
    appBar: AppBar(title: Text('Forgot Password',),),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                const SizedBox(height: 55),
                Text(
                  'Forgot Password',
                  style: TextStyle(
                      color: GlobalColors.textColor,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Text(
                  'Please enter your Email so we can help you recover your password.',
                  style: TextStyle(
                      color: GlobalColors.textColor,
                      fontSize: 15,
                      fontWeight: FontWeight.w500),
                  textAlign: TextAlign.center,
                ),

                ////EMAIL INPUT
                const SizedBox(height: 80),
                TextFormGlobal(
                  controller: _cEmail,
                  text: 'Email',
                  obscure: false,
                  textInputType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 40),

                ButtonGlobal(
                  ontap: (){
                    _forgotPassword();
                  },
                  text: 'Send',
                  color: GlobalColors.primaryColor,
                  fontsize: 20,
                ),
                const SizedBox(height: 60),

              ],
            ),
          ),
        ),
      ),

    );
  }

  _forgotPassword() async {
    try {
      if (_cEmail.text.isNotEmpty) {
        bool isConnected = await br!.checkConnectivity();
        if (isConnected) {
          showOnlyLoaderDialog();
          await apiHelper!.forgotPassword(_cEmail.text.trim()).then((result) {
            if (result != null) {
              if (result.resp_code == "00") {
                hideLoader();


                setState(() {});
              } else {
                hideLoader();
                showSnackBar(key: _scaffoldKey, snackBarMessage: '${result.message}');
              }
            }
          });
        } else {
          showNetworkErrorSnackBar(_scaffoldKey);
        }
      } else if (_cEmail.text.isEmpty) {
        showSnack( snackBarMessage: txt_please_enter_your_email);
      } else if (_cEmail.text.isNotEmpty && !EmailValidator.validate(_cEmail.text)) {
        showSnack( snackBarMessage: txt_please_enter_your_valid_email);
      }
    } catch (e) {
      print("Exception - forgotPasswordScreen.dart - _forgotPassword():" + e.toString());
    }
  }
}
