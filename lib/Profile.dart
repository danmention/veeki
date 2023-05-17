import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:spa/HomePage.dart';
import 'package:spa/utils/global.colors.dart';
import 'package:spa/widgets/BottomNavBar.dart';
import 'package:spa/widgets/Profile.Buttons.dart';
import 'package:spa/widgets/back.button.global.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
  Profile ({Key? key,}) : super (key: key);
}

class _ProfileState extends State<Profile> {
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
                Row(
                  children: [
                    Container(
                      height: 10,
                        child: BackButtonGlobal(
                          widget: HomePage(),
                        )
                    ),
                  ],
                ),
                Container(
                  //margin: EdgeInsets.only(bottom: 50),
                  height: 170,
                  child:Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CircleAvatar(
                        backgroundColor: GlobalColors.primaryColor,
                        radius: 55,
                        child: CircleAvatar(
                          radius: 50,
                          backgroundImage: AssetImage('Images/download.png'),
                        ),
                      ),
                      Text("Fahim Ekan",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(height: 20,),
                    ],
                  ),
                ),
                ProfileButton(text1: "Account Settings", text2: "Name, email, address, contact number", icon: Icons.person_2_outlined),
                ProfileButton(text1: "Payment Method", text2: "Add a new payment card", icon: Icons.credit_card_outlined),
                ProfileButton(text1: "Booking Management", text2: "Manage your booking system", icon: Icons.cases_outlined),
                ProfileButton(text1: "Reward points program", text2: "You've 50 reward points", icon: Icons.card_giftcard_outlined),
                ProfileButton(text1: "Pricing and offers", text2: "Get every week special offers and affor...", icon: Icons.local_offer_outlined),
                ProfileButton(text1: "Terms and services", text2: "See our terms and services", icon: Icons.design_services_outlined),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  padding: EdgeInsets.only(top: 5),
                  height: 40,
                  width: 150,
                  decoration: BoxDecoration(
                    color: GlobalColors.secondaryColor,
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(
                          Icons.logout_rounded,
                        color: Colors.white,
                        size: 17,
                      ),
                      Text(
                        "Sign Out",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                          fontSize: 17,
                        ),

                      ),
                    ],
                  ),
                ),

              ],
            ),
          ),

        ),
      ),
      bottomNavigationBar: Container(
        height: 60,
          child: BottomNavBar(id: "profile",)
      ),
    );
  }
}
