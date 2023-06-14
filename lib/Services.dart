import 'package:flutter/material.dart';

import 'package:veeki/HomePage.dart';
import 'package:veeki/utils/global.colors.dart';
import 'package:veeki/widgets/BottomNavBar.dart';
import 'package:veeki/widgets/CardButton.dart';
import 'package:veeki/widgets/Profile.Buttons.dart';
import 'package:veeki/widgets/back.button.global.dart';

class Services extends StatefulWidget {
  @override
  _ServicesState createState() => _ServicesState();
  Services ({Key? key,}) : super (key: key);
}

class _ServicesState extends State<Services> {
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
                          Text("Services",
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
                CardButton(text1: "Hair Cutting", text2: "BarberShop (650)", image: "Images/clippers.png"),
                CardButton(text1: "Treatment", text2: "BarberShop (650)", image: "Images/clippers.png"),
                CardButton(text1: "Shaving", text2: "BarberShop (650)", image: "Images/clippers.png"),
                CardButton(text1: "Beard Trimming", text2: "BarberShop (650)", image: "Images/clippers.png"),
                CardButton(text1: "Kids Haircut", text2: "BarberShop (650)", image: "Images/clippers.png"),
                CardButton(text1: "Facials and Trimming", text2: "BarberShop (650)", image: "Images/clippers.png"),

                SizedBox(height: 40,),

                Container(
                  margin: EdgeInsets.only(top: 20),
                  padding: EdgeInsets.only(top: 5),
                  height: 40,
                  width: 150,
                  decoration: BoxDecoration(
                    color: GlobalColors.primaryColor,
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child:Text(
                        "Book Now",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                        ),

                      ),

                ),

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
