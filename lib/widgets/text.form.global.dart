import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../utils/global.colors.dart';

class TextFormGlobal extends StatelessWidget{
  TextFormGlobal ({
    Key? key,
    required this.controller,
    this.sufficeIcon,
    required this.text,
    required this.textInputType,
     this.obscure})
    : super (key: key);
  final TextEditingController controller;
  final String text;
  final TextInputType textInputType;
  final bool? obscure;
  final Widget? sufficeIcon;

  @override
  Widget build(BuildContext context){
    return Container(
      height: 45,

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),

        boxShadow:[
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 7,
          ),
        ]

      ),
      child: TextFormField(

        controller: controller,
        keyboardType: textInputType,
        obscureText: obscure!,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 1,color: GlobalColors.primaryColor),
          ),
          hintText: text,
          suffixIcon: sufficeIcon,
          border: InputBorder.none,
          contentPadding: const EdgeInsets.all(10),
          hintStyle:const TextStyle(
            height: 1,
          ),
        ),
      ),
    );
  }
}




