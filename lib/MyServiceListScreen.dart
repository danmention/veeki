import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:veeki/Details.dart';
import '../models/response/service_response.dart';
import '../models/response/view_my_booking.dart';
import 'package:veeki/models/businessLayer/global.dart' as global;
import 'models/businessLayer/base.dart';
import 'models/response/service_response.dart';

class MyServiceListScreen extends Base {

  _MyServiceListScreenState createState() => _MyServiceListScreenState();
}

class _MyServiceListScreenState extends BaseState {

  bool isDataLoaded = false;


  bool _isRecordPending = true;
  List<Service> _serviceList = [];



  GlobalKey<ScaffoldState>? _scaffoldKey;



  bool _isMoreDataLoaded = false;
  ScrollController _scrollController = ScrollController();
  int pageNumber = 0;

  @override
  Widget build(BuildContext context){
    return

      isDataLoaded
          ?

      _serviceList.length > 0
          ?


      Padding(
        padding: const EdgeInsets.only( right: 7),
        child: ListView.builder(
            itemCount: _serviceList.length,
            shrinkWrap: true,
            // scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {

              print("this is the image");

              print( _serviceList[index].images![0].images!);

              return InkWell(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                overlayColor: MaterialStateProperty.all(Colors.transparent),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) =>
                    //BarberShopDescriptionScreen(_barberShopList[index].vendor_id, a: widget.analytics, o: widget.observer)),
                    Details(service:_serviceList.isNotEmpty ?_serviceList[index]:Service() )),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 7, right: 7, bottom: 22, top: 5),
                  child: Card(
                    child:
                    Row(children: [

                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [


                          _serviceList[index].images![0].images!.isEmpty?
                          Image.asset("Images/HomepageBannerImage.png",height: 100,width: 130,fit: BoxFit.cover,):
                          Image.network(_serviceList[index].images![0].images!,width: 130,
                            height: 100,fit: BoxFit.cover,),







                        ],
                      ),

                      Column(children: [
                        Container(
                          width: 160,
                          child: Row(
                           // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 3, bottom: 10),
                                    child: Text('${_serviceList[index].title}',
                                        style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold), overflow: TextOverflow.ellipsis, maxLines: 1),
                                  )),
                            ],
                          ),
                        ),

                        SizedBox(
                          width: 150,
                          child: _serviceList[index].area !=null?
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,

                            children: [
                              Icon(
                                Icons.location_on_outlined,
                                size: 15,
                              ),
                              Row(
                                children: [
                                  Text(
                                    _serviceList[index].area! ,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(fontSize: 11),
                                    maxLines: 1,
                                  ),  Text(
                                      ','
                                  ),

                                  _serviceList[index].state !=null ?
                                  Text(
                                    '${_serviceList[index].state}',
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(fontSize: 11),
                                    maxLines: 1,
                                  ):Text(''),
                                ],
                              ),
                            ],
                          ):SizedBox(),
                        ),
                      ],),




                    ],),

                  ),
                ),
              );
            }),
      )

          :


      Text(
        "NO SERVICES ",

      )

          : _shimmer();


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