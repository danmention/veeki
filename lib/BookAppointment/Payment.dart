import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:spa/BookAppointment/AppointmentsScreen.dart';
import 'package:spa/BookAppointment/ChooseServiceScreen.dart';
import 'package:spa/utils/global.colors.dart';
import 'package:spa/widgets/available.slots.dart';
import 'package:spa/widgets/text.form.global.dart';

import '../widgets/BookAppointmentBottomNavBar.dart';
import '../widgets/Calendar.dart';
import '../widgets/back.button.global.dart';

import '../widgets/ProgressBar.dart';
import '../widgets/horizontal.scrollable.buttons.dart';

class PaymentScreen extends StatefulWidget {
  PaymentScreen({Key? key}) : super(key: key);
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  final TextEditingController rewardpointController = TextEditingController();



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
                      widget: AppointmentsScreen(),
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
                    child: ProgressBar(processindex: 3,)
                ),
                SizedBox(height: 50,),
                InkWell(
                    child: Image.asset("Images/paystack.png"),
                ),
                SizedBox(height: 50,),
                InkWell(
                  child: Container(
                   // margin: EdgeInsets.only(top: 30,left: 100),
                    alignment: Alignment(0, 0),
                    child: Image.asset("Images/payxpress1.png",),
                  ),
                ),
                SizedBox(height: 50,),
                Text("Did'nt find your gateway? Contact us for custom work.",
                  style: TextStyle(
                    fontSize: 30,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),

          ),
        ),
      ),
      bottomNavigationBar: Container(
          height: 70,
          child: PaymentBottomNavBar(
            widget: PaymentScreen(),
          )
      ),
    );
  }
}
