import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import 'package:veeki/HomePage.dart';
import 'package:veeki/utils/global.colors.dart';
import 'package:veeki/widgets/BottomNavBar.dart';
import 'package:veeki/widgets/CardButton.dart';
import 'package:veeki/widgets/Profile.Buttons.dart';
import 'package:veeki/widgets/back.button.global.dart';

import 'models/businessLayer/base.dart';
import 'models/userModel.dart';

class PopularCargivers extends Base {
  @override
  _PopularBarbersState createState() => _PopularBarbersState();
  PopularCargivers ({Key? key,}) ;
}

class _PopularBarbersState extends BaseState {

// != "SERVICE_PROVIDER"
  bool _isDataLoaded = false;
  bool _isRecordPending = true;
  List<CurrentUser> _userList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(10.0),
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          BackButtonGlobal(
                            widget: HomePage(),
                          ),
                          Text("Popular Therapist",
                            style:TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.search_outlined,size: 25,),
                        ],
                      )
                    ],
                  ),
                ),

                SizedBox(height: 10,),

                      _isDataLoaded
                ?

                _userList.length > 0
                ?
                Container(
                    height: 650,
                    child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    // itemCount: _userList.length>10?15:_userList.length,
                    itemCount:_userList.length,
                    itemBuilder: (context, index){

                        return Padding(
                        padding: const EdgeInsets.only(left: 10.0,top: 8.0,bottom: 8.0,right: 8.0),
                        child: InkWell(
                        onTap: (){

                        },
                        child:
                        Card(text1: _userList[index].fullName??"", text2:  _userList[index].state??"", image:  _userList[index].profileImage??"")


                   // Container(
                   //      child: Column(
                   //      children: [
                   //      // CircleAvatar(backgroundImage: AssetImage('Images/download.png'), radius: 30),
                   //      _userList[index].profileImage != null?
                   //      CircleAvatar(
                   //      radius: 30.0,
                   //      backgroundImage:
                   //      NetworkImage(_userList[index].profileImage!),
                   //      backgroundColor: Colors.transparent,
                   //      )
                   //
                   //
                   //          : CircleAvatar(backgroundImage: AssetImage('Images/download.png'), radius: 30),
                   //
                   //      Text(_userList[index].fullName??"",
                   //      style: TextStyle(
                   //      fontSize: 10,
                   //      )
                   //      ,)
                   //      ],
                   //      ),
                   //      ),

                        ),
                        );
              }
              ),
            )
                :
            Text(
            "No Record Found" ,
            style: TextStyle(fontSize: 18),
            )

                : _shimmer(),


                //
                // Card(text1: "Alexander", text2: "Speciality in hair style", image: "Images/download.png"),
                // Card(text1: "Nacho", text2: "Fades and buzz cut specialist", image: "Images/download.png"),
                // Card(text1: "Graham Arnold", text2: "Shaving Specialist", image: "Images/download.png"),
                // Card(text1: "Rahul Gonzalez", text2: "Beard trim Specialist", image: "Images/download.png"),
                // Card(text1: "Jonathan", text2: "Specialist in hair styles", image: "Images/download.png"),
                // Card(text1: "Wilfred", text2: "Spike cutting Specialist", image: "Images/download.png"),
                // Card(text1: "Kovacic Van", text2: "Long hair specialist", image: "Images/download.png"),

                //SizedBox(height: 40,),

                // Container(
                //   margin: EdgeInsets.only(top: 20),
                //   padding: EdgeInsets.only(top: 5),
                //   height: 40,
                //   width: 150,
                //   decoration: BoxDecoration(
                //     color: GlobalColors.primaryColor,
                //     borderRadius: BorderRadius.circular(5.0),
                //   ),
                //   child:Text(
                //     "Book Now",
                //     textAlign: TextAlign.center,
                //     style: TextStyle(
                //       color: Colors.white,
                //       fontSize: 17,
                //     ),
                //
                //   ),
                //
                // ),

              ],
            ),
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
                  width: 50,
                  height: 50,
                  child: Container(
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
                // hideLoader();
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


}



class Card extends StatelessWidget{
  const Card({Key? key, required this.text1, required this.text2, required this.image}) : super(key: key);
  final String text1;
  final String text2;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white70,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 15,
          )
        ],
      ),
      height: 80,
      child: Row(
        //mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(width: 20,),
          image.isNotEmpty?
          CircleAvatar(
                 radius: 45.0,
                 backgroundImage:
                 NetworkImage(image),
                 backgroundColor: Colors.transparent,
                 )

          // CircleAvatar(
          //     radius: 45,
          //     child: Image.network(image,width: 140,))

              :
          CircleAvatar(
            radius: 45,
            backgroundImage: AssetImage("Images/download.png"),
          ),
          //Image.asset(image,),
          SizedBox(width: 20,),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                text1,
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: GlobalColors.textColor
                ),
              ),
              SizedBox(height: 5,),
              Text(
                text2,
                style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    color: GlobalColors.textColor
                ),
              ),
            ],
          ),
        ],
      ),
    );

  }
}