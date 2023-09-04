import 'package:flutter/material.dart';

import 'models/businessLayer/base.dart';
import 'models/response/medical_history_response.dart';
import 'package:veeki/models/businessLayer/global.dart' as global;
class ViewMedicalHistoryScreen extends Base {
   ViewMedicalHistoryScreen({Key? key}) ;

  @override
  _ViewMedicalHistoryScreenState createState() => _ViewMedicalHistoryScreenState();
}

class _ViewMedicalHistoryScreenState extends BaseState {

  MedicalHistoryResponse? medicalHistoryResponse;
  bool isDataLoaded = false;
  bool _isRecordPending = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 18.0),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20,),
                Text('User Medical Profile',  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),),
                SizedBox(height: 30,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(" Gender:", style: TextStyle(fontSize: 15),),
                    Text('${medicalHistoryResponse?.gender??" "}',
                      style: TextStyle(fontSize: 15),),
                  ],
                ),

                Divider(thickness: 0.4,color: Colors.grey,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(" Age:", style: TextStyle(fontSize: 15),),
                    Text('${medicalHistoryResponse?.age??" "}',
                      style: TextStyle(fontSize: 15),),
                  ],
                ),

                Divider(thickness: 0.4,color: Colors.grey,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(" Weight:", style: TextStyle(fontSize: 15),),
                    Text('${medicalHistoryResponse?.weight??" "}',
                      style: TextStyle(fontSize: 15),),
                  ],
                ),
                Divider(thickness: 0.4,color: Colors.grey,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(" Mobility options:", style: TextStyle(fontSize: 15),),
                    Expanded(
                      child: Text('${medicalHistoryResponse?.mobilityOptions??" "}',textAlign: TextAlign.right,
                        style: TextStyle(fontSize: 15),),
                    ),
                  ],
                ),
                Divider(thickness: 0.4,color: Colors.grey,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(" Conditions Under Management:", style: TextStyle(fontSize: 15),),
                    Expanded(
                      child: Text('${medicalHistoryResponse?.conditionsUnderManagement??" "}',textAlign: TextAlign.right,
                        style: TextStyle(fontSize: 15),),
                    ),
                  ],
                ),
                Divider(thickness: 0.4,color: Colors.grey,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(" Last checked BP :", style: TextStyle(fontSize: 15),),
                    Expanded(
                      child: Text('${medicalHistoryResponse?.lastCheckedBp??" "}',textAlign: TextAlign.right,
                        style: TextStyle(fontSize: 15),),
                    ),
                  ],
                ),
                Divider(thickness: 1,color: Colors.grey,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(" Last checked Sugar level:", style: TextStyle(fontSize: 15),),
                    Text('${medicalHistoryResponse?.lastCheckedSugarLevel??" "}',textAlign: TextAlign.right,
                      style: TextStyle(fontSize: 15),),
                  ],
                ),
                Divider(thickness: 0.4,color: Colors.grey,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(" Who you live with:", style: TextStyle(fontSize: 15),),
                    Text('${medicalHistoryResponse?.stayAddress??" "}',
                      style: TextStyle(fontSize: 15),),
                  ],
                ),
                Divider(thickness: 0.4,color: Colors.grey,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(" Would you like to share your  info with next of kin: ", style: TextStyle(fontSize: 12),),
                    Expanded(
                      child: Text('${medicalHistoryResponse?.shareNextOfKinInfo=="1"?"Yes":"No"}',textAlign: TextAlign.right,
                        style: TextStyle(fontSize: 15),),
                    ),
                  ],
                ),
                Divider(thickness: 0.4,color: Colors.grey,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Next of Kin Name:", style: TextStyle(fontSize: 15),),
                    Expanded(
                      child: Text('${medicalHistoryResponse?.nextOfKinName??" "}',textAlign: TextAlign.right,
                        style: TextStyle(fontSize: 15),),
                    ),
                  ],
                ),
                Divider(thickness: 1,color: Colors.grey,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(" Next of Kin Phone Number:", style: TextStyle(fontSize: 15),),
                    Expanded(
                      child: Text('${medicalHistoryResponse?.nextOfKinPhone??" "}',textAlign: TextAlign.right,
                        style: TextStyle(fontSize: 15),),
                    ),
                  ],
                ),
                Divider(thickness: 0.4,color: Colors.grey,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(" Next of Kin Address:", style: TextStyle(fontSize: 15),),
                    Expanded(
                      child: Text('${medicalHistoryResponse?.nextOfKinAltAddress??" "}',textAlign: TextAlign.right,
                        style: TextStyle(fontSize: 15),),
                    ),
                  ],
                ),
                Divider(thickness: 0.4,color: Colors.grey,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(" Next of Kin Email:", style: TextStyle(fontSize: 15),),
                    Expanded(
                      child: Text('${medicalHistoryResponse?.nextOfKinEmail??" "}',textAlign: TextAlign.right,
                        style: TextStyle(fontSize: 15),),
                    ),
                  ],
                ),
                Divider(thickness: 1,color: Colors.grey,),


                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(" Next of Kin Alt Number:", style: TextStyle(fontSize: 15),),
                    Expanded(
                      child: Text('${medicalHistoryResponse?.nextOfKinAltPhone??" "}',textAlign: TextAlign.right,
                        style: TextStyle(fontSize: 15),),
                    ),
                  ],
                ),
                Divider(thickness: 0.4,color: Colors.grey,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(" Next of Kin Gender :", style: TextStyle(fontSize: 15),),
                    Expanded(
                      child: Text('${medicalHistoryResponse?.nextOfKinAltGender??" "}',textAlign: TextAlign.right,
                        style: TextStyle(fontSize: 15),),
                    ),
                  ],
                ),
                Divider(thickness: 0.4,color: Colors.grey,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(" Past Medical History :", style: TextStyle(fontSize: 15),),
                    Expanded(
                      child: Text('${medicalHistoryResponse?.pastMedicalHistory??" "}',textAlign: TextAlign.right,
                        style: TextStyle(fontSize: 15),),
                    ),
                  ],
                ),
                Divider(thickness: 0.4,color: Colors.grey,),


              ],),
          ),
        ),
      ),
    );
  }



  @override
  void initState() {
    _init();
    // TODO: implement initState
    super.initState();
  }

  _getMedicalHistory() async {
    try {
      bool isConnected = await br!.checkConnectivity();
      if (isConnected) {
        // showOnlyLoaderDialog();
        if (_isRecordPending) {
          // await apiHelper?.getMedicalHistory(user_id:_mybookingList!.user![0].id ).then((result) {
          await apiHelper?.getMedicalHistory(user_id: global.user.id ).then((result) {
            //hideLoader();
            if (result != null) {
              if (result.resp_code == "00") {
                medicalHistoryResponse  = result.recordList;

                // if (_tList.isEmpty) {
                //   _isRecordPending = false;
                // }

                //  _mybookingList.addAll(_tList);
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
                //_mybookingList = [];
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
      await  _getMedicalHistory() ;

      isDataLoaded = true;
      setState(() {});
    } catch (e) {
      print("Exception - inituser.dart - _initFinal():" + e.toString());
    }
  }
}
