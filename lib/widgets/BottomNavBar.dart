import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:veeki/AddServiceScreen.dart';
import 'package:veeki/HomePage.dart';
import 'package:veeki/Profile.dart';
import 'package:veeki/utils/global.colors.dart';
import 'package:veeki/models/businessLayer/global.dart' as global;
import '../BookAppointment/ViewBookingScreen.dart';

class BottomNavBar extends StatelessWidget{
  BottomNavBar ({Key? key, required this.id}) : super (key:key);
  final String id;

  @override
  Widget build (BuildContext context){
    return Scaffold(

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

          floatingActionButton: global.user.role  == "SERVICE_PROVIDER"?  FloatingActionButton(
          onPressed: (){
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => AddServiceScreen()),
            );
          },
          child: Icon(Icons.calendar_month_outlined),
          backgroundColor: GlobalColors.primaryColor,
          foregroundColor: Colors.white,
        ):SizedBox(),


      bottomNavigationBar: BottomAppBar(
        height: 70,
        notchMargin: 3.0,
        shape: CircularNotchedRectangle(),
        color: GlobalColors.secondaryColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsets.all(0.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  InkWell(
                    onTap: (){
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => HomePage()),
                      );
                    },
                    child: Icon(
                      Icons.home_outlined,
                      color:id == "home"? GlobalColors.primaryColor :Colors.white,
                      size: 30,
                    ),
                  ),
                ],
              ),

            ),
            Padding(
              padding: const EdgeInsets.only(right:20.0,top: 10.0,bottom: 10.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.description_outlined,
                    color:id == ""? GlobalColors.primaryColor :Colors.white,
                    size: 30,
                  )
                ],
              ),
            ),
          //  global.user.role  == "SERVICE_PROVIDER"?


            Padding(
              padding: const EdgeInsets.only(left: 20.0,top: 10.0,bottom: 10.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  GestureDetector(


                    child: Icon(Icons.local_post_office_outlined,
                      color:id == ""? GlobalColors.primaryColor :Colors.white,
                      size: 30,
                    ),
                    onTap: (){
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => ViewBookingScreen()),
                      );
                    },
                  )
                ],
              ),
            ) ,
            Padding(
              padding: const EdgeInsets.only(right: 0.0,top: 10.0,bottom: 10.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  InkWell(
                    onTap: (){
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => Profile()),
                      );
                    },
                    child: Icon(Icons.person_2_outlined,
                      color:id == "profile"? GlobalColors.primaryColor :Colors.white,
                      size: 30,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}