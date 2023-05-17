import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:spa/ForgotPasswordScreen.dart';
import 'package:spa/HomePage.dart';
import 'package:spa/utils/global.colors.dart';
import 'package:spa/widgets/SplashScreen.dart';
import 'package:spa/widgets/button.global.dart';
import 'package:spa/widgets/text.form.global.dart';
import 'SignUpScreen.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

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
                  controller: emailController,
                  text: 'Email',
                  obscure: false,
                  textInputType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 20),
                ////PASSWORD INPUT
                TextFormGlobal(
                  controller: passwordController,
                  text: 'Password',
                  obscure: true,
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
                                  value: true,
                                  checkColor: Colors.white,
                                  activeColor: GlobalColors.primaryColor,
                                  onChanged: (value) {
                                    value = false;
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
                  widget: OnBoardingPage(),
                  text: 'Sign In',
                  color: GlobalColors.primaryColor,
                  fontsize: 20,
                ),
                const SizedBox(height: 60),

                Text(
                  'Or sign in with social account',
                  style: TextStyle(
                      color: GlobalColors.textColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                ),
                const SizedBox(height: 15),
                ButtonGlobal(
                  widget: HomePage(),
                  text: 'Sign In with PhoneNumber',
                  color: GlobalColors.primaryColor,
                  fontsize: 15,
                ),
                const SizedBox(height: 20),
                ButtonGlobal(
                  widget: HomePage(),
                  text: 'Sign In with facebook',
                  color: HexColor('#5160b0'),
                  fontsize: 15,
                ),
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
}
