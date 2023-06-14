import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import 'package:veeki/utils/global.colors.dart';

import '../models/businessLayer/base.dart';
import '../models/userModel.dart';

class PopularBarbersInHomePage extends Base {
  PopularBarbersInHomePage({Key? key}) ;
  _PopularBarbersInHomePageState createState() => _PopularBarbersInHomePageState();
}

class _PopularBarbersInHomePageState extends BaseState{


  bool _isDataLoaded = false;
  bool _isRecordPending = true;
  List<CurrentUser> _userList = [];
  @override
  Widget build(BuildContext context){
    return  _isDataLoaded
        ?

    _userList.length > 0
        ?
    Container(
        height: 200,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: _userList.length>10?15:_userList.length,
            itemBuilder: (context, index){
              print("${_userList[index].profileImage}");
              return Padding(
                padding: const EdgeInsets.only(left: 20.0,top: 8.0,bottom: 8.0,right: 8.0),
                child: InkWell(
                  onTap: (){
                   // https://api.veeki.co/profile/photo/4/1686072952.jpg
                  },
                  child: Container(
                    child: Column(
                      children: [
                       // CircleAvatar(backgroundImage: AssetImage('Images/download.png'), radius: 30),
                        _userList[index].profileImage != null?
                        CircleAvatar(
                          radius: 30.0,
                          backgroundImage:
                          NetworkImage(_userList[index].profileImage!),
                          backgroundColor: Colors.transparent,
                        )
                        // CachedNetworkImage(
                        //   //imageUrl: global.baseUrlForImage + _popularBarbersList[index].staff_image,
                        //   imageUrl: "https://api.veeki.co/profile/photo/4/"+ _userList[index].profileImage!,
                        //   imageBuilder: (context, imageProvider) => CircleAvatar(radius: 30, backgroundImage: imageProvider),
                        //   placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                        //   errorWidget: (context, url, error) => Icon(Icons.error),
                        // )

                            : CircleAvatar(backgroundImage: AssetImage('Images/download.png'), radius: 30),

                        Text(_userList[index].fullName??"",
                        style: TextStyle(
                          fontSize: 10,
                        )
                          ,)
                      ],
                    ),
                  ),
                ),
              );
            }
        ),
      )
        :
    Text(
      "No Record Found" ,
      style: Theme.of(context).primaryTextTheme.subtitle2,
    )

        : _shimmer();
  }

  @override
  void initState() {
    _init();
    // TODO: implement initState
    super.initState();
  }

  _getAllUsers() async {
    try {
      bool isConnected = await br!.checkConnectivity();
      if (isConnected) {
         //showOnlyLoaderDialog();
        if (_isRecordPending) {
          await apiHelper?.getAllUsers().then((result) {
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
              }  else if(result.resp_code == "01"){
                hideLoader();
                showSnack(snackBarMessage: result.resp_message.toString());
              }
              else {
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
      print("Exception - getusersScreen.dart - _getAllUser():" +
          e.toString());
    }
  }

  _init() async {
    try {
      await  _getAllUsers() ;

      _isDataLoaded = true;
      setState(() {});
    } catch (e) {
      print("Exception - inituser.dart - _initFinal():" + e.toString());
    }
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
}

