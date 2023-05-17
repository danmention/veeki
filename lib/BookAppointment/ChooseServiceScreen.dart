import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:spa/BookAppointment/AppointmentsScreen.dart';
import 'package:spa/BookAppointment/SummaryScreen.dart';
import 'package:spa/HomePage.dart';
import 'package:spa/utils/global.colors.dart';
import 'package:spa/widgets/button.global.dart';
import 'package:spa/widgets/dropdown.global.dart';
import 'package:spa/widgets/text.form.global.dart';

import '../widgets/BookAppointmentBottomNavBar.dart';
import '../widgets/back.button.global.dart';
import '../widgets/ProgressBar.dart';

class ChooseServiceScreen extends StatefulWidget {
  ChooseServiceScreen({Key? key}) : super(key: key);
  _ChooseServiceScreenState createState() => _ChooseServiceScreenState();
}

class _ChooseServiceScreenState extends State<ChooseServiceScreen> {
  String selectOption = 'Select Option';
  List<String> options = ['one', 'two','three','four'];
  bool isOpen = true;
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
                      widget: HomePage(),
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
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: SizedBox(
                      height: 70,
                      width: double.infinity,
                      child: ProgressBar(processindex: 0,)
                  ),
                ),
                DropDownGlobal(
                  dropdownHeader: 'Hair Cutting',
                  options: ['Fade and taper cutting','Fringe','Buzz Cut','Pompadour'],
                ),
                DropDownGlobal(
                  dropdownHeader: 'Shaving',
                  options: ['Cream Shave','Foam Shave'],
                ),


              ],
            ),

          ),
        ),
      ),
      bottomNavigationBar: Container(
          height: 70,
          child: BookAppointmentBottomNavBar(
            widget: AppointmentsScreen(),
          )
      ),
    );
  }

}
