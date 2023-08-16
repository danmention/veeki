import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_paystack/flutter_paystack.dart';
import 'package:veeki/models/businessLayer/global.dart' as global;
import 'package:veeki/BookAppointment/AppointmentsScreen.dart';
import 'package:veeki/BookAppointment/ChooseServiceScreen.dart';
import 'package:veeki/BookAppointment/Payment.dart';
import 'package:veeki/utils/global.colors.dart';
import 'package:veeki/widgets/appbar.dart';
import 'package:veeki/widgets/available.slots.dart';
import 'package:veeki/widgets/text.form.global.dart';
import '../booking_provider.dart';
import '../models/businessLayer/base.dart';
import '../models/request/booking_request.dart';
import '../models/request/bookingconfirm_request.dart';
import '../models/response/booking_response.dart';
import '../models/response/booknow.dart';
import '../models/response/service_response.dart';
import '../widgets/BookAppointmentBottomNavBar.dart';
import 'package:veeki/widgets/appbar.dart';
import '../widgets/back.button.global.dart';

import '../widgets/ProgressBar.dart';
import '../widgets/horizontal.scrollable.buttons.dart';
import 'bookingConfirmationScreen.dart';

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
  int? booking_id;
  BookingResponse? bookingResponse;
  final TextEditingController rewardpointController = TextEditingController();

  final plugin = PaystackPlugin();

  var publicKey = 'pk_test_59b09788900a513d57d5b280c1225ee6616a8ce2';

  @override
  Widget build(BuildContext context) {
    print("this is the amount d ${ref.watch(myprovider).bookingRequestitem.amount}");


    return Scaffold(
        // appBar:   AppBar( backgroundColor: Colors.transparent,
        //   elevation: 0,
        //   leading: const BackButton(
        //     color: Colors.black, // <-- SEE HERE
        //   ),
        //
        // ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            width: double.infinity,

            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  alignment: Alignment.topLeft,
                  children: <Widget>[

                    IconButton(
                      icon: Icon(Icons.arrow_back),
                      onPressed: (){
                        Navigator.pop(context);
                      },
                    )
                  ],
                ),
                SizedBox(
                    height: 60,
                    width: double.infinity,
                    child: ProgressBar(processindex: 2,)
                ),
                SizedBox(height: 50,),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0,right: 10),
                  child: GestureDetector(
                    onTap: (){
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                           // title: Text(''),
                            //
                            content: Container(
                              height: 250,
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                    Text("Service:"),
                                    Expanded(child: Text(service!.title!)),

                                  ],)
                                  ,
                                  Divider(
                                    height: 100,
                                    color: Colors.black,
                                    thickness: 1,

                                  ),
                                  Row(
                                    children: [
                                      Text("Street Address:"),
                                      Expanded(child: Text(bookingRequest!.streetAddress!)),
                                    ],
                                  ),
                                  Divider(thickness: 1.0,color: Colors.black,),
                                  Row(
                                    children: [
                                      Text("Therapist:"),
                                      Expanded(child: Text(service!.user!.first.fullName!)),
                                    ],
                                  ),
                                ],
                              ),
                            ),

                          );
                        },
                      );
                    },
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
                          TableInformation(text1: "Time:",text2: "${bookingRequest!.timeFrom!}, ${bookingRequest!.date!}",icon: Icons.access_time,),
                          //TableInformation(text1: "Date :",text2: bookingRequest!.date!,icon: Icons.calendar_today,),
                          GestureDetector(child: TableInformation(text1: "Service :",text2: service!.title!,icon: Icons.cut_outlined,), onTap: (){


                          },),
                          TableInformation(text1: "Location :",text2: bookingRequest!.streetAddress!,icon: Icons.location_on_outlined,),
                          TableInformation(text1: "Therapist :",text2: service!.user!.first.fullName!,icon: Icons.person_2_outlined,),
                        ]
                    ),
                ),
                  ),
                ),
                SizedBox(height: 30,),
                Container(
                  padding: EdgeInsets.only(left: 30,right: 30),
                  child: Row(
                    children: [
                      //VoucherCouponsRewards(text: "Vouchers",),

                      SizedBox(width: 3,),
                    //  VoucherCouponsRewards(text: "Referral Code",),

                      // SizedBox(width: 3,),
                      // VoucherCouponsRewards(text: "Rewards",),
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

                    // Text("Get discount :",
                    // style: TextStyle(
                    //   fontSize: 12,
                    // ),
                    // ),
                SizedBox(height: 10,),
                Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                    width: 250,
                    child: TextFormGlobal(
                        controller: rewardpointController,
                        text: "Enter Referral Code",
                        textInputType: TextInputType.text,
                        obscure: false
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: (){
                     //  makePayment();

                       bookapointment();
                      },
                      child: Container(
                        padding: EdgeInsets.all(10),
                        height: 50,
                        width: 120,
                        decoration: BoxDecoration(
                          color: GlobalColors.primaryColor,
                          borderRadius: BorderRadius.circular(10)
                        ),
                        child: Center(
                          child: Text(
                              "Book Now",
                            style: TextStyle(
                              fontSize: 17,
                              color: Colors.white
                            ),
                            textAlign: TextAlign.center
                          ),
                        ),
                      ),


                    ),


                    SizedBox(height: 30,)
                  ],
                )
                ,SizedBox(height: 20,),
              ],
            ),

          ),
        ),
      ),


      // bottomNavigationBar: Container(
      //     height: 70,
      //     child: BookAppointmentBottomNavBar(
      //       widget: PaymentScreen(),
      //     )
      // ),
    );
  }
