import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:spa/LoginScreen.dart';
import 'package:spa/utils/global.colors.dart';
import 'package:spa/widgets/back.button.global.dart';
import 'package:spa/widgets/button.global.dart';
import 'package:spa/widgets/text.form.global.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
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
                  textInputType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 20),
                TextFormGlobal(
                  controller: emailController,
                  text: 'Email',
                  obscure: false,
                  textInputType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 20),

                TextFormGlobal(
                  controller: mobileController,
                  text: 'Mobile',
                  obscure: false,
                  textInputType: TextInputType.text,
                ),
                const SizedBox(height: 20),
                TextFormGlobal(
                  controller: passwordController,
                  text: 'Password',
                  obscure: true,
                  textInputType: TextInputType.text,
                ),
                const SizedBox(height: 20),
                TextFormGlobal(
                  controller: confirmpasswordController,
                  text: 'Confirm Password',
                  obscure: true,
                  textInputType: TextInputType.text,
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
                  widget: LoginScreen(),
                  text: 'Sign Up',
                  color: GlobalColors.primaryColor,
                  fontsize: 20,
                ),
                const SizedBox(height: 60),

              ],
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
}
