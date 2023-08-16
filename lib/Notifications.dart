import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:veeki/HomePage.dart';
import 'package:veeki/LoginScreen.dart';
import 'package:veeki/utils/global.colors.dart';
import 'package:flutter/cupertino.dart';
import '../widgets/back.button.global.dart';
import 'models/businessLayer/base.dart';
import 'models/response/service_response.dart';
import 'models/response/view_my_booking.dart';
import 'package:veeki/models/businessLayer/global.dart' as global;

class Notifications extends Base {
  Notifications({Key? key}) ;
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends BaseState{
  final TextEditingController rewardpointController = TextEditingController();

  bool isDataLoaded = false;


  bool _isRecordPending = true;
  List<Service> _serviceList = [];
  List<MyBooking> _mybookingList = [];
  String? userId;
  bool _isMoreDataLoaded = false;

  GlobalKey<ScaffoldState> scaffoldKey =   GlobalKey<ScaffoldState>();


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()async {
        Navigator.of(context).pop();
        return false;
      }

      ,
      child: Scaffold(

        body: SingleChildScrollView(
          child: SafeArea(
            child: Container(
              width: double.infinity,

              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          BackButtonGlobal(
                            widget: HomePage(),
                          ),
                          SizedBox(width: 10,),
                          Text(
                            'Notifications',
                            style: TextStyle(
                                color: GlobalColors.textColor,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.end,
                      //   children: [
                      //     Icon(Icons.filter_alt_outlined)
                      //   ],
                      // )

                    ],
                  ),
                  SizedBox(height: 30,),
                  Buttons(text1: "Grooming hair tips", text2: "Lorem ipsum dolor int", image: "",),
                  Buttons(text1: "Get reward points", text2: "Lorem ipsum dolor int", image: "",),
                  Buttons(text1: "Appointment cancelled", text2: "Lorem ipsum dolor int", image: "",),
                  Buttons(text1: "Processing appointment", text2: "Lorem ipsum dolor int", image: "",),
                  Buttons(text1: "30% off cidboys salon offer", text2: "Lorem ipsum dolor int", image: "",),
                  Buttons(text1: "Welcome to our app", text2: "Lorem ipsum dolor int", image: "",),

                ],
              ),

            ),
          ),
        ),

      ),
    );
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

  _getAllBooking() async {
    try {
      bool isConnected = await br!.checkConnectivity();
      if (isConnected) {
        // showOnlyLoaderDialog();
        if (_isRecordPending) {
          await apiHelper?.getAllMyBooking("${global.user.id}").then((result) {
            //hideLoader();
            if (result != null) {
              if (result.resp_code == "00") {
                List<MyBooking> _tList = result.recordList;

                if (_tList.isEmpty) {
                  _isRecordPending = false;
                }

                _mybookingList.addAll(_tList);
                //  _serviceList.addAll(_tList);

                setState(() {
                  //  _isMoreDataLoaded = false;
                });
              }
              else if(result.resp_code =="01" && result.resp_message.toString().contains("Token is Invalid") )
              {
                Navigator.of(context).pushNamedAndRemoveUntil('login', (Route<dynamic> route) => false);
                showSnack(snackBarMessage: result.resp_message.toString());
              }

              else {
                _mybookingList = [];
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
      await  _getAllBooking() ;

      isDataLoaded = true;
      setState(() {});
    } catch (e) {
      print("Exception - inituser.dart - _initFinal():" + e.toString());
    }
  }
}


class Buttons extends StatelessWidget{
  const Buttons({Key? key, required this.text1,this.image,  this.text2}) : super(key: key);
  final String text1;
  final String? text2;
  final String? image;
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
            blurRadius: 10,
          )
        ],
      ),
      height: 80,
      child: Column(
        children: [

          Expanded(
            child: Row(
             // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [


                image!.isEmpty? Expanded(child: Image.asset("assets/nurse.jpeg",width: 50,)):Expanded(child: Image.network(image!,width: 50,)),
                Expanded(
                  flex: 2,
                 // padding: const EdgeInsets.only(left:10.0, right: 90),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        text1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: GlobalColors.textColor
                        ),
                      ),
                      SizedBox(height: 15,),
                      Text(
                        text2!,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                            color: GlobalColors.textColor
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(child: Icon(Icons.chevron_right))
              ],
            ),
          ),
        ],
      ),
    );

  }
}
