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

class CategorySearchList extends Base{
  @override
  _CategorySearchListState createState() => _CategorySearchListState(this.cat_id);
  CategorySearchList (this.cat_id);

  final int cat_id;
}

class _CategorySearchListState extends BaseState {
  _CategorySearchListState(this.cat_id);

  int cat_id;
  bool _isDataLoaded = false;
  bool _isRecordPending = true;
  List<Service> _serviceList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(' Categories', style: AppBarTheme.of(context).titleTextStyle),

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

                          Expanded(child: CardButton(text1: "${ _serviceList[index].title??""}", text2: "${ _serviceList[index].amount??""}/hr", text3: "${ _serviceList[index].user![0].city??""}",text4: "${ _serviceList[index].user![0].state??""}", image: "${ _serviceList[index].user![0].profileImage??""}")),

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

              // CardButton(text1: "Treatment", text2: "BarberShop (650)", image: "Images/clippers.png"),
              // CardButton(text1: "Shaving", text2: "BarberShop (650)", image: "Images/clippers.png"),
              // CardButton(text1: "Beard Trimming", text2: "BarberShop (650)", image: "Images/clippers.png"),
              // CardButton(text1: "Kids Haircut", text2: "BarberShop (650)", image: "Images/clippers.png"),
              // CardButton(text1: "Facials and Trimming", text2: "BarberShop (650)", image: "Images/clippers.png"),

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
          await apiHelper?.getCategoryResult(cat_id).then((result) {
            // hideLoader();
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
      print("Exception - getcategoryScreen.dart - _getAllCategorylist():" +
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
