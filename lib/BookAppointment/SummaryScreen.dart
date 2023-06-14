import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:veeki/BookAppointment/AppointmentsScreen.dart';
import 'package:veeki/BookAppointment/ChooseServiceScreen.dart';
import 'package:veeki/BookAppointment/Payment.dart';
import 'package:veeki/utils/global.colors.dart';
import 'package:veeki/widgets/available.slots.dart';
import 'package:veeki/widgets/text.form.global.dart';

import '../models/businessLayer/base.dart';
import '../models/request/booking_request.dart';
import '../models/response/service_response.dart';
import '../widgets/BookAppointmentBottomNavBar.dart';
import '../widgets/Calendar.dart';
import '../widgets/back.button.global.dart';

import '../widgets/ProgressBar.dart';
import '../widgets/horizontal.scrollable.buttons.dart';

class SummaryScreen extends Base {
  SummaryScreen({Key? key, this.service, this.bookingRequest});
  Service? service;
  BookingRequest? bookingRequest;
  _SummaryScreenState createState() => _SummaryScreenState(this.service,this.bookingRequest);
}

class _SummaryScreenState extends BaseState {


  _SummaryScreenState(this.service,this.bookingRequest);
  Service? service;
  BookingRequest? bookingRequest;
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
                    height: 246,
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
                        TableInformation(text1: "Service :",text2: service!.title!,icon: Icons.cut_outlined,),
                        TableInformation(text1: "Location :",text2: bookingRequest!.streetAddress!,icon: Icons.location_on_outlined,),
                        TableInformation(text1: "Therapist :",text2: service!.user!.first.fullName!,icon: Icons.person_2_outlined,),
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
                       // "350",
                        "₦${bookingRequest!.amount!}",
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
                    GestureDetector(
                      onTap: (){
                        bookapointment();
                      },
                      child: Container(
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


  void bookapointment() async{
    try {



      bool isConnected = await br!.checkConnectivity();
      if (isConnected) {
        showOnlyLoaderDialog();

        await apiHelper!.bookappointment( bookingRequest!  ).then((result) async {
          if (result != null) {
            if (result.resp_code == "00") {
              hideLoader();
              int serviceid = result.data.id;
              print(serviceid);

              hideLoader();
              showSnackBar(snackBarMessage: 'Service submitted successfully');



              //


              //


              //   Navigator.of(context).pushNamedAndRemoveUntil('home', (Route<dynamic> route) => false);


            }
            // else if(result.resp_code =="01" && result.resp_message.contains("please complete registration process"))
            // {
            //   nextScreen(context, 'login');
            // }


            else if(result.resp_code =="01")
            {
              hideLoader();
              showSnack(snackBarMessage: result.resp_message.toString());
            }

            else {
              hideLoader();



              if(result.errors[0].message != null){
                showSnack( snackBarMessage: result.errors[0].message.toString());
              }else{
                showSnack(snackBarMessage: result.resp_message.toString());
              }
            }
          }
        });
      }

      else {

        showSnack(snackBarMessage:" No network connection" );
      }

    } catch (e) {
      print("Exception - addserviceScreen.dart - _addsevice():" + e.toString());
    }
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
          crossAxisAlignment: CrossAxisAlignment.start,
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
              ),textAlign: TextAlign.left,
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