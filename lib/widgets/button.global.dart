import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:spa/utils/global.colors.dart';

class ButtonGlobal extends StatelessWidget{
  const ButtonGlobal({Key? key, required this.text, required this.color, required this.fontsize,required this.widget}) : super(key: key);
  final String text;
  final HexColor color;
  final double fontsize;
  final Widget widget;
  @override
    Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => widget),
        );
      },
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
        child: Text(
        text,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: fontsize,
          ),
        ),

      ),
    );
  }
}