void notifyCaregiver()async{


  //₦${ref.watch(myprovider).initialAmount??"0.00"}
  await apiHelper!.pushnotification(service!.user!.first.firebaseToken!,
     // "₦${ref.watch(myprovider).initialAmount??"0.00"}",
    // "${bookingRequest!.streetAddress!}+${global.user.instagram}",
     "${bookingRequest!.streetAddress!}",
     // "${global.user.instagram}",


    //  "${global.user.fullName}", "${global.user.instagram}" ).then((result) async {

      "${global.user.fullName}", "${global.user.firebase_token}" ).then((result) async {
    if (result != null) {
      if (result.success == "1") {

        print(' did it get here ');

      //  showSnack(snackBarMessage: " Notice sent");

      }
    }
  });
}

  // void notifyUser()async{
  //
  //
  //   //₦${ref.watch(myprovider).initialAmount??"0.00"}
  //   await apiHelper!.pushnotification(global.user.instagram!,
  //       // "₦${ref.watch(myprovider).initialAmount??"0.00"}",
  //      // "${bookingRequest!.streetAddress!}",
  //       "${bookingRequest!.streetAddress!}",
  //       "${service!.user![0].fullName}" ).then((result) async {
  //     if (result != null) {
  //       if (result.success == "1") {
  //         print(' did it get here ');
  //
  //         //  showSnack(snackBarMessage: " Notice sent");
  //
  //       }
  //     }
  //   });
  // }


  void bookapointment() async{
    try {

      bookingRequest!.referral_code = rewardpointController.text;

      bool isConnected = await br!.checkConnectivity();
      if (isConnected) {
      //  showOnlyLoaderDialog();

        await apiHelper!.bookappointment(bookingRequest! ).then((result) async {
          if (result != null) {
            if (result.resp_code == "00") {
             BookingResponse _tList = result.recordList;
            booking_id =  _tList.id;

              notifyCaregiver();
           //   hideLoader();
             // int serviceid = result.data.id;
              //print(serviceid);


              showSnack(snackBarMessage: 'You have booked successfully');
             makePayment();
              //   Navigator.of(context).pushNamedAndRemoveUntil('home', (Route<dynamic> route) => false);


            }
            // else if(result.resp_code =="01" && result.resp_message.contains("please complete registration process"))
            // {
            //   nextScreen(context, 'login');
            // }


            else if(result.resp_code =="01")
            {
             // hideLoader();
              showSnack(snackBarMessage: result.resp_message.toString());
            }

            else {
            //  hideLoader();



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
      print("Exception - bookappointmentScreen.dart - _addsevice():" + e.toString());
    }
  }


  @override
  void initState() {
    print(" ${global.publicKey}");
    plugin.initialize(publicKey: publicKey);
    // TODO: implement initState
    super.initState();
  }


  String _getReference() {
    String platform;
    if (Platform.isIOS) {
      platform = 'iOS';
    } else {
      platform = 'Android';
    }

    return 'ChargedFrom${platform}_${DateTime.now().millisecondsSinceEpoch}';
  }

  Future<void> makePayment() async {
    //PaymentScreen()
   // var amt  = _cAmountForPayment.text.replaceAll(",", "");
   //  String  amt  =  bookingRequest!.amount.toString()+"00";
   //  int paymentamount = int.tryParse(amt) ??00;
    Charge charge = Charge()

    // ..amount = int.parse(projectAmount!)
      ..amount = bookingRequest!.amount! *100
      ..reference = _getReference()
    // or ..accessCode = _getAccessCodeFrmInitialization()
      ..email = '${global.user.email}';
    final response = await plugin.checkout(
        context , method: CheckoutMethod.card, charge: charge);


    if (response.status) {

      BookConfirmRequest _bookNow = new BookConfirmRequest();
      _bookNow.amount = bookingRequest!.amount;
      _bookNow.userId = int.parse("${global.user.id}");
      _bookNow.referral_code = rewardpointController.text;
      _bookNow.booking_id = booking_id;
      _bookNow.transactionReference = _getReference();
      _bookNow.purpose = service!.title;
      // Payment was successful
      print('Payment was successful');
      await apiHelper!.checkOut(_bookNow).then((result) async {
        if (result != null) {
          if (result.resp_code == "00") {
          //if (result.status == "1") {

            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        BookingConfirmationScreen()),
                ModalRoute.withName('/'));
            // Navigator.of(context).push(
            //   MaterialPageRoute(builder: (context) => BookingConfirmationScreen()),
            // )

          }
        }
      });


    } else {
      // Payment failed
      print('Payment failed');
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
        child: Table(
          columnWidths: {
            0: FlexColumnWidth(2),
            1: FlexColumnWidth(3),
            2: FlexColumnWidth(1),
          },
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TableRow(
              children: [
                Row(children: [
                  Icon(widget.icon,color: Colors.grey,size: 15,),
                  SizedBox(width: 10,),
                  Text(
                    widget.text1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 13
                    ),
                  ),
                ],),

                Text(
                  widget.text2,overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 13
                  ),textAlign: TextAlign.left,
                ),
                InkWell(
                  child: Container(
                    child: Text(
                      "view >",
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
            // TableRow(
            //   child: Flexible(
            //     child: Text(
            //      widget.text2,overflow: TextOverflow.ellipsis,
            //       style: TextStyle(
            //           fontWeight: FontWeight.bold,
            //           fontSize: 13
            //       ),textAlign: TextAlign.left,
            //     ),
            //   ),
            // ),
            // SizedBox(width: 10,),
            // InkWell(
            //   child: Container(
            //     child: Text(
            //       "view >",
            //       style: TextStyle(
            //         fontWeight: FontWeight.w400,
            //         fontSize: 10,
            //         color: GlobalColors.primaryColor,
            //       ),
            //     ),
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}