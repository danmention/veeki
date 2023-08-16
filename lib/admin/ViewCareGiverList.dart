import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:veeki/models/businessLayer/global.dart' as global;
import 'package:veeki/models/userModel.dart';
import 'package:veeki/widgets/CardButton.dart';

import '../Details.dart';
import '../models/businessLayer/base.dart';



class ViewCareGiverList extends Base{
  @override
  _CurrentUserListState createState() => _CurrentUserListState();
  ViewCareGiverList ({Key? key,});

 // List<CurrentUser>? servicelist;
}

class _CurrentUserListState extends BaseState {
  bool _isDataLoaded = false;
  bool _isRecordPending = true;
  List<CurrentUser> _userList = [];
  bool isLoading = false;

  bool _isMoreDataLoaded = false;
  ScrollController _scrollController = ScrollController();
  TextEditingController messageTextCntr = TextEditingController();
 // _CurrentUserListState(this._userList);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Caregiver ', style: AppBarTheme.of(context).titleTextStyle),

      ),
      body:
      _isDataLoaded
          ?

      _userList.length > 0
          ?


      ListView.builder(
          controller: _scrollController,
          shrinkWrap: true,
          itemCount: _userList.length,
          itemBuilder: (context, index){
            return Padding(
              padding: const EdgeInsets.only(left: 10.0,top: 8.0,bottom: 8.0,right: 8.0),
              child: InkWell(
                onTap: (){
                  // Navigator.of(context).push(
                  //   MaterialPageRoute(builder: (context) => Details(service:_userList[index])),
                  // );
                },
                child:
               // Text( _userList[index].fullName??"")
                CardButtonUser(text1: "${ _userList[index].fullName??""}",

                  text2:"${ _userList[index].status ==  "1"?"User Enabled": "User Disabled"}",
                   // text3: "",
                    text3: "${ _userList[index].city??""}",

                   text4: "${ _userList[index].state??""}",

                   image: "${ _userList[index].profileImage ??""}",



                  enable: (){


                    dialog(_userList[index].id, true, "Enable");
                  },

                  delete: (){
                    dialog(_userList[index].id,  false, "Disable");
                  },
                ),

                // CardButton(text1: "${ _categoryList[index].title??""}", text2: "BarberShop (650)", image: "Images/clippers.png"),

              ),
            );
          }
      )

          :
      Center(
        child: Text(
          "No result found ",

        ),
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


  @override
  void initState() {
   _init();
    // TODO: implement initState
    super.initState();
  }


int pageNumber = 1;
  _getAllCurrentUser() async {
    try {
      bool isConnected = await br!.checkConnectivity();
      if (isConnected) {
        // showOnlyLoaderDialog();


        if (_isRecordPending) {
          setState(() {
            _isMoreDataLoaded = true;
          });

          if (_userList.isEmpty) {
            pageNumber = 1;
          } else {
            pageNumber++;
          }



          await apiHelper?.getAllCaregivers(pagenumber:  pageNumber).then((result) {
            // hideLoader();
            if (result != null) {
              if (result.resp_code == "00") {
                List<CurrentUser> _tList = result.recordList;

                if (_tList.isEmpty) {
                  _isRecordPending = false;
                }

                _userList.addAll(_tList);

                setState(() {
                  //  _isMoreDataLoaded = false;
                });
              } else {
                _userList = [];
              }
            }
          });
        }
      } else {
        hideLoader();
        showSnack( snackBarMessage: " No Network Available");

      }
    } catch (e) {
      print("Exception - getserviceScreen.dart - _getAllCurrentUserlist():" +
          e.toString());
    }
  }

  _init() async {
    try {
      await  _getAllCurrentUser() ;

      _scrollController.addListener(() async {
        if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent && !_isMoreDataLoaded) {
          setState(() {
            _isMoreDataLoaded = true;
          });
          await _getAllCurrentUser() ;
          setState(() {
            _isMoreDataLoaded = false;
          });
        }
      });
      _isDataLoaded = true;
      setState(() {});
    } catch (e) {
      print("Exception - initcategory.dart - _initFinal():" + e.toString());
    }
  }

  void dialog(int? userid, bool bool, String activity) {
    setState(() {
      isLoading = true;
    });
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('$activity '),
            content:  Text(

            "Are You Sure You Want To $activity This User?",
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
                  if(bool ){
                    enable( userid!, 1);
                  }else{
                    enable( userid!, 0);
                  }

                  Navigator.of(context).pop();
                 // _dismissDialog();
                },
                child: Text('Ok'),
              )
            ],
          );
        });


  }


  enable(int userid,int status, )async{
    try {

      await apiHelper!.enable_disable(userid, status, ).then((result) {
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
