import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

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
//        Padding(
//          padding: const EdgeInsets.only(left: 10.0,top: 0.0,bottom: 0.0,right: 8.0),
//          child: Container(
//           height: 100,
//           child: ListView.builder(
//
//               scrollDirection: Axis.horizontal,
//               itemCount: _serviceList.length,
//               itemBuilder: (context, index){
//                 print("hello fellow Noigria");
//                 print(_serviceList[index].images![0].images!);
//                 return InkWell(
//                   onTap: (){
//                     Navigator.of(context).push(
//                         MaterialPageRoute(builder: (context) => Details())
//                     );
//                   },
//                   child: Container(
//                     margin: EdgeInsets.symmetric(horizontal: 6),
//                    padding: EdgeInsets.all(6),
//
//                    // alignment: Alignment.center,
//                     height: 220,
//                     width:  150,
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(6),
//                       boxShadow: [
//                         BoxShadow(
//                             color: Colors.black.withOpacity(0.2),
//                             blurRadius: 5,
//                             //blurStyle: BlurStyle.inner
//                         )
//                       ],
//                     ),
//                     child:
//                     Column(
//                       children: [
//
//
//
//                         FittedBox(
//                           child: ClipRRect(
//                             borderRadius: BorderRadius.circular(50),
//                             child:
//                      //  _serviceList[index].images![0].images!.isEmpty?
//                         //    Image.asset("Images/HomepageBannerImage.png",):
//                               Image.network(_serviceList[index].images![0].images!, width: 50,)
//                            // NetworkImage(_serviceList[index].images![0].images!)
//                   //  Image.asset("Images/HomepageBannerImage.png",)
//                           ),
//                         ),
//                         SizedBox(height:8,),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Expanded(
//                               child: Text(
//                                 _serviceList[index].title!,overflow: TextOverflow.ellipsis,
//                                 style: TextStyle(
//                                   color:  Colors.black87,
//                                   fontWeight: FontWeight.w600,
//                                   fontSize: 11,
//                                 ),
//                               ),
//                             ),
//                             Row(
//                               children: [
//                                 Text(
//                                   "4.7",
//                                   style: TextStyle(
//                                     color:  Colors.black87,
//                                     fontWeight: FontWeight.w600,
//                                     fontSize: 10,
//                                   ),
//                                 ),
//                                 Icon(Icons.star,color: Colors.yellow,size: 11,)
//                               ],
//                             ),
//
//                           ],
//                         ),
//                         Row(
//                           children: [
//                             Icon(Icons.location_on_outlined,size: 12,),
//                             // ignore: avoid_function_literals_in_foreach_calls
//                             // // Text(" St Luke's Guarden, Liverpool",)
//                             Row(
//                               children: [
//                                 Text(_serviceList[index].user!.first.city??"",
//                                   overflow: TextOverflow.ellipsis,
//
//                                   style: TextStyle(
//                                     color:  Colors.black87,
//                                     fontSize: 9.5,
//                                   ),
//                                 ),
// SizedBox(width: 7,),
//                                 Text(_serviceList[index].user!.first.state??"",
//
//                                   overflow: TextOverflow.ellipsis,
//                                   style: TextStyle(
//                                     color:  Colors.black87,
//                                     fontSize: 9.5,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         )
//                       ],
//                     ),
//                   ),
//                 );
//               }
//           ),
//       ),
//        )









      Padding(
        padding: const EdgeInsets.only(left: 7, right: 7),
        child: Align(
          alignment: Alignment.centerLeft,
          child: ListView.builder(
              itemCount: _serviceList.length,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
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
                          Details(service:_serviceList[index] )),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 7, right: 7, bottom: 2, top: 5),
                    child: Card(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                           _serviceList[index].images![0].images!.isEmpty?
                           Image.asset("Images/HomepageBannerImage.png",height: 80,width: 180,fit: BoxFit.cover,):
                              Image.network(_serviceList[index].images![0].images!,width: 180,
                           height: 80,fit: BoxFit.cover,),


                          // CachedNetworkImage(
                          //   imageUrl:  _serviceList[index].images![0].images!,
                          //   imageBuilder: (context, imageProvider) => Container(
                          //     width: 180,
                          //     height: 130,
                          //     decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), image: DecorationImage(fit: BoxFit.cover, image: imageProvider)),
                          //   ),
                          //    placeholder: (context, url) =>
                          //        Image.asset("Images/HomepageBannerImage.png",height: 80,width: 180,fit: BoxFit.cover,
                          //         ),
                          //     //  SizedBox(width: 180, height: 80, child: Center(child: CircularProgressIndicator())),
                          //   errorWidget: (context, url, error) => Container(
                          //     width: 180,
                          //     height: 80,
                          //     decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
                          //     child: Center(child: Text("No Image Available")),
                          //   ),
                          // ),
                          SizedBox(
                            width: 180,
                            child: Padding(
                              padding: EdgeInsets.only(left: 7, right: 7, bottom: 5, top: 5),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 3),
                                        child: Text('${_serviceList[index].title}', style: TextStyle(fontSize: 11), overflow: TextOverflow.ellipsis, maxLines: 1),
                                      )),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 180,
                            child: Padding(
                              padding: EdgeInsets.only(left: 7),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    Icons.location_on_outlined,
                                    size: 15,
                                  ),
                                  SizedBox(
                                    width: 150,
                                    child:

                                    Row(
                                      children: [
                                        Text(
                                          '${_serviceList[index].user!.first.city}',
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(fontSize: 11),
                                          maxLines: 1,
                                        ),  Text(
                                          ','
                                        ),  Text(
                                          '${_serviceList[index].user!.first.state}',
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(fontSize: 11),
                                          maxLines: 1,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),



                    //       _serviceList[index]. != null
                    //           ?
                    // Padding(
                    //         padding: EdgeInsets.only(left: 10, right: 10),
                    //         child:
                    //         Row(
                    //           mainAxisSize: MainAxisSize.min,
                    //           children: [
                    //             Text('${_barberShopList[index].rating}', style: Theme.of(context).primaryTextTheme.bodyText2),
                    //             RatingBar.builder(
                    //               initialRating: _barberShopList[index].rating,
                    //               minRating: 0,
                    //               direction: Axis.horizontal,
                    //               allowHalfRating: true,
                    //               itemCount: 5,
                    //               itemSize: 8,
                    //               itemPadding: EdgeInsets.symmetric(horizontal: 0),
                    //               itemBuilder: (context, _) => Icon(
                    //                 Icons.star,
                    //                 color: Colors.amber,
                    //               ),
                    //               ignoreGestures: true,
                    //               updateOnDrag: false,
                    //               onRatingUpdate: (rating) {},
                    //             )
                    //           ],
                    //         ),
                    //       )
                    //           : SizedBox()
                        ],
                      ),
                    ),
                  ),
                );
              }),
        ),
      )

          :


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
        // showOnlyLoaderDialog();
        if (_isRecordPending) {
          await apiHelper?.getAllService(pageNumber).then((result) {
            //hideLoader();
            if (result != null) {
              if (result.resp_code == "00") {
                List<Service> _tList = result.recordList;

                if (_tList.isEmpty) {
                  _isRecordPending = false;
                }

                _serviceList.addAll(_tList);

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
      print("Exception - getusersScreen.dart - _getAllService():" +
          e.toString());
    }
  }

  _init() async {
    try {
      await  _getAllService() ;

      _isDataLoaded = true;
      setState(() {});
    } catch (e) {
      print("Exception - inituser.dart - _initFinal():" + e.toString());
    }
  }







}
