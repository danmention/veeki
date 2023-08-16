import 'package:flutter/material.dart';
import 'package:veeki/models/businessLayer/global.dart' as global;
import 'package:veeki/utils/global.colors.dart';

class CardButton extends StatelessWidget{
  const CardButton({Key? key, required this.text1,this.block, this.delete, required this.text2,this.text3,this.text4, required this.image}) : super(key: key);
  final String text1;
  final String text2;
  final String? text3;
  final String? text4;
  final Function()? block;
  final Function()? delete;

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
      height: 120,
      child: Row(
        //mainAxisSize: MainAxisSize.min,
      //  mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
         // SizedBox(width: 20,),
        //  Image.asset("assets/nurse.jpeg",width: 140,)
          // image.isNotEmpty?
           Image.network(image,width: 100,)

               //:Image.asset("assets/nurse.jpeg",width: 140,)
         // image == null? Image.asset("assets/nurse.jpeg",width: 140,):Image.network(image,width: 140,)
          ,
          SizedBox(width: 10,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            //mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(height: 10,),
              SizedBox(
                width: 150,
                child: Text(
                  text1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: GlobalColors.textColor
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Text(
               "₦$text2" , overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    color: GlobalColors.textColor
                ),
              ),
              SizedBox(height: 10,),
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

              global.user.isAdmin == "1"?   Row(children: [
                TextButton(onPressed: delete, child: Text('Delete')),
                TextButton(onPressed: block, child: Text('Block'))
              ],):SizedBox()
            ],
          ),
        ],
      ),
    );

  }
}


class CardButtonUser extends StatelessWidget{
  const CardButtonUser({Key? key, required this.text1,this.enable, this.delete, required this.text2,this.text3,this.text4, required this.image}) : super(key: key);
  final String text1;
  final String text2;
  final String? text3;
  final String? text4;
  final Function()? enable;
  final Function()? delete;

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
      height: 150,
      child: Row(
        //mainAxisSize: MainAxisSize.min,
        //  mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          // SizedBox(width: 20,),
          //  Image.asset("assets/nurse.jpeg",width: 140,)
          // image.isNotEmpty?
          image.isEmpty? Image.asset("assets/nurse.jpeg",width: 100,):Image.network(image,width: 100,),

          //:Image.asset("assets/nurse.jpeg",width: 140,)
          // image == null? Image.asset("assets/nurse.jpeg",width: 140,):Image.network(image,width: 140,)

          SizedBox(width: 10,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            //mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(height: 15,),
              SizedBox(
                width: 180,
                child: Text(
                  text1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: GlobalColors.textColor
                  ),
                ),
              ),
              SizedBox(height: 5,),
              Text(
                "$text2" , overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.indigo
                ),
              ),
              SizedBox(height: 5,),
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

              global.user.isAdmin == "1"?   Row(children: [
                TextButton(onPressed: delete, child: Text('Disable'),
                 style: ButtonStyle(
    foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
    backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
    RoundedRectangleBorder(
    borderRadius: BorderRadius.zero,
    side: BorderSide(color: Colors.red)
    )
    )
    ),
                ),
                SizedBox(width: 20,),
                TextButton(onPressed: enable, child: Text('Enable'),
                  style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.zero,
                              side: BorderSide(color: Colors.green)
                          )
                      )
                  ),
                )
              ],):SizedBox()
            ],
          ),
        ],
      ),
    );

  }
}

class CardButtonAdmin extends StatelessWidget{
  const CardButtonAdmin({Key? key, required this.text1,this.block, this.delete, required this.text2,this.text3,this.text4, required this.image}) : super(key: key);
  final String text1;
  final String text2;
  final String? text3;
  final String? text4;
  final Function()? block;
  final Function()? delete;

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
      height: 150,
      child: Row(
        //mainAxisSize: MainAxisSize.min,
        //  mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          // SizedBox(width: 20,),
          //  Image.asset("assets/nurse.jpeg",width: 140,)
          // image.isNotEmpty?
          image.isEmpty? Image.asset("assets/nurse.jpeg",width: 100,):Image.network(image,width: 100,),

          //:Image.asset("assets/nurse.jpeg",width: 140,)
          // image == null? Image.asset("assets/nurse.jpeg",width: 140,):Image.network(image,width: 140,)

          SizedBox(width: 10,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            //mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(height: 15,),
              SizedBox(
                width: 180,
                child: Text(
                  text1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: GlobalColors.textColor
                  ),
                ),
              ),
              SizedBox(height: 5,),
              Text(
                "₦$text2" , overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    color: GlobalColors.textColor
                ),
              ),
              SizedBox(height: 5,),
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

              global.user.isAdmin == "1"?   Row(children: [
                TextButton(onPressed: delete, child: Text('Delete')),
                TextButton(onPressed: block, child: Text('Block'))
              ],):SizedBox()
            ],
          ),
        ],
      ),
    );

  }
}

class CardButtonCategory extends StatelessWidget{
  const CardButtonCategory({Key? key, required this.text1, required this.text2,this.text3,this.text4, required this.image}) : super(key: key);
  final String text1;
  final String text2;
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
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          // SizedBox(width: 20,),
          image == null? Image.asset("assets/nurse.jpeg",width: 100,):Image.network(image,width: 100,),
         // Image.asset(image,width: 140,),
          SizedBox(width: 10,),
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
                "$text2" , overflow: TextOverflow.ellipsis,
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