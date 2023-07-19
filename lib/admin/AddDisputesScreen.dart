import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:veeki/models/businessLayer/global.dart' as global;
import '../models/businessLayer/base.dart';
import '../utils/global.colors.dart';
import '../widgets/BottomNavBar.dart';
import '../widgets/button.global.dart';
import '../widgets/text.form.global.dart';

class AddDisputesScreen extends Base {
  AddDisputesScreen({Key? key}) ;

  @override
  _AddDisputesScreenState createState() => _AddDisputesScreenState();
}

class _AddDisputesScreenState extends BaseState{

  final TextEditingController disputeTitleController = TextEditingController();
  final TextEditingController bookingController = TextEditingController();
  final TextEditingController addDisputesdescController = TextEditingController();


  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();


  File? _tImage;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Disputes'),),
      key:_scaffoldKey ,
      bottomNavigationBar: Container(
          height: 110,
          child: BottomNavBar(id: "addDisputes",)
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                const SizedBox(height: 55),
                TextFormGlobal(
                  controller:  disputeTitleController,
                  text: 'Title',

                  obscure: false,
                  textInputType: TextInputType.text,
                ),
                const SizedBox(height: 15),
                TextFormGlobal(
                  controller: bookingController,
                  text: 'Booking ID',

                  obscure: false,
                  textInputType: TextInputType.number,
                ),
                const SizedBox(height: 15),
                const SizedBox(height: 20),
                Text('Project Description'),


                TextFormField(
                  controller: addDisputesdescController,
                  keyboardType: TextInputType.multiline,
                  maxLines: 9,
                  decoration: InputDecoration(
                    // prefixIcon: prefixIcon == null ? prefixIcon : Icon(prefixIcon,
                    //   color: Color.fromRGBO(105, 108, 121, 1),
                    // ),
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
                    hintText: "Describe your Disputes  ",
                    hintStyle: TextStyle(
                      fontSize: 14.0,
                      color: Color.fromRGBO(105, 108, 121, 0.7),
                    ),
                  ),
                ),



                const SizedBox(height: 40),

                const SizedBox(height: 40),


                // Text(global.firebaseToken!),

                ButtonGlobal(
                  isLoading:isLoading ,
                  ontap:(){

                  send();
                    } ,
                  text: 'Post  Disputes ',
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


  send() async {

    setState(() {
      isLoading = true;
    });
    try {
      if (disputeTitleController.text.isEmpty && bookingController.text.isEmpty && addDisputesdescController.text.isEmpty) {
        showSnack( snackBarMessage: 'Enter all fields');
        return;
      }
        bool isConnected = await br!.checkConnectivity();
        if (isConnected) {
          //showOnlyLoaderDialog();
          await apiHelper!.sendDisputes(global.user.id!,bookingController.text.trim(),disputeTitleController.text.trim(), addDisputesdescController.text.trim()).then((result) {
            if (result != null) {
              if (result.resp_code == "00") {
                setState(() {
                  isLoading = false;
                });
                nextScreen(context, 'profile');
                showSnack( snackBarMessage: result.resp_description);


              } else {
                hideLoader();
                showSnackBar(key: _scaffoldKey, snackBarMessage: '${result.resp_description}');
              }
            }
          });
        } else {
          showNetworkErrorSnackBar(_scaffoldKey);
        }

    } catch (e) {
      print("Exception - forgotPasswordScreen.dart - _forgotPassword():" + e.toString());
    }
  }
}
