import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:veeki/models/businessLayer/global.dart' as global;
import 'package:veeki/widgets/CardButton.dart';

import 'CategorySearchList.dart';
import 'Details.dart';
import 'ServiceSearchList.dart';
import 'models/businessLayer/base.dart';
import 'models/response/category_response.dart';
import 'models/response/service_response.dart';

class ServiceList extends Base{
  @override
  _ServiceListState createState() => _ServiceListState();
  ServiceList ({Key? key,});

 // List<Service>? servicelist;
}

class _ServiceListState extends BaseState {
  bool _isDataLoaded = false;
  bool _isRecordPending = true;
  List<Service> _serviceList = [];
  bool isLoading = false;
  TextEditingController messageTextCntr = TextEditingController();
 // _ServiceListState(this._serviceList);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recent Services', style: AppBarTheme.of(context).titleTextStyle),

      ),
      body:
      _isDataLoaded
          ?

      _serviceList.length > 0
          ?


      ListView.builder(
          shrinkWrap: true,
          itemCount: _serviceList.length,
          itemBuilder: (context, index){
            return Padding(
              padding: const EdgeInsets.only(left: 10.0,top: 8.0,bottom: 8.0,right: 8.0),
              child: InkWell(
                onTap: (){
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => Details(service:_serviceList[index])),
                  );
                },
                child:
                CardButton(text1: "${ _serviceList[index].title??""}",text2:"${ _serviceList[index].amount??""}/hr",
                    text3: "${ _serviceList[index].user![0].city??""}",text4: "${ _serviceList[index].user![0].state??""}",
                    image: "${ _serviceList[index].images![0].images??""}", block: (){


                    dialog(_serviceList[index].user![0].id,_serviceList[index].id, false, "Block");
                  },delete: (){
                    dialog(_serviceList[index].user![0].id, _serviceList[index].id, true, "Delete");
                  },
                ),

                // CardButton(text1: "${ _categoryList[index].title??""}", text2: "BarberShop (650)", image: "Images/clippers.png"),

              ),
            );
          }
      )

          :
      Text(
        "No result found ",

      )

          : _shimmer()
      ,

      // Container(
      //   width: double.infinity,
      //   padding: const EdgeInsets.all(20.0),
      //   child: Column(
      //     //mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //     children: [
      //
      //
      //     SizedBox(height: 30,),
      //
      //
      //
      //
      //
      //       SizedBox(height: 40,),
      //
      //
      //
      //     ],
      //   ),
      // ),
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
            shrinkWrap: true,
            itemCount: 8,
            itemBuilder: (BuildContext context, int index) {
              return Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 40,
                        child: Card(margin: EdgeInsets.only(top: 5, bottom: 5)),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width - 220,
                            height: 40,
                            child: Card(margin: EdgeInsets.only(top: 5, bottom: 5, left: 5)),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width - 120,
                            height: 40,
                            child: Card(margin: EdgeInsets.only(top: 5, bottom: 5, left: 5)),
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  )
                ],
              );
            }),
      ),
    );
  }

  Widget _shimmer2() {
    return Padding(
        padding: const EdgeInsets.all(5),
        child: Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: 5,
              itemBuilder: (BuildContext context, int index) {
                return SizedBox(
                  width: 110,
                  height: 50,
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


int pageNumber = 1;
  _getAllService() async {
    try {
      bool isConnected = await br!.checkConnectivity();
      if (isConnected) {
        // showOnlyLoaderDialog();
        if (_isRecordPending) {
          await apiHelper?.getAllService(pageNumber).then((result) {
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
      print("Exception - getserviceScreen.dart - _getAllServicelist():" +
          e.toString());
    }
  }

  _init() async {
    try {
      await  _getAllService() ;

      _isDataLoaded = true;
      setState(() {});
    } catch (e) {
      print("Exception - initcategory.dart - _initFinal():" + e.toString());
    }
  }

  void dialog(int? userid,int? id, bool bool, String activity) {
    setState(() {
      isLoading = true;
    });
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('$activity Post'),
            content:  TextField(
              controller:messageTextCntr ,
              decoration: InputDecoration(hintText: "Enter reason for blocking"),
            ),
            actions: <Widget>[
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  //  _dismissDialog();
                   // block(id,  bool);
                  },
                  child: Text('Close')),
              TextButton(
                onPressed: () {

                  block( userid, id,  bool);
                  Navigator.of(context).pop();
                 // _dismissDialog();
                },
                child: Text('Ok'),
              )
            ],
          );
        });


  }


  block(int? userid,int? id, bool bool)async{
    try {

      await apiHelper!.blockservice(userid!,messageTextCntr.text.trim(), id!, bool).then((result) {
    if (result != null) {
    if (result.resp_code == "00") {

setState(() { });

      showSnack( snackBarMessage: '${result.resp_description}');
hideLoader();

    } else {
      setState(() {
        isLoading = false;
      });
    showSnack( snackBarMessage: '${result.resp_message}');
    }
    }
    });


    } catch (e) {
    print("Exception - blockScreen.dart - _block():" + e.toString());
    }
  }


}
