import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:veeki/models/businessLayer/global.dart' as global;
import 'package:veeki/Details.dart';
import 'package:veeki/utils/global.colors.dart';

import '../models/businessLayer/base.dart';
import '../models/response/service_response.dart';

class RecommendedBarbershopInHomePage extends Base {
  RecommendedBarbershopInHomePage({Key? key}) ;
  _RecommendedBarbershopInHomePageState createState() => _RecommendedBarbershopInHomePageState();
}

class _RecommendedBarbershopInHomePageState extends BaseState {




  bool _isDataLoaded = false;

  GlobalKey<ScaffoldState>? _scaffoldKey;

  bool _isRecordPending = true;
  List<Service> _serviceList = [];

  bool _isMoreDataLoaded = false;
  ScrollController _scrollController = ScrollController();
  int pageNumber = 0;

  @override
  Widget build(BuildContext context){
    return

      _isDataLoaded
          ?

      _serviceList.length > 0
          ?
       Container(
        height: 120,
        child: ListView.builder(
            controller: _scrollController,
            scrollDirection: Axis.horizontal,
            itemCount: _serviceList.length,
            itemBuilder: (context, index){
              return Padding(
                padding: const EdgeInsets.only(left: 10.0,top: 0.0,bottom: 0.0,right: 8.0),
                child: InkWell(
                  onTap: (){
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => Details())
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.all(6),
                   // alignment: Alignment.center,
                    height: 220,
                    width:  150,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(6),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 5,
                            //blurStyle: BlurStyle.inner
                        )
                      ],
                    ),
                    child:
                    Column(
                      children: [



                        FittedBox(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child:_serviceList[index].images![0].images!.isEmpty?
                            Image.asset("Images/HomepageBannerImage.png",):
                               Image.network(_serviceList[index].images![0].images!)
                           // NetworkImage(_serviceList[index].images![0].images!)

                          ),
                        ),
                        SizedBox(height:8,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              _serviceList[index].title!,
                              style: TextStyle(
                                color:  Colors.black87,
                                fontWeight: FontWeight.w600,
                                fontSize: 11,
                              ),
                            ),
                            Row(
                              children: [
                                Text(
                                  "4.7",
                                  style: TextStyle(
                                    color:  Colors.black87,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 10,
                                  ),
                                ),
                                Icon(Icons.star,color: Colors.yellow,size: 11,)
                              ],
                            ),

                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.location_on_outlined,size: 12,),
                            Text(" St Luke's Guarden, Liverpool",
                              style: TextStyle(
                                color:  Colors.black87,
                                fontSize: 9.5,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              );
            }
        ),
      )     :
      Text(
        "NO SERVICES ",
        style: Theme.of(context).primaryTextTheme.subtitle2,
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
        if (_isRecordPending) {
          setState(() {
            _isMoreDataLoaded = true;
          });

          if (_serviceList.isEmpty) {
            pageNumber = 1;
          } else {
            pageNumber++;
          }
          await apiHelper!.getAllService(pageNumber, ).then((result) {
            if (result != null) {
              if (result.resp_code == "00") {
                List<Service> _tList = result.recordList;

                if (_tList.isEmpty) {
                  _isRecordPending = false;
                }

                _serviceList.addAll(_tList);
                setState(() {
                  _isMoreDataLoaded = false;
                });
              } else {
                _serviceList = [];
              }
            }
          });
        }
      } else {

        showSnack(snackBarMessage: "No Network Connection");
      }
    } catch (e) {
      print("Exception - homeScreen.dart - _getServices():" + e.toString());
    }
  }

  _init() async {
    try {
      await _getAllService();
      _scrollController.addListener(() async {
        if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent && !_isMoreDataLoaded) {
          setState(() {
            _isMoreDataLoaded = true;
          });
          await _getAllService();
          setState(() {
            _isMoreDataLoaded = false;
          });
        }
      });
      _isDataLoaded = true;
      setState(() {});
    } catch (e) {
      print("Exception - serviceListScreen.dart - _initFinal():" + e.toString());
    }
  }



}
