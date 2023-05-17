import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:spa/LoginScreen.dart';
import 'package:spa/utils/global.colors.dart';
import 'package:spa/widgets/button.global.dart';
import 'package:spa/widgets/text.form.global.dart';

class ResetPasswordScreen extends StatelessWidget {
  ResetPasswordScreen({Key? key}) : super(key: key);
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmpasswordController = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Scaffold(

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
                  controller: passwordController,
                  text: 'New password',
                  obscure: true,
                  textInputType: TextInputType.text,
                ),
                const SizedBox(height: 40),
                TextFormGlobal(
                  controller: confirmpasswordController,
                  text: 'Confirm new Password',
                  obscure: true,
                  textInputType: TextInputType.text,
                ),
                const SizedBox(height: 40),

                ButtonGlobal(
                  widget: LoginScreen(),
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
}
