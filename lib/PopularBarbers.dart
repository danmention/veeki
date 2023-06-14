import 'package:flutter/material.dart';

import 'package:veeki/HomePage.dart';
import 'package:veeki/utils/global.colors.dart';
import 'package:veeki/widgets/BottomNavBar.dart';
import 'package:veeki/widgets/CardButton.dart';
import 'package:veeki/widgets/Profile.Buttons.dart';
import 'package:veeki/widgets/back.button.global.dart';

class PopularBarbers extends StatefulWidget {
  @override
  _PopularBarbersState createState() => _PopularBarbersState();
  PopularBarbers ({Key? key,}) : super (key: key);
}

class _PopularBarbersState extends State<PopularBarbers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20.0),
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          BackButtonGlobal(
                            widget: HomePage(),
                          ),
                          Text("Popular Barbers",
                            style:TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.search_outlined,size: 25,),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(height: 30,),
                Card(text1: "John Smith", text2: "Hair cutting specialist", image: "Images/download.png"),
                Card(text1: "Alexander", text2: "Speciality in hair style", image: "Images/download.png"),
                Card(text1: "Nacho", text2: "Fades and buzz cut specialist", image: "Images/download.png"),
                Card(text1: "Graham Arnold", text2: "Shaving Specialist", image: "Images/download.png"),
                Card(text1: "Rahul Gonzalez", text2: "Beard trim Specialist", image: "Images/download.png"),
                Card(text1: "Jonathan", text2: "Specialist in hair styles", image: "Images/download.png"),
                Card(text1: "Wilfred", text2: "Spike cutting Specialist", image: "Images/download.png"),
                Card(text1: "Kovacic Van", text2: "Long hair specialist", image: "Images/download.png"),

                SizedBox(height: 40,),

                // Container(
                //   margin: EdgeInsets.only(top: 20),
                //   padding: EdgeInsets.only(top: 5),
                //   height: 40,
                //   width: 150,
                //   decoration: BoxDecoration(
                //     color: GlobalColors.primaryColor,
                //     borderRadius: BorderRadius.circular(5.0),
                //   ),
                //   child:Text(
                //     "Book Now",
                //     textAlign: TextAlign.center,
                //     style: TextStyle(
                //       color: Colors.white,
                //       fontSize: 17,
                //     ),
                //
                //   ),
                //
                // ),

              ],
            ),
          ),

        ),
      ),
      // bottomNavigationBar: Container(
      //     height: 60,
      //     child: BottomNavBar(id: "profile",)
      // ),
    );
  }
}



class Card extends StatelessWidget{
  const Card({Key? key, required this.text1, required this.text2, required this.image}) : super(key: key);
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
          CircleAvatar(
            radius: 45,
            backgroundImage: AssetImage(image),
          ),
          //Image.asset(image,),
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