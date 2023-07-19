import 'package:flutter/material.dart';
import 'package:veeki/models/businessLayer/global.dart' as global;
import 'package:veeki/utils/global.colors.dart';
import 'package:veeki/widgets/BottomNavBar.dart';
import 'package:veeki/widgets/Profile.Buttons.dart';
import 'package:veeki/widgets/back.button.global.dart';
import 'package:veeki/widgets/button.global.dart';

import 'LoginScreen.dart';
import 'models/businessLayer/base.dart';
import 'models/userModel.dart';
import 'utils/constant.dart';



class sendSOS extends Base {


  @override
  _sendSOSState createState() => _sendSOSState();
}

class _sendSOSState extends BaseState{
  bool isLoading = false;
  TextEditingController message = TextEditingController();
  GlobalKey<ScaffoldState> _scaffoldKeyg = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      key: _scaffoldKeyg,
      body: Container(
child: Padding(
  padding: const EdgeInsets.symmetric(horizontal: 18.0),
  child:   Column(

    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.center,


    children: [
      Text(
        'Send Emergency Message',
        style: TextStyle(fontSize: 19, fontFamily: 'Lato'),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Text(
          'Do you need the attention of the admin or security agency, send a message.',
          style: TextStyle(fontSize: 14),
        ),
      ),
      SizedBox(height: 40,),
    Text('Send Emergency Message'),
    SizedBox(height: 20,),





    TextFormField(

      controller: message,

      keyboardType: TextInputType.multiline,

      maxLines: 4,

      decoration: InputDecoration(

        enabledBorder: OutlineInputBorder(

          borderSide: BorderSide(

            color: Color.fromRGBO(74, 77, 84, 0.2),

          ),

        ),

        focusedBorder: OutlineInputBorder(

          borderSide: BorderSide(

            color: Colors.black12,

          ),

        ),

        hintText: "send  your message  ",

        hintStyle: TextStyle(

          fontSize: 14.0,

          color: Color.fromRGBO(105, 108, 121, 0.7),

        ),

      ),

    ),
      const SizedBox(height: 40),
      ButtonGlobal(
        isLoading:isLoading,
        ontap:(){
          sendsos();
        },
        //  OnBoardingPage(),
        text: 'Send Emergency Message',
        color: GlobalColors.primaryColor,
        fontsize: 15,
      ),
  ],),
),

      ),);
  }

  void sendsos() async{
    setState(() {
      isLoading = true;
    });
    await getCurrentPosition().then((_) async {

      if (global.lat != null && global.lng != null) {
        setState(() {
          isLoading = false;
        });
        String messageandaddress = message.text.trim() + global.currentLocation!;

          await apiHelper?.sendSOS(global.user.id!,global.user.fullName!,messageandaddress ,global.lat!,global.lng!,'' ).then((result) {
            if (result != null) {
              if (result.resp_code == "00") {

                nextScreen(context, 'home');



              }
            }
          });

      } else {
        hideLoader();
        showSnackBar(key: _scaffoldKeyg, snackBarMessage: txt_please_enablet_location_permission_to_use_app);
      }
    });


    // try {
    //   bool isConnected = await br!.checkConnectivity();
    //   String messageandaddress = message.text.trim() + global.currentLocation!;
    //   if (isConnected) {
    //     await apiHelper?.sendSOS(global.user.id!,global.user.fullName!,messageandaddress ,global.lat!,global.lng!,'' ).then((result) {
    //       if (result != null) {
    //         if (result.resp_code == "00") {
    //
    //
    //
    //
    //
    //         }
    //       }
    //     });
    //   } else {
    //     showNetworkErrorSnackBar(_scaffoldKeyg);
    //   }
    // } catch (e) {
    //   print("Exception - profileScreen.dart - _sendsos():" + e.toString());
    // }

  }
}
