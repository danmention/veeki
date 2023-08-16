import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import 'package:veeki/HomePage.dart';
import 'package:veeki/utils/global.colors.dart';
import 'package:veeki/widgets/BottomNavBar.dart';
import 'package:veeki/widgets/CardButton.dart';
import 'package:veeki/widgets/Profile.Buttons.dart';
import 'package:veeki/widgets/back.button.global.dart';

import 'Details.dart';
import 'models/businessLayer/base.dart';
import 'models/response/category_response.dart';
import 'models/response/service_response.dart';

class UserSearchList extends Base{
  @override
  _CategorySearchListState createState() => _CategorySearchListState(this.user_id);
  UserSearchList (this.user_id);

  final int user_id;
}

class _CategorySearchListState extends BaseState {
  _CategorySearchListState(this.user_id);

  int user_id;
  bool _isDataLoaded = false;
  bool _isRecordPending = true;
  List<Service> _serviceList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(' User Services', style: AppBarTheme.of(context).titleTextStyle),

      ),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20.0),
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [


            SizedBox(height: 30,),

              _isDataLoaded
                  ?

              _serviceList.length > 0
                  ?


              Expanded(
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: _serviceList.length,
                    itemBuilder: (context, index){
                      return Padding(
                        padding: const EdgeInsets.only(top: 8.0,bottom: 8.0,right: 8.0),
                        child: InkWell(
                          onTap: (){
                            Navigator.of(context).push(
                                MaterialPageRoute(builder: (context) =>
                                Details(service:_serviceList[index] )),);
                          },
                          child:// SizedBox()
                          CardButton(text1: "${ _serviceList[index].title??""}",
                              text2: "${ _serviceList[index].amount??""}/${ _serviceList[index].unit??""}",
                              text3: "${ _serviceList[index].area??""}",
                              text4: _serviceList[index].state??"", image:  _serviceList[index].images?.first.images ??
                                  "https://www.nurseregistry.com/wp-content/uploads/2023/03/difference-between-a-nurse-and-a-caregiver.jpg"),
                          // CardButton(text1: "${ _serviceList[index].title??""}", text2: "${ _serviceList[index].amount??""}/hr",
                          //     text3: "${ _serviceList[index].user![0].city??""}",text4: "${ _serviceList[index].user![0].state??""}",
                          //     image: "${ _serviceList[index].user![0].profileImage??""}"),

                        ),
                      );
                    }
                ),
              )

                  :
              Center(
                child: Text(
                  "No result found",
                  style: TextStyle(fontSize: 22)
                ),
              )

                  : _shimmer()
              ,


              SizedBox(height: 40,),



            ],
          ),
        ),

      ),
      // bottomNavigationBar: Container(
      //     height: 60,
      //     child: BottomNavBar(id: "profile",)
      // ),
    );
  }

  Widget _shimmer() {
    return Padding(
        padding: const EdgeInsets.all(10),
        child: Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: 5,
              itemBuilder: (BuildContext context, int index) {
                return SizedBox(
                  width: 60,
                  height: 50,
                  child: Container(
                    margin: EdgeInsets.only(left: 5, right: 5),
                  ),
                );
              }),
        ));
  }

  // Widget _shimmer() {
  //   return Padding(
  //       padding: const EdgeInsets.all(10),
  //       child: Shimmer.fromColors(
  //         baseColor: Colors.grey[300]!,
  //         highlightColor: Colors.grey[100]!,
  //         child: ListView.builder(
  //             scrollDirection: Axis.vertical,
  //             itemCount: 5,
  //             itemBuilder: (BuildContext context, int index) {
  //               return SizedBox(
  //                 width: 90,
  //                 height: 50,
  //                 child: Card(
  //                   margin: EdgeInsets.only(left: 5, right: 5),
  //                 ),
  //               );
  //             }),
  //       ));
  // }
  @override
  void initState() {
    _init();
    // TODO: implement initState
    super.initState();
  }

  _getAllCategory() async {
    try {
      bool isConnected = await br!.checkConnectivity();
      if (isConnected) {
        // showOnlyLoaderDialog();
        if (_isRecordPending) {
          await apiHelper?.getAllMySerivices(user_id.toString()).then((result) {
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
      print("Exception - getuserScreen.dart - _getAllCategorylist():" +
          e.toString());
    }
  }



  _init() async {
    try {


      await  _getAllCategory() ;

      _isDataLoaded = true;
      setState(() {});
    } catch (e) {
      print("Exception - initcategory.dart - _initFinal():" + e.toString());
    }
  }
}
