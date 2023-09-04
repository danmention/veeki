import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:shimmer/shimmer.dart';
import 'package:veeki/Details.dart';
import 'package:veeki/models/userModel.dart';
import 'package:veeki/utils/global.colors.dart';
import 'package:veeki/widgets/back.button.global.dart';
import '../models/response/service_response.dart';
import '../models/response/view_my_booking.dart';
import 'package:veeki/models/businessLayer/global.dart' as global;
import 'HomePage.dart';
import 'models/businessLayer/base.dart';
import 'models/response/service_response.dart';

class MyReferralListScreen extends Base {

  _MyReferralListScreenState createState() => _MyReferralListScreenState();
}

class _MyReferralListScreenState extends BaseState {

  bool isDataLoaded = false;


  bool _isRecordPending = true;
  List<CurrentUser> _serviceList = [];



  GlobalKey<ScaffoldState>? _scaffoldKey;



  bool _isMoreDataLoaded = false;
  ScrollController _scrollController = ScrollController();
  int pageNumber = 0;

  @override
  Widget build(BuildContext context){
    return




      Scaffold(
        body: Padding(
          padding: const EdgeInsets.only( right: 18, top: 30, left: 18,),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BackButtonGlobal(
                widget: HomePage(),
                // widget: bottomNav(index: 0,),
              ),
              Center(child: Text("My Referrals", style: TextStyle(fontSize: 20),)),
              SizedBox(height: 20,),
              isDataLoaded
                  ?

              _serviceList.length > 0
                  ?
              ListView.builder(
                  itemCount: _serviceList.length,
                  shrinkWrap: true,
                  // scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {

                    print(_serviceList[index].createdAt);
                    final dateTimeString = _serviceList[index].createdAt;
                    final dateTime = DateTime.parse(dateTimeString!);
                    final formattedDate = DateFormat('MMMM d, y - hh:mm a').format(dateTime);

                    print( formattedDate);

                    return InkWell(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      overlayColor: MaterialStateProperty.all(Colors.transparent),
                      onTap: () {
                        // Navigator.of(context).push(
                        //   MaterialPageRoute(builder: (context) =>
                        //   //BarberShopDescriptionScreen(_barberShopList[index].vendor_id, a: widget.analytics, o: widget.observer)),
                        //   Details(service:_serviceList.isNotEmpty ?_serviceList[index]:Service() )),
                        // );
                      },
                      child:

                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [

                      _serviceList[index].profileImage == null?
                                  CircleAvatar(
                                      radius: 30,
                                    backgroundImage: AssetImage("Images/HomepageBannerImage.png",)
                                  ):
                                    CircleAvatar(
                                      radius: 30,
                                    backgroundImage:

                                    NetworkImage(_serviceList[index].profileImage!,

                                                            ),

                                    )
                                    ,
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Container(
                                    width: 220,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                         Container(

                                           child: Text(
                                            "${_serviceList[index].fullName}",
                                            style:
                                            TextStyle(fontWeight: FontWeight.w500, fontSize: 14),overflow: TextOverflow.ellipsis,
                                        ),
                                         ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          "$formattedDate",
                                          textAlign: TextAlign.right,
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 12,
                                              color: GlobalColors.primaryColor.withOpacity(0.5)),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                               Text(
                                "+ ${_serviceList[index].city}",
                                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Divider(
                            thickness: 1,
                          ),
                        ],
                      ),




                      // Padding(
                      //   padding: const EdgeInsets.only(left: 7, right: 7, bottom: 22, top: 5),
                      //   child: Card(
                      //     child:
                      //     Row(children: [
                      //
                      //       Column(
                      //         mainAxisAlignment: MainAxisAlignment.start,
                      //         crossAxisAlignment: CrossAxisAlignment.start,
                      //         children: [
                      //
                      //
                      //           _serviceList[index].images![0].images!.isEmpty?
                      //           Image.asset("Images/HomepageBannerImage.png",height: 100,width: 130,fit: BoxFit.cover,):
                      //           Image.network(_serviceList[index].images![0].images!,width: 130,
                      //             height: 100,fit: BoxFit.cover,),
                      //
                      //
                      //
                      //
                      //
                      //
                      //
                      //         ],
                      //       ),
                      //
                      //       Column(children: [
                      //         Container(
                      //           width: 160,
                      //           child: Row(
                      //            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //             children: [
                      //               Expanded(
                      //                   child: Padding(
                      //                     padding: const EdgeInsets.only(left: 3, bottom: 10),
                      //                     child: Text('${_serviceList[index].title}',
                      //                         style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold), overflow: TextOverflow.ellipsis, maxLines: 1),
                      //                   )),
                      //             ],
                      //           ),
                      //         ),
                      //
                      //         SizedBox(
                      //           width: 150,
                      //           child: _serviceList[index].area !=null?
                      //           Row(
                      //             mainAxisAlignment: MainAxisAlignment.start,
                      //             crossAxisAlignment: CrossAxisAlignment.start,
                      //
                      //             children: [
                      //               Icon(
                      //                 Icons.location_on_outlined,
                      //                 size: 15,
                      //               ),
                      //               Row(
                      //                 children: [
                      //                   Text(
                      //                     _serviceList[index].area! ,
                      //                     overflow: TextOverflow.ellipsis,
                      //                     style: TextStyle(fontSize: 11),
                      //                     maxLines: 1,
                      //                   ),  Text(
                      //                       ','
                      //                   ),
                      //
                      //                   _serviceList[index].state !=null ?
                      //                   Text(
                      //                     '${_serviceList[index].state}',
                      //                     overflow: TextOverflow.ellipsis,
                      //                     style: TextStyle(fontSize: 11),
                      //                     maxLines: 1,
                      //                   ):Text(''),
                      //                 ],
                      //               ),
                      //             ],
                      //           ):SizedBox(),
                      //         ),
                      //       ],),
                      //
                      //
                      //
                      //
                      //     ],),
                      //
                      //   ),
                      // ),
                    );
                  })    :


              Text(
                "NO Referrals ",

              )

                  : _shimmer(),
            ],
          ),
        ),
      )

       ;


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
          await apiHelper?.getAllMyReferrals("${global.user.id}").then((result) {
            //hideLoader();
            if (result != null) {
              if (result.resp_code == "00") {
                List<CurrentUser> _tList = result.recordList;

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