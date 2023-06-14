import 'package:flutter/material.dart';

import 'package:veeki/utils/global.colors.dart';

class CardButton extends StatelessWidget{
  const CardButton({Key? key, required this.text1, required this.text2, required this.image}) : super(key: key);
  final String text1;
  final String text2;
  final String image;
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
            blurRadius: 15,
          )
        ],
      ),
      height: 80,
      child: Row(
        //mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(width: 20,),
          Image.asset(image,),
          SizedBox(width: 20,),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 200,
                child: Text(
                  text1, overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: GlobalColors.textColor
                  ),
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
