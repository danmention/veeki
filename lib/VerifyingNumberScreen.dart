import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:veeki/ForgotPasswordScreen.dart';
import 'package:veeki/ResetPasswordScreen.dart';
import 'package:veeki/utils/global.colors.dart';
import 'package:veeki/widgets/back.button.global.dart';
import 'package:veeki/widgets/button.global.dart';
import 'package:veeki/widgets/text.form.global.dart';

class VerifyingNumberScreen extends StatefulWidget {
  VerifyingNumberScreen({Key? key}) : super(key: key);
  @override
  _VerifyingNumberScreenState createState() => _VerifyingNumberScreenState();
}

class _VerifyingNumberScreenState extends State<VerifyingNumberScreen>{

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
                  widget: ForgotPasswordScreen(),
                ),
                const SizedBox(height: 55),
                Text(
                  'Verifying Number',
                  style: TextStyle(
                      color: GlobalColors.textColor,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Text(
                  'Please enter the verification code we just sent to your phone',
                  style: TextStyle(
                      color: GlobalColors.textColor,
                      fontSize: 17,
                      fontWeight: FontWeight.w500),
                  textAlign: TextAlign.center,
                ),

                ////EMAIL INPUT
                const SizedBox(height: 50),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 50.0),

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _textFieldOTP(first: true, last: false),
                      _textFieldOTP(first: false, last: false),
                      _textFieldOTP(first: false, last: false),
                      _textFieldOTP(first: false, last: false),
                      _textFieldOTP(first: true, last: false),
                    ],
                  ),
                ),
                const SizedBox(height: 40),
                Container(
                  alignment: AlignmentDirectional.bottomEnd,
                  child: Text(
                    'Resend code 0:50',
                    style: TextStyle(
                        color: GlobalColors.primaryColor,
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.right,
                  ),
                ),
                const SizedBox(height: 15),
                ButtonGlobal(
                  ontap: (){

                    ResetPasswordScreen();
                  }
                  ,
                  text: 'Verify',
                  color: GlobalColors.primaryColor,
                  fontsize: 20,
                ),
                const SizedBox(height: 30),
                const Text(
                    'By tapping verify code above, you agree to the Terms of service, privacy policy and cookies policy',
                  style: TextStyle(
                      color: Colors.black26,
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                  textAlign: TextAlign.center,
                )

              ],
            ),
          ),
        ),
      ),

    );
  }

  _textFieldOTP({bool? first,last}){
    return Container(
      height: 60,

      child: AspectRatio(
        aspectRatio: 0.7,
        child: TextField(
          autofocus: true,
          onChanged: (value){
            if (value.length == 1 && last == false){
              FocusScope.of(context).nextFocus();
            }
            if (value.length == 0 && last == false){
              FocusScope.of(context).previousFocus();
            }
          },
          showCursor: false,
          readOnly: false,
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
          keyboardType: TextInputType.number,
          maxLength: 1,
          decoration: InputDecoration(
            counter: Offstage(),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 2,color: Colors.black12),
              borderRadius: BorderRadius.circular(12),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 2,color: GlobalColors.primaryColor),
              borderRadius: BorderRadius.circular(12),
            )
          )
        ),
      ),
    );
  }
}
