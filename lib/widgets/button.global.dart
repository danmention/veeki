import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

import 'package:veeki/utils/global.colors.dart';

class ButtonGlobal extends StatelessWidget{
  const ButtonGlobal({Key? key, required this.text, this.isLoading, required this.color, required this.fontsize,required this.ontap}) : super(key: key);
  final String text;
  final HexColor color;
  final double fontsize;
  final bool? isLoading  ;
  final Function() ontap;
  @override
    Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        alignment: Alignment.center,
        height: 45,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(6),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
            )
          ],
        ),
        child:
        isLoading!?

        Row(
          mainAxisAlignment: MainAxisAlignment.center,


          children: [
            Text('Loading...', style: TextStyle(fontSize: 16, color: Colors.white),),
            SizedBox(width: 10,),
            SizedBox(
              width: 24, height: 24,
                child: CircularProgressIndicator(color: Colors.white,strokeWidth: 2,)),
          ],
        ) :


        Text(
        text,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: fontsize,
            fontFamily: 'Roboto'
          ),
        ),

      ),
    );
  }
}
