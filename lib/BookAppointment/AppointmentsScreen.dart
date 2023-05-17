import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:spa/BookAppointment/ChooseServiceScreen.dart';
import 'package:spa/BookAppointment/SummaryScreen.dart';
import 'package:spa/HomePage.dart';
import 'package:spa/utils/global.colors.dart';
import 'package:spa/widgets/available.slots.dart';

import '../widgets/BookAppointmentBottomNavBar.dart';
import '../widgets/Calendar.dart';
import '../widgets/back.button.global.dart';

import '../widgets/ProgressBar.dart';
import '../widgets/horizontal.scrollable.buttons.dart';

class AppointmentsScreen extends StatefulWidget {
  AppointmentsScreen({Key? key}) : super(key: key);
  _AppointmentsScreenState createState() => _AppointmentsScreenState();
}

class _AppointmentsScreenState extends State<AppointmentsScreen> {
 var ChosenHairstylist = null;


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            width: double.infinity,

            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    BackButtonGlobal(
                      widget: ChooseServiceScreen(),
                    ),
                    Text(
                      'Book an appointment',
                      style: TextStyle(
                          color: GlobalColors.textColor,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),

                  ],
                ),
                SizedBox(
                  height: 70,
                    width: double.infinity,
                    child: ProgressBar(processindex: 1,)
                ),


                Padding(
                  padding: const EdgeInsets.only(top: 0.0),
                  child: SizedBox(
                    height: 123,
                      child: Calender()
                  ),
                ),
                Divider(thickness: 1,),
                SizedBox(
                  height: 170,
                    child: AvailableSlot()
                ),
                Divider(),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Container(
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: Colors.grey
                        ),
                      ),
                    ),

                    Text('   Available slots')
                  ],
                ),
                SizedBox(height: 20,),
                Row(
                  children: [
                    Text("Choose hair Specialist  ",
                      style: TextStyle(
                        color: GlobalColors.textColor,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text("(Optional) ", style: TextStyle(
                        color: GlobalColors.textColor,
                        fontSize: 12,
                        ),
                    ),
                  ],
                ),
                SizedBox(height: 20,),
                Container(
                  height: 50,
                    child: HorizontalButtonsList()
                ),

                SizedBox(height: 100,),
                Container(
                  height: 20,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Theme(
                          data: ThemeData(
                              unselectedWidgetColor: Color(0xff138D1f)),
                          child: Container(
                            child: Row(
                              children: <Widget>[
                                Checkbox(
                                  value: true,
                                  checkColor: Colors.white,
                                  activeColor: GlobalColors.primaryColor,
                                  onChanged: (value) {
                                    value = false;
                                  },

                                ),
                                Text(
                                  'Remind me 30 mins in advance',
                                  style: TextStyle(
                                    color: GlobalColors.textColor,
                                  ),
                                ),
                              ],
                            ),
                          )),
                    ],
                  ),
                ),
          ],
            ),

          ),
        ),
      ),
      bottomNavigationBar: Container(
          height: 70,
          child: BookAppointmentBottomNavBar(
            widget: SummaryScreen(),
          )
      ),
    );
  }

}
