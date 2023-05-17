import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:spa/LoginScreen.dart';
import 'package:spa/VerifyingNumberScreen.dart';
import 'package:spa/utils/global.colors.dart';
import 'package:spa/widgets/back.button.global.dart';
import 'package:spa/widgets/button.global.dart';
import 'package:spa/widgets/text.form.global.dart';

class ForgotPasswordScreen extends StatelessWidget {
  ForgotPasswordScreen({Key? key}) : super(key: key);
  final TextEditingController emailController = TextEditingController();



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
                BackButtonGlobal(
                  widget: LoginScreen(),
                ),
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
                const SizedBox(height: 100),
                TextFormGlobal(
                  controller: emailController,
                  text: 'Email',
                  obscure: false,
                  textInputType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 40),

                ButtonGlobal(
                  widget: VerifyingNumberScreen(),
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
}
