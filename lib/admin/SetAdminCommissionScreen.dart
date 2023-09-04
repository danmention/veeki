import 'package:flutter/material.dart';

import 'package:veeki/HomePage.dart';
import 'package:veeki/utils/global.colors.dart';
import 'package:veeki/widgets/BottomNavBar.dart';
import 'package:veeki/widgets/MyDropDownForm.dart';
import 'package:veeki/widgets/Profile.Buttons.dart';
import 'package:veeki/widgets/back.button.global.dart';
import 'package:veeki/widgets/text.form.global.dart';
import 'package:veeki/models/businessLayer/global.dart' as global;
import '../models/businessLayer/base.dart';
import '../models/request/signup_request.dart';
import '../models/response/category_response.dart';
import '../models/response/state_response.dart';

class SetAdminCommissionScreen extends Base {
  @override
  _SetAdminCommissionScreenState createState() => _SetAdminCommissionScreenState();
  SetAdminCommissionScreen ({Key? key,});
}

class _SetAdminCommissionScreenState extends BaseState{


  GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();
  bool _isDataLoaded = false;
  bool _isRecordPending = true;




  final TextEditingController amountController = TextEditingController();



  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar( elevation: 0,
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        backgroundColor: Colors.transparent,),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(height: 70,),
                  Text("Admin , Kindly set up how much (percentage)% you will "
                      "be getting from caregivers transaction", style: TextStyle(fontSize: 20),),
                   SizedBox(height: 20,),
                  const SizedBox(height: 15),
                  TextFormGlobal(
                    controller: amountController,
                    text: 'Amount%',
                    obscure: false,
                    textInputType: TextInputType.number,
                  ),
                  SizedBox(height: 30,),
                  GestureDetector(
                    onTap: (){
                      _setCommission();
                    },
                    child: Container(
                      margin: EdgeInsets.only(top: 20),

                      height: 50,
                      width: 150,
                      decoration: BoxDecoration(
                        color: GlobalColors.secondaryColor,
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [

                          Text(
                            "Submit  ",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                            ),

                          ),
                        ],
                      ),
                    ),
                  ),

             ])


            ),
          ),

        ),
      ),
      bottomNavigationBar: Container(
          height: 60,
          child: BottomNavBar(id: "profile",)
      ),
    );
  }




  _setCommission() async {
    try {
    //  if (_selectedState &&  ) {
        bool isConnected = await br!.checkConnectivity();
        if (amountController.text.isEmpty
            ) {
             showSnack( snackBarMessage: 'Kindly fill in the values');
             return;
           }

        if (isConnected) {
         // showOnlyLoaderDialog();
          await apiHelper?.setcommision(

              amountController.text.trim()
          ).then((result) {
            if (result != null) {
              if (result.resp_code == "00") {
               hideLoader();

                showSnack( snackBarMessage: '${result.resp_description}');

                setState(() {});
              } else {
                hideLoader();
                showSnack( snackBarMessage: '${result.resp_message}');
              }
            }
          });
        } else {
          showSnack(snackBarMessage: "No network  connection");
        }

    } catch (e) {
      print("Exception - aboutmeScreen.dart - _updateaboutme():" + e.toString());
    }
  }







  @override
  void initState() {


    // TODO: implement initState
    super.initState();
  }
}
