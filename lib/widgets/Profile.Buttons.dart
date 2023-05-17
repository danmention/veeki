import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:spa/utils/global.colors.dart';

class ProfileButton extends StatelessWidget{
  const ProfileButton({Key? key, required this.text1, required this.text2, required this.icon}) : super(key: key);
  final String text1;
  final String text2;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white70,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
          )
        ],
      ),
      height: 60,
      child: Row(
        //mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(width: 20,),
          Icon(icon, size: 30,),
          SizedBox(width: 20,),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                text1,
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: GlobalColors.textColor
                ),
              ),
              SizedBox(height: 5,),
              Text(
                text2,
                style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    color: GlobalColors.textColor
                ),
              ),
            ],
          ),
        ],
      ),
    );

  }
}
