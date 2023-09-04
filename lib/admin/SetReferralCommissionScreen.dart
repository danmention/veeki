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

class SetReferralCommissionScreen extends Base {
  @override
  _SetReferralCommissionScreenState createState() => _SetReferralCommissionScreenState();
  SetReferralCommissionScreen ({Key? key,});
}

class _SetReferralCommissionScreenState extends BaseState{


  GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();
  bool _isDataLoaded = false;
  bool _isRecordPending = true;

  String? _selectedStatusType;
  int? _selectedStatus;
  var status = [

    "ACTIVE",
    "INACTIVE",
  ];
  bool isLoading = false;


  final TextEditingController amountController = TextEditingController();




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
                  Text("Kindly set up how much  each user who refers anyone will be getting "
                      "from every service done ", style: TextStyle(fontSize: 20),),
                   SizedBox(height: 40,),
                  Container(
                    width:200,
                    child: MyDropdownFormField<String>(
                      items: status,
                      displayText: (usertype) => usertype,
                      onSelected: (usertype) {
                        setState(() {
                          _selectedStatusType = usertype;
                        });
                      },
                      labelText: 'Select Status',
                    ),
                  ),





                  const SizedBox(height: 15),

                  TextFormGlobal(
                    controller: amountController,
                    text: 'Amount',
                    obscure: false,
                    textInputType: TextInputType.number,
                  ),
                  SizedBox(height: 30,),
                  GestureDetector(
                    onTap: (){
                      _setDiscount();
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


  _setDiscount() async {
    try {
      if (amountController.text.isEmpty ) {
        showSnack( snackBarMessage: 'Add a fee');
        return;
      }

      if (_selectedStatusType==null ) {
        showSnack( snackBarMessage: 'Add a status');
        return;
      }


      bool isConnected = await br!.checkConnectivity();
      if (isConnected) {
        setState(() {
          isLoading = true;
        });
        if(_selectedStatusType =="ACTIVE"){
          _selectedStatus =1;
        }else{
          _selectedStatus =0;
        }
        await apiHelper?.setDiscount(user_id:   global.user.id.toString(),fee:
        amountController.text.trim(), status: _selectedStatus, referral_fee_id: "").then((result) {
          if (result != null) {
            if (result.resp_code == "00") {
              setState(() {
                isLoading = false;
              });


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
      print("Exception - setdiscountScreen.dart - _changePassword():" + e.toString());
    }
  }








  @override
  void initState() {


    // TODO: implement initState
    super.initState();
  }
}
