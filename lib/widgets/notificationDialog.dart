
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:toast/toast.dart';
import 'package:toast/toast.dart';
import 'package:veeki/Notifications.dart';
import '../AcceptRejectScreen.dart';
import '../booking_provider.dart';
import '../models/businessLayer/base.dart';
import '../models/businessLayer/global.dart' ;
import '../models/businessLayer/global.dart' as global;
import '../models/response/service_response.dart';

class NotificationDialog extends Base
{
  //final Service rideDetails;
  final String?  title;
  final String? body;
  final String? userToken;


 // NotificationDialog({required this.rideDetails,this.title,this.body,});
  NotificationDialog({this.title,this.body,this.userToken});

  @override
  _NotificationDialogState createState() => _NotificationDialogState(this.title,this.body, this.userToken);
}

class _NotificationDialogState extends BaseState{

   // String usertoken = '';
   // String content = '';
  final String?  title;
  final String? body;
  final String? userToken;

  _NotificationDialogState(this.title,this.body, this.userToken);

  @override
  Widget build(BuildContext context)


  {



// List<String> substrings = body!.split("+");
// print(substrings); // Output: [This is a, sample text]
//   content =  substrings[0];
// usertoken =substrings[1];
// print(substrings[1]);


assetsAudioPlayer.open(Audio("assets/alert.mp3"));
     assetsAudioPlayer.setVolume(1);
    assetsAudioPlayer.play();
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      backgroundColor: Colors.transparent,
      elevation: 1.0,
      child: Container(
        margin: EdgeInsets.all(5.0),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 10.0),
            Image.asset("assets/nurseicon.png", width: 150.0,),
            SizedBox(height: 10.0,),
            Text("New  Request", style: TextStyle(fontFamily: "lato", fontSize: 20.0,),),
            SizedBox(height: 20.0),
            Padding(
              padding: EdgeInsets.all(18.0),
              child: Column(
                children: [

                  title != null?   Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset("assets/cloud.png", height: 16.0, width: 16.0,),
                      SizedBox(width: 20.0,),
                      Expanded(
                        child: Container(child: Text(title!, style: TextStyle(fontSize: 18.0),)),
                      ),
                    ],
                  ):SizedBox(),
                  SizedBox(height: 20.0),

                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset("assets/cloud.png", height: 16.0, width: 16.0,),
                      SizedBox(width: 20.0,),
                      // Expanded(
                      //     child: Container(child: Text("₦${ref.watch(myprovider).initialAmount??"0.00"}", style: TextStyle(fontSize: 18.0),))
                      // ),

                      Expanded(
                          child: Container(child: Text(body!, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 18.0),))
                      ),

                    ],
                  ),


                  // SizedBox(height: 20.0),
                  //
                  // Row(
                  //   crossAxisAlignment: CrossAxisAlignment.start,
                  //   children: [
                  //     Image.asset("assets/cloud.png", height: 16.0, width: 16.0,),
                  //     SizedBox(width: 20.0,),
                  //     // Expanded(
                  //     //     child: Container(child: Text("₦${ref.watch(myprovider).initialAmount??"0.00"}", style: TextStyle(fontSize: 18.0),))
                  //     // ),
                  //
                  //
                  //   ],
                  // ),
                  SizedBox(height: 0.0),

                ],
              ),
            ),

            SizedBox(height: 15.0),
            Divider(height: 2.0, thickness: 4.0,),
            SizedBox(height: 0.0),

            Padding(
              padding: EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(color: Colors.red)),
                    color: Colors.white,
                    textColor: Colors.red,
                    padding: EdgeInsets.all(8.0),
                    onPressed: ()
                    {

                     assetsAudioPlayer.stop();
                     Navigator.pop(context);
                    //  callBookingStatus(3, context);

                    },
                    child: Text(
                      "Cancel".toUpperCase(),
                      style: TextStyle(
                        fontSize: 14.0,
                      ),
                    ),
                  ),

                  SizedBox(width: 25.0),

                  MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(color: Colors.green)),
                    onPressed: ()
                    {

                      assetsAudioPlayer.stop();
                      Navigator.pop(context);

                      callBookingStatus(1, context);
                    },
                    color: Colors.green,
                    textColor: Colors.white,
                    child: Text("Accept".toUpperCase(),
                        style: TextStyle(fontSize: 14)),
                  ),

                ],
              ),
            ),

            SizedBox(height: 0.0),
          ],
        ),
      ),
    );
  }



  var snackBar = SnackBar(
    content: Text('Yay! A SnackBar!'),
  );


  displayToastMessage(String message, BuildContext context) {
    Fluttertoast.showToast(msg: message);


  }



  void callBookingStatus(int status, context) async{

    try {
      //Navigator.pop(context);
      //ToastContext.init(context);

      assetsAudioPlayer.stop();
    await apiHelper!.bookingstatus( id:global.user.id,status:status).then((result) async {
      Navigator.pop(context);
    if (result != null) {
      if (result.resp_code == "00") {
        print(" the other key ${userToken}");
        notifyUser(userToken!);

        // Navigator.push(context, MaterialPageRoute(
        //     builder: (context) => AcceptRejectScreen(status: status,)));
      }
      }
    });

    } catch (e) {
      print("Exception - sendbookingstatusScreen.dart - _addbookstatus():" + e.toString());
    }
  }


  void notifyUser(String body)async{

//print("this is the services d ${ref.watch(myprovider).bookedService.user![0].fullName}");
    //₦${ref.watch(myprovider).initialAmount??"0.00"}
    await apiHelper!.pushnotificationuser(body,"accepted",
        // "₦${ref.watch(myprovider).initialAmount??"0.00"}",
        // "${bookingRequest!.streetAddress!}",
      //  "${service!}",
       // "${service!.user![0].fullName}" ).then((result) async {
        "Therapist accepted " ).then((result) async {

      if (result != null) {
        if (result.success == "1") {
          Navigator.push(context, MaterialPageRoute(
              builder: (context) => AcceptRejectScreen(status: 1)));

          //  showSnack(snackBarMessage: " Notice sent");

        }
      }
    });
  }
}


