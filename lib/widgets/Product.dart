import 'package:flutter/material.dart';

import 'package:veeki/utils/global.colors.dart';

class Product extends StatelessWidget{
  const Product({Key? key, required this.text1,  this.text2,this.text3,this.text4, required this.image}) : super(key: key);
  final String text1;
  final String? text2;
  final String? text3;
  final String? text4;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      width: 250,
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
        mainAxisSize: MainAxisSize.min,
        //mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
         // SizedBox(width: 20,),

         // image != null?
        //  Image.network(image,width: 140,):
          Image.asset(image,width: 140,)
          ,
          SizedBox(width: 10,),
          Expanded(
            child: Column(
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
                text2 != null? Text(
                 "₦$text2" , overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      color: GlobalColors.textColor
                  ),
                ):SizedBox(),

                Row(
                  children: [
                    Text(
                      text3??"" , overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          color: GlobalColors.textColor
                      ),
                    ),Text(','),
                    Text(
                      text4??" " , overflow: TextOverflow.ellipsis,
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
          ),
        ],
      ),
    );

  }
}

