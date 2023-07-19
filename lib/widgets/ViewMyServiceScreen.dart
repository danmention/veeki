import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:veeki/HomePage.dart';
import 'package:veeki/LoginScreen.dart';
import 'package:veeki/utils/global.colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:veeki/widgets/appbar.dart';
import '../../widgets/back.button.global.dart';
import '../ViewServiceDetailScreen.dart';
import '../models/businessLayer/base.dart';
import '../models/response/service_response.dart';
import '../models/response/view_my_booking.dart';
import 'package:veeki/models/businessLayer/global.dart' as global;

import '../widgets/BottomNavBar.dart';


class ViewServiceScreen extends Base {
  ViewServiceScreen({Key? key}) ;
  _ViewServiceScreenState createState() => _ViewServiceScreenState();
}

class _ViewServiceScreenState extends BaseState{
  final TextEditingController rewardpointController = TextEditingController();

  bool isDataLoaded = false;


  bool _isRecordPending = true;
  List<Service> _serviceList = [];
 // List<MyBooking> _mybookingList = [];
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
        appBar: AppBar(title: Text('View Services'),),
          bottomNavigationBar: Container(
              height: 110,
              child: BottomNavBar(id: "booking",)
          ),
          key:scaffoldKey ,
        body: isDataLoaded
            ? _serviceList != null && _serviceList.length > 0
            ? ListView.builder(
          itemCount: _serviceList.length,
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {

            String date = _serviceList[index].createdAt!.split("T")[0];
            return
              GestureDetector(
                onTap: (){
                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) => ViewServiceDetailScreen(service:_serviceList[index] ,)),
                  );
                },
                child: Container(
                    height: 80,
                    decoration: BoxDecoration(
                      color: Colors.orange[100],
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
                            child: Text("${_serviceList[index].title}", style: TextStyle(
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



                                  Text("Date: $date", style: TextStyle(
                                    color: Colors.black,overflow: TextOverflow.ellipsis,

                                    fontSize:15,
                                    fontFamily: 'Lato',
                                    fontWeight: FontWeight.w500,),),

                                ],
                              ),


                              Column(
                                children: [


                                  Text("₦ ${_serviceList[index].amount!}", style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                        fontFamily: 'Lato',

                                        fontSize: 17,),),

                                  Text("View details",

                                    style: TextStyle(
                                      color: Colors.black,overflow: TextOverflow.ellipsis,

                                      fontSize:12,
                                      fontFamily: 'Lato',
                                      fontWeight: FontWeight.w500,),),

                                  // Text(
                                  //                   '${_serviceList[index].}',
                                  //                   overflow: TextOverflow.ellipsis,
                                  //                   //  style: Theme.of(context).primaryTextTheme.subtitle1,
                                  //                 ),
                                ],
                              ),

                            ],),
                          // Text("${_mybookingList[index].caregiver![0].fullName}", style: TextStyle(
                          //   color: Colors.black,overflow: TextOverflow.ellipsis,
                          //
                          //   fontSize:15,
                          //   fontFamily: 'Lato',
                          //   fontWeight: FontWeight.bold,),),
                        ],
                      ),
                    )),
              );



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

  _getAllService() async {
    try {
      bool isConnected = await br!.checkConnectivity();
      if (isConnected) {
        // showOnlyLoaderDialog();
        if (_isRecordPending) {
          await apiHelper?.getAllMySerivices("${global.user.id}").then((result) {
            //hideLoader();
            if (result != null) {
              if (result.resp_code == "00") {
                List<Service> _tList = result.recordList;

                if (_tList.isEmpty) {
                  _isRecordPending = false;
                }

                _serviceList.addAll(_tList);
              //  _serviceList.addAll(_tList);

                setState(() {
                  //  _isMoreDataLoaded = false;
                });
              } else {
                _serviceList = [];
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
      await  _getAllService() ;

      isDataLoaded = true;
      setState(() {});
    } catch (e) {
      print("Exception - inituser.dart - _initFinal():" + e.toString());
    }
  }
}



