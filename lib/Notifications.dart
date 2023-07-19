import 'package:flutter/material.dart';
import 'package:veeki/HomePage.dart';
import 'package:veeki/LoginScreen.dart';
import 'package:veeki/utils/global.colors.dart';
import 'package:flutter/cupertino.dart';
import '../widgets/back.button.global.dart';

class Notifications extends StatefulWidget {
  Notifications({Key? key}) : super(key: key);
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  final TextEditingController rewardpointController = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()async {
        Navigator.of(context).pop();
        return false;
      }

      ,
      child: Scaffold(

        body: SingleChildScrollView(
          child: SafeArea(
            child: Container(
              width: double.infinity,

              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          BackButtonGlobal(
                            widget: HomePage(),
                          ),
                          SizedBox(width: 10,),
                          Text(
                            'Notifications',
                            style: TextStyle(
                                color: GlobalColors.textColor,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.end,
                      //   children: [
                      //     Icon(Icons.filter_alt_outlined)
                      //   ],
                      // )

                    ],
                  ),
                  SizedBox(height: 30,),
                  Buttons(text1: "Grooming hair tips", text2: "Lorem ipsum dolor int"),
                  Buttons(text1: "Get reward points", text2: "Lorem ipsum dolor int"),
                  Buttons(text1: "Appointment cancelled", text2: "Lorem ipsum dolor int"),
                  Buttons(text1: "Processing appointment", text2: "Lorem ipsum dolor int"),
                  Buttons(text1: "30% off cidboys salon offer", text2: "Lorem ipsum dolor int"),
                  Buttons(text1: "Welcome to our app", text2: "Lorem ipsum dolor int"),

                ],
              ),

            ),
          ),
        ),

      ),
    );
  }
}


class Buttons extends StatelessWidget{
  const Buttons({Key? key, required this.text1,  this.text2}) : super(key: key);
  final String text1;
  final String? text2;
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
                text2!,
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
