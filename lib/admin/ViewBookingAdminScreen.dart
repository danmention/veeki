import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:veeki/HomePage.dart';
import 'package:veeki/LoginScreen.dart';
import 'package:veeki/utils/global.colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:veeki/widgets/appbar.dart';
import '../../widgets/back.button.global.dart';
import '../models/businessLayer/base.dart';
import '../models/response/booking_admin_response.dart';
import '../models/response/service_response.dart';
import '../models/response/view_my_booking.dart';
import 'package:veeki/models/businessLayer/global.dart' as global;

import '../widgets/BottomNavBar.dart';


class ViewBookingAdminScreen extends Base {
  ViewBookingAdminScreen({Key? key}) ;
  _ViewBookingAdminScreenState createState() => _ViewBookingAdminScreenState();
}

class _ViewBookingAdminScreenState extends BaseState{
  final TextEditingController rewardpointController = TextEditingController();

  bool isDataLoaded = false;


  bool _isRecordPending = true;
  List<Service> _serviceList = [];
  List<AdminBooking> _mybookingList = [];
String? userId;
  bool _isMoreDataLoaded = false;

  GlobalKey<ScaffoldState> scaffoldKey =   GlobalKey<ScaffoldState>();



  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()async {
        Navigator.of(context).pop();
        return false;
      }

      ,
      child: Scaffold(
        appBar: AppBar(title: Text('View Booking'),),
          bottomNavigationBar: Container(
              height: 60,
              child: BottomNavBar(id: "booking",)
          ),
          key:scaffoldKey ,
        body: isDataLoaded
            ? _mybookingList != null && _mybookingList.length > 0
            ? ListView.builder(
          itemCount: _mybookingList.length,
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            return
              Container(
                  height: 120,
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: Color(0xff0000080)),
                    borderRadius: BorderRadius.all(
                        Radius.circular(
                            5.0) //                 <--- border radius here
                    ),
                  ),
                  margin: const EdgeInsets.symmetric(
                    vertical: 8,horizontal: 16),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 6, horizontal: 24),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 160,
                          child: Text("User: ${_mybookingList[index].user![0].fullName}", style: TextStyle(
                            color: Colors.black,overflow: TextOverflow.ellipsis,

                            fontSize:15,
                            fontFamily: 'Lato',
                            fontWeight: FontWeight.bold,),),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment
                              .spaceBetween,
                          children: [

                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [



                                Text("Date: ${_mybookingList[index].date!}", style: TextStyle(
                                  color: Colors.black,overflow: TextOverflow.ellipsis,

                                  fontSize:15,
                                  fontFamily: 'Lato',
                                  fontWeight: FontWeight.w500,),),
                                Text("Hours:${_mybookingList[index].numberOfHour!}", style: TextStyle(
                                  color: Colors.black,overflow: TextOverflow.ellipsis,

                                  fontSize:15,
                                  fontFamily: 'Lato',
                                  fontWeight: FontWeight.w500,),),
                              ],
                            ),


                            Column(
                              children: [
                                Text("₦ ${_mybookingList[index].amount!}", style: TextStyle(

                                      fontFamily: 'Lato',
                                      fontWeight: FontWeight.w400,
                                      fontSize: 17,),),

                                Text(
                                                  '${_mybookingList[index].area}',
                                                  overflow: TextOverflow.ellipsis,
                                                  //  style: Theme.of(context).primaryTextTheme.subtitle1,
                                                ),




                              ],
                            ),

                          ],),
                        Text("Caregiver: ${_mybookingList[index].caregiver![0].fullName}", style: TextStyle(
                          color: Colors.black,overflow: TextOverflow.ellipsis,

                          fontSize:15,
                          fontFamily: 'Lato',
                          fontWeight: FontWeight.bold,),),
                      ],
                    ),
                  ));


            //   Container(
            //   margin: const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
            //   child: Card(
            //       elevation: 5,
            //       child: ExpansionTile(
            //         children: [
            //           Column(
            //             children: [
            //               Text(
            //                 '${_mybookingList[index].amount}',
            //               //  style: Theme.of(context).primaryTextTheme.subtitle1,
            //               ),
            //               Text(
            //                 '${_mybookingList[index].area}',
            //                 //  style: Theme.of(context).primaryTextTheme.subtitle1,
            //               ),
            //             ],
            //           ),
            //         ],
            //         childrenPadding: EdgeInsets.all(10),
            //         leading:
            //              CircleAvatar(
            //           radius: 20,
            //           child: Icon(Icons.book),
            //         ),
            //         title: Text(
            //           '${_mybookingList[index].streetAddress}',
            //           style: TextStyle(fontSize: 15),
            //           maxLines: 2,
            //           overflow: TextOverflow.ellipsis,
            //         ),
            //       )),
            // );
          },
        )
            : Center(
          child: Text(
            "No result found",

          ),
        )
            : Center(
          child: CircularProgressIndicator(),
        )));}

        // SingleChildScrollView(
        //   child: SafeArea(
        //     child: Container(
        //       width: double.infinity,
        //
        //       padding: const EdgeInsets.all(10.0),
        //       child: Column(
        //         crossAxisAlignment: CrossAxisAlignment.start,
        //         children: [
        //           Row(
        //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //             children: [
        //               Row(
        //                 children: [
        //                   BackButtonGlobal(
        //                     widget: LoginScreen(),
        //                   ),
        //                   SizedBox(width: 10,),
        //                   Text(
        //                     'My Bookings',
        //                     style: TextStyle(
        //                       fontFamily: 'Lato',
        //                         color: GlobalColors.textColor,
        //                         fontSize: 20,
        //                         fontWeight: FontWeight.bold),
        //                   ),
        //                 ],
        //               ),
        //               Row(
        //                 mainAxisAlignment: MainAxisAlignment.end,
        //                 children: [
        //                   Icon(Icons.filter_alt_outlined)
        //                 ],
        //               )
        //
        //             ],
        //           ),
        //           SizedBox(height: 30,),
        //           Buttons(text1: "Grooming hair tips", text2: "Lorem ipsum dolor int"),
        //           Buttons(text1: "Get reward points", text2: "Lorem ipsum dolor int"),
        //           Buttons(text1: "Appointment cancelled", text2: "Lorem ipsum dolor int"),
        //           Buttons(text1: "Processing appointment", text2: "Lorem ipsum dolor int"),
        //           Buttons(text1: "30% off cidboys salon offer", text2: "Lorem ipsum dolor int"),
        //           Buttons(text1: "Welcome to our app", text2: "Lorem ipsum dolor int"),
        //
        //         ],
        //       ),
        //
        //     ),
        //   ),
        // ),






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


  @override
  void initState() {
    _init();
    // TODO: implement initState
    super.initState();
  }

  _getAllBooking() async {
    try {
      bool isConnected = await br!.checkConnectivity();
      if (isConnected) {
        // showOnlyLoaderDialog();
        if (_isRecordPending) {
          await apiHelper?.getAllAdminMyBooking().then((result) {
            //hideLoader();
            if (result != null) {
              if (result.resp_code == "00") {
                List<AdminBooking> _tList = result.recordList;

                if (_tList.isEmpty) {
                  _isRecordPending = false;
                }

                _mybookingList.addAll(_tList);
              //  _serviceList.addAll(_tList);

                setState(() {
                  //  _isMoreDataLoaded = false;
                });
              } else {
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
      print("Exception - viewMyBookingScreen.dart - _getAllMyAdminBooking():" +
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



