import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:veeki/models/businessLayer/global.dart' as global;
import '../models/businessLayer/base.dart';
import '../utils/global.colors.dart';
import '../widgets/BottomNavBar.dart';
import '../widgets/MyDropDownForm.dart';
import '../widgets/button.global.dart';
import '../widgets/text.form.global.dart';

class SetDiscountScreen extends Base {
  SetDiscountScreen({Key? key}) ;

  @override
  _setDiscountScreenState createState() => _setDiscountScreenState();
}

class _setDiscountScreenState extends BaseState{

  final TextEditingController setDiscountController = TextEditingController();
 // final TextEditingController addCategoryController = TextEditingController();


  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  String? _selectedStatusType;
  int? _selectedStatus;
  var status = [

    "ACTIVE",
    "INACTIVE",
  ];
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Set Discount'),),
      key:_scaffoldKey ,
      bottomNavigationBar: Container(
          height: 110,
          child: BottomNavBar(id: "addcategory",)
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                const SizedBox(height: 55),
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




                const SizedBox(height: 40),
                TextFormGlobal(
                  controller: setDiscountController,
                  text: 'Set Discount',

                  obscure: false,
                  textInputType: TextInputType.text,
                ),
                const SizedBox(height: 40),




                ButtonGlobal(
                  isLoading:isLoading ,
                  ontap:(){

                    _setDiscount();} ,
                  text: 'Set  Discount ',
                  color: GlobalColors.primaryColor,
                  fontsize: 20,
                ),
                const SizedBox(height: 60),

              ],
            ),
          ),
        ),
      ),

    );
  }




  _setDiscount() async {
    try {
      if (setDiscountController.text.isEmpty ) {
        showSnackBar(key: _scaffoldKey, snackBarMessage: 'Add a fee');
        return;
      }

      if (_selectedStatusType==null ) {
        showSnackBar(key: _scaffoldKey, snackBarMessage: 'Add a status');
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
              setDiscountController.text.trim(), status: _selectedStatus, referral_fee_id: "").then((result) {
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
      print("Exception - resetPasswordScreen.dart - _changePassword():" + e.toString());
    }
  }
}
