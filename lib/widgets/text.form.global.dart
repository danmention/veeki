import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../utils/global.colors.dart';

class TextFormGlobal extends StatelessWidget{
  TextFormGlobal ({
    Key? key,
     this.controller,
    this.sufficeIcon,
    this.onsave,
    required this.text,
    required this.textInputType,
     this.obscure})
    : super (key: key);
  final TextEditingController? controller;
  final String text;
  final TextInputType textInputType;
  final bool? obscure;
  final Widget? sufficeIcon;
  final Function(String?)? onsave;

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
        onSaved: onsave,
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


class TextFormNumberGlobal extends StatelessWidget{
  TextFormNumberGlobal ({
    Key? key,
     this.controller,
    this.sufficeIcon,
    this.onsave,
    required this.text,
    required this.textInputType,
    this.obscure})
      : super (key: key);
  final TextEditingController? controller;
  final String text;
  final TextInputType textInputType;
  final bool? obscure;
  final Widget? sufficeIcon;
  final Function(String?)? onsave;

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
        inputFormatters: [
          LengthLimitingTextInputFormatter(14) ,
          FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
          FilteringTextInputFormatter.digitsOnly//or any number you want
        ],

        controller: controller,
        keyboardType: textInputType,
        obscureText: obscure!,
     //   maxLength: 14,
        onSaved: onsave,
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



