import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:spa/BookAppointment/AppointmentsScreen.dart';
import 'package:spa/BookAppointment/ChooseServiceScreen.dart';
import 'package:spa/BookAppointment/Payment.dart';
import 'package:spa/utils/global.colors.dart';
import 'package:spa/widgets/available.slots.dart';
import 'package:spa/widgets/text.form.global.dart';

import '../widgets/BookAppointmentBottomNavBar.dart';
import '../widgets/Calendar.dart';
import '../widgets/back.button.global.dart';

import '../widgets/ProgressBar.dart';
import '../widgets/horizontal.scrollable.buttons.dart';

class SummaryScreen extends StatefulWidget {
  SummaryScreen({Key? key}) : super(key: key);
  _SummaryScreenState createState() => _SummaryScreenState();
}

class _SummaryScreenState extends State<SummaryScreen> {
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
                    child: ProgressBar(processindex: 2,)
                ),
                SizedBox(height: 50,),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0,right: 10),
                  child: Container(
                    height: 206,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                        width: 0,
                      ),
                    ),


                    child: Column(
                      children: [
                        TableInformation(text1: "Appointment time :",text2: "12:00PM, 03 oct 2023",icon: Icons.access_time,),
                        TableInformation(text1: "Barbershop :",text2: "Unique Salon",icon: Icons.store,),
                        TableInformation(text1: "Service :",text2: "Fringe haircut, Foam shave",icon: Icons.cut_outlined,),
                        TableInformation(text1: "Location :",text2: "Liverpool, A4 road",icon: Icons.location_on_outlined,),
                        TableInformation(text1: "Barber :",text2: "John Smith",icon: Icons.person_2_outlined,),
                      ]
                  ),
                ),
                ),
                SizedBox(height: 50,),
                Container(
                  padding: EdgeInsets.only(left: 30,right: 30),
                  child: Row(
                    children: [
                      VoucherCouponsRewards(text: "Vouchers",),

                      SizedBox(width: 3,),
                      VoucherCouponsRewards(text: "Coupons",),

                      SizedBox(width: 3,),
                      VoucherCouponsRewards(text: "Rewards",),
                    ],
                  ),
                ),
                SizedBox(height: 20,),
                Column(
                  children: [
                    Text(
                        "350",
                      style: TextStyle(
                        fontSize: 40,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.lock,size: 11,),
                        Text(
                          "Available reward point",
                          style: TextStyle(
                            fontSize: 11,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 30,),

                    Text("Get discount :",
                    style: TextStyle(
                      fontSize: 12,
                    ),
                    ),
                SizedBox(height: 10,),
                TextFormGlobal(
                    controller: rewardpointController,
                    text: "reward points",
                    textInputType: TextInputType.text,
                    obscure: false
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      height: 40,
                      width: 80,
                      decoration: BoxDecoration(
                        color: GlobalColors.primaryColor,
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: Text(
                          "Apply",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.white
                        ),
                        textAlign: TextAlign.center
                      ),
                    ),
                  ],
                )
              ],
            ),

          ),
        ),
      ),
      bottomNavigationBar: Container(
          height: 70,
          child: BookAppointmentBottomNavBar(
            widget: PaymentScreen(),
          )
      ),
    );
  }
}
class VoucherCouponsRewards extends StatefulWidget {
  const VoucherCouponsRewards({Key? key,required this.text}) : super(key: key);
 final text;
  @override
  State<VoucherCouponsRewards> createState() => _VoucherCouponsRewardsState();
}

class _VoucherCouponsRewardsState extends State<VoucherCouponsRewards> {
  var currentPage = null;
  void initState(){
    super.initState();
    currentPage = false;
  }
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){

        setState(() {
          currentPage = widget.text;

        });

      },
      child: Container(
        padding: EdgeInsets.only(top: 6,bottom: 6),
        width: 100,
        height: 27,
        decoration: BoxDecoration(
          color: currentPage == widget.text? Colors.white70: Colors.grey.shade400,
          border: Border.all(
            color: Colors.grey.shade400,
            width: 0,
          ),
        ),
        child: Text("Rewards",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: currentPage == widget.text? GlobalColors.primaryColor : Colors.black,
          ),
        ),
      ),
    );
  }
}


class TableInformation extends StatefulWidget {
  const TableInformation({Key? key,required this.text1,required this.text2,required this.icon,}) : super(key: key);
  final String text1;
  final String text2;
  final IconData icon;

  @override
  State<TableInformation> createState() => _TableInformationState();
}

class _TableInformationState extends State<TableInformation> {
  var currentPage = null;
  void initState(){
    super.initState();
    currentPage = false;
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey,width: 0)
      ),
      child: Padding(
        padding: const EdgeInsets.all(13),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Icon(widget.icon,color: Colors.grey,size: 15,),
                SizedBox(width: 10,),
                Text(
                  widget.text1,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 13
                  ),
                ),
              ],
            ),
            Text(
             widget.text2,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 13
              ),
            ),
            SizedBox(width: 10,),
            InkWell(
              child: Container(
                child: Text(
                  "change >",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 10,
                    color: GlobalColors.primaryColor,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}