import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:veeki/HomePage.dart';
import 'package:veeki/models/businessLayer/global.dart' as global;
import 'package:veeki/LoginScreen.dart';
import 'package:veeki/utils/global.colors.dart';
import 'package:veeki/widgets/button.global.dart';
import 'package:veeki/widgets/text.form.global.dart';

import 'models/businessLayer/base.dart';

class ResetPasswordScreen extends Base {
  ResetPasswordScreen({Key? key}) ;
  @override
  _ResetPasswordScreenState createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends BaseState {



  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmpasswordController = TextEditingController();
  final TextEditingController currentpasswordController = TextEditingController();

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool _isPasswordVisible = true;
  bool _isPasswordVisiblecurrent = true;
  bool _isPasswordVisibleconfirm = true;
   String? email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key:_scaffoldKey ,
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
                  'Reset Password',
                  style: TextStyle(
                      color: GlobalColors.textColor,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Text(
                  'Please enter your new password.',
                  style: TextStyle(
                      color: GlobalColors.textColor,
                      fontSize: 15,
                      fontWeight: FontWeight.w500),
                  textAlign: TextAlign.center,
                ),

                ////EMAIL INPUT
                const SizedBox(height: 100),
                TextFormGlobal(
                  controller: currentpasswordController,
                  text: 'Current password',
                  sufficeIcon:  IconButton(
                    icon: Icon(_isPasswordVisiblecurrent ? Icons.visibility_off : Icons.visibility, color:  IconTheme.of(context).color),
                    onPressed: () {
                      _isPasswordVisiblecurrent = !_isPasswordVisiblecurrent;
                      setState(() {});
                    },
                  ),
                  obscure: _isPasswordVisiblecurrent,
                  textInputType: TextInputType.text,
                ),
                const SizedBox(height: 40),
                TextFormGlobal(
                  controller: passwordController,
                  text: 'New password',
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
                const SizedBox(height: 40),
                TextFormGlobal(
                  controller: confirmpasswordController,
                  text: 'Confirm new Password',
                  sufficeIcon:  IconButton(
                    icon: Icon(_isPasswordVisibleconfirm ? Icons.visibility_off : Icons.visibility, color:  IconTheme.of(context).color),
                    onPressed: () {
                      _isPasswordVisibleconfirm = !_isPasswordVisibleconfirm;
                      setState(() {});
                    },
                  ),
                  obscure: _isPasswordVisibleconfirm,
                  textInputType: TextInputType.text,
                ),
                const SizedBox(height: 40),

                ButtonGlobal(
                  ontap:(){_changePassword();} ,
                  text: 'Reset Password',
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


  _changePassword() async {
    try {
      if (passwordController.text.isNotEmpty && passwordController.text.trim().length >= 6 && confirmpasswordController.text.isNotEmpty && passwordController.text.trim() == confirmpasswordController.text.trim()) {
        bool isConnected = await br!.checkConnectivity();
        if (isConnected) {
          showOnlyLoaderDialog();
          await apiHelper?.changePassword("${global.user.id}", currentpasswordController.text.trim(), passwordController.text.trim(), confirmpasswordController.text.trim()).then((result) {
            if (result != null) {
              if (result.resp_code == "00") {
                hideLoader();

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
      } else if (passwordController.text.isEmpty || passwordController.text.trim().length < 6) {
        showSnackBar(key: _scaffoldKey, snackBarMessage: 'Password should be of minimun 6 characters');
      } else if (confirmpasswordController.text.isEmpty || confirmpasswordController.text.trim() != passwordController.text.trim()) {
        showSnackBar(key: _scaffoldKey, snackBarMessage: 'Passwords do not match');
      }
      else if (currentpasswordController.text.isEmpty ) {
        showSnackBar(key: _scaffoldKey, snackBarMessage: 'Enter current password');
      }
    } catch (e) {
      print("Exception - resetPasswordScreen.dart - _changePassword():" + e.toString());
    }
  }
}
