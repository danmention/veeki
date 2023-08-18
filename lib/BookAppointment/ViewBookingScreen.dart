import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:veeki/HomePage.dart';
import 'package:veeki/LoginScreen.dart';
import 'package:veeki/utils/global.colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:veeki/widgets/appbar.dart';
import '../../widgets/back.button.global.dart';
import '../Notifications.dart';
import '../admin/AddDisputesScreen.dart';
import '../models/businessLayer/base.dart';
import '../models/response/service_response.dart';
import '../models/response/view_my_booking.dart';
import 'package:veeki/models/businessLayer/global.dart' as global;

import '../widgets/BottomNavBar.dart';
import 'bookingDetailScreen.dart';


class ViewBookingScreen extends Base {
  ViewBookingScreen({Key? key}) ;
  _ViewBookingScreenState createState() => _ViewBookingScreenState();
}

class _ViewBookingScreenState extends BaseState{
  final TextEditingController rewardpointController = TextEditingController();

  bool isDataLoaded = false;


  bool _isRecordPending = true;
  List<Service> _serviceList = [];
  List<MyBooking> _mybookingList = [];
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
        appBar: AppBar(title: Text('Appointments '),),
          bottomNavigationBar: Container(
              height: 60,
              child: BottomNavBar(id: "booking",)
          ),
          key:scaffoldKey ,
        body: isDataLoaded
            ? _mybookingList != null && _mybookingList.length > 0
            ? Column(
              children: [
                SizedBox(height: 40,),
                Text('View all your Appointments here ', style: TextStyle(fontSize: 20),),
                SizedBox(height: 40,),

                Expanded(
                  child: ListView.builder(
          itemCount: _mybookingList.length,
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
                  return
                    _mybookingList[index].service!.length>0 ?


                    GestureDetector(
                      onTap: (){
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => BookingDetailScreen(booking:_mybookingList[index])),
                        );
                      },
                      child: ListTile(
                        leading: "${_mybookingList[index].service?[0].images![0].images}".isEmpty?
                        CircleAvatar(
                            backgroundImage:
                            AssetImage("assets/nurse.jpeg")):
                        CircleAvatar(
                         // radius: 50,
                            backgroundImage:
                          //  borderRadius: BorderRadius.circular(300.0),child:
                        NetworkImage("${_mybookingList[index].service?[0].images![0].images}",)),
                        title: Text("${_mybookingList[index].service?[0].title??" "}"),
                        subtitle: Text("Date: ${_mybookingList[index].date!}"),
                        trailing: Icon(Icons.more_vert),
                      ),
                    )
                    // Padding(
                    //   padding: const EdgeInsets.all(8.0),
                    //   child: Buttons(text1: "${_mybookingList[index].service?[0].title??" "}",
                    //     text2: "Date: ${_mybookingList[index].date!}",
                    //     image: "${_mybookingList[index].service?[0].images![0].images}",),
                    // )


                        : SizedBox();
                    Container(
                        height: 150,
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
                              _mybookingList[index].service!.length>0 ? SizedBox(
                                width: 160,
                                child:

                                Text(  "${_mybookingList[index].service![0].title}" , style: TextStyle(
                                  color: Colors.black,overflow: TextOverflow.ellipsis,

                                  fontSize:15,
                                  fontFamily: 'Lato',
                                  fontWeight: FontWeight.bold,),),
                              ):Text(  "Booking service" , style: TextStyle(
                                color: Colors.black,overflow: TextOverflow.ellipsis,

                                fontSize:15,
                                fontFamily: 'Lato',
                                fontWeight: FontWeight.bold,),),
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
                                      Container(
                                          margin: EdgeInsets.only(top: 10),
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Color(0xff0000080)),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(
                                                    3.0) //                 <--- border radius here
                                            ),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child:   Text("₦ ${_mybookingList[index].amount!}", style: TextStyle(

                                              fontFamily: 'Lato',
                                              fontWeight: FontWeight.w400,
                                              fontSize: 17,),),
                                          )),






                                      Text(
                                                        '${_mybookingList[index].area}',
                                                        overflow: TextOverflow.ellipsis,
                                                        //  style: Theme.of(context).primaryTextTheme.subtitle1,
                                                      ),

                                      Text(
                                        'Booking Ref Id: ${_mybookingList[index].id}',
                                        overflow: TextOverflow.ellipsis,
                                        //  style: Theme.of(context).primaryTextTheme.subtitle1,
                                      ),


                                      // GestureDetector(
                                      //   onTap: (){
                                      //     Navigator.of(context).push(MaterialPageRoute(builder: (context) => AddDisputesScreen()));
                                      //     nextScreen(context, 'addDisputes');
                                      //     //MaterialPageRoute(builder: (_) => AddDisputesScreen());
                                      //   },
                                      //   child:
                                      //
                                      //
                                      //   Container(
                                      //       margin: EdgeInsets.only(top: 10),
                                      //       decoration: BoxDecoration(
                                      //         border: Border.all(
                                      //             color: Color(0xff0000080)),
                                      //         borderRadius: BorderRadius.all(
                                      //             Radius.circular(
                                      //                 3.0) //                 <--- border radius here
                                      //         ),
                                      //       ),
                                      //       child: Padding(
                                      //         padding: const EdgeInsets.all(8.0),
                                      //         child: Text('Disputes',
                                      //             style:TextStyle(color: Colors.red)),
                                      //       )),
                                      // ),


                                    ],
                                  ),

                                ],),
                              Text("${_mybookingList[index].user![0].fullName??""}", style: TextStyle(
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
        ),
                ),
              ],
            )
            : Center(
          child: Text(
            "No result found",

          ),
        )
            :  _shimmer()
        // Center(
        //   child: CircularProgressIndicator(),
        // )
        //
      )

    );}







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



