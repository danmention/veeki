
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:veeki/HomePage.dart';

import '../models/businessLayer/base.dart';
import 'package:veeki/models/businessLayer/global.dart' as global;

import '../models/response/view_my_booking.dart';
import '../widgets/ProgressBar.dart';
import 'bookingDetailScreen.dart';

class BookingConfirmationScreen extends Base {

   int? screenId;
  BookingConfirmationScreen({ this.screenId});
  @override
  _BookingConfirmationScreenState createState() => new _BookingConfirmationScreenState(this.screenId);
}

class _BookingConfirmationScreenState extends BaseState {

  int? screenId;

  bool isDataLoaded = false;


  bool _isRecordPending = true;
  List<Service> _serviceList = [];
  List<MyBooking> _mybookingList = [];
  String? userId;
  _BookingConfirmationScreenState(this.screenId) : super();
  @override
  Widget build(BuildContext context) {
    return sc(Scaffold(
        bottomNavigationBar: Container(
          decoration: BoxDecoration(color: Color(0xFF171D2C), borderRadius: BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15))),
          height: 60,
          width: 200,
          padding: EdgeInsets.only(
            left: 100,
            right: 100,
          ),
          child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(2)),
              child: Padding(
                padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: SizedBox(
                  width: 250,
                  child: TextButton(
                    onPressed: () {

                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  BookingDetailScreen(booking:_mybookingList.first)),
                          ModalRoute.withName('/'));
                    },
                    child: Text("View Booking Details", style: TextStyle(fontSize: 23),),
                  ),
                ),
              )),
        ),
        body: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, top: 50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                SizedBox(
                    height: 70,
                    width: double.infinity,
                    child: ProgressBar(processindex: 3,)
                ),
            SizedBox(height:50),

            Icon(Icons.check_circle, size: 68,),
               Text('Thanks for your payment!', style: TextStyle(fontSize: 22, fontFamily: 'Roboto', fontWeight: FontWeight.bold),),
                Padding(
                  padding: const EdgeInsets.only(top: 25),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Great' + ' ' + '${global.user.fullName}',

                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: screenId == 1
                      ? Text('Your order has been placed successfully, please pick your items from store ASAP', textAlign: TextAlign.center, )
                      : Text('Your booking has been placed successfully, you will receive a notification/sms about your booking status', textAlign: TextAlign.center, ),
                ),
              ],
            ))));
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    _init();
    super.initState();
  }


  Widget _shimmer() {
    return Padding(
        padding: const EdgeInsets.all(15),
        child: Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: 5,
              itemBuilder: (BuildContext context, int index) {
                return SizedBox(
                  width: 170,
                  height: 150,
                  child: Card(
                    margin: EdgeInsets.only(left: 5, right: 5),
                  ),
                );
              }),
        ));
  }



  _getAllBooking() async {
    try {
      bool isConnected = await br!.checkConnectivity();
      if (isConnected) {
        // showOnlyLoaderDialog();
        if (_isRecordPending) {
          print( global.user.role);

          await apiHelper?.getAllMyBooking("${global.user.id}").then((result) {
            //hideLoader();
            if (result != null) {
              if (result.resp_code == "00") {
                List<MyBooking> _tList = result.recordList;

                if (_tList.isEmpty) {
                  _isRecordPending = false;
                }

                _mybookingList.addAll(_tList);
                //  _serviceList.addAll(_tList);

                setState(() {
                  //  _isMoreDataLoaded = false;
                });
              }
              else if(result.resp_code =="01" && result.resp_message.toString().contains("Token is Invalid") )
              {
                Navigator.of(context).pushNamedAndRemoveUntil('login', (Route<dynamic> route) => false);
                showSnack(snackBarMessage: result.resp_message.toString());
              }

              else {
                _mybookingList = [];
              }
            }
          });
        }
      } else {
        hideLoader();
        showSnack( snackBarMessage: " No Network Available");

      }
    } catch (e) {
      print("Exception - viewMyBookingScreen.dart - _getAllMyBooking():" +
          e.toString());
    }
  }

  _init() async {
    try {
      await  _getAllBooking() ;

      isDataLoaded = true;
      setState(() {});
    } catch (e) {
      print("Exception - inituser.dart - _initFinal():" + e.toString());
    }
  }
}
