import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:veeki/models/businessLayer/global.dart' as global;
import '../models/businessLayer/base.dart';
import '../utils/global.colors.dart';
import '../widgets/BottomNavBar.dart';
import '../widgets/button.global.dart';
import '../widgets/text.form.global.dart';

class AddCategoryScreen extends Base {
   AddCategoryScreen({Key? key}) ;

  @override
  _AddCategoryScreenState createState() => _AddCategoryScreenState();
}

class _AddCategoryScreenState extends BaseState{

  final TextEditingController addCategoryController = TextEditingController();


  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();


  File? _tImage;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Category'),),
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
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                const SizedBox(height: 55),

                const SizedBox(height: 15),

                GestureDetector(
                  onTap: (){

                    showImagePicker(context);

                  },
                  child: Center(
                    child:   _tImage != null? Image.file(_tImage!, height: 155,):
                    Container(
                      height: 155,
                      width: 400,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          Image.asset('assets/cloud.png',width: 49.0, height: 49,),
                          const SizedBox(height: 10,),
                          Text('Upload a picture')
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 15),


                const SizedBox(height: 40),
                TextFormGlobal(
                  controller: addCategoryController,
                  text: 'New Category',

                  obscure: false,
                  textInputType: TextInputType.text,
                ),
                const SizedBox(height: 40),


                // Text(global.firebaseToken!),

                ButtonGlobal(
                  isLoading:isLoading ,
                  ontap:(){

                    _addCategory();} ,
                  text: 'Add Category ',
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



  Future getImage(ImageSource imageSource, BuildContext context)async{
    try {
      final image = await ImagePicker().pickImage(source: imageSource,
        // maxHeight: 150.0,
        maxWidth: 500.0,

      );
      if (image == null) {
        return;
      }else{
        print(image.path.toString());
        final imageTemporary = File(image.path);


        setState(() {
          _tImage = imageTemporary;
        });
      }
      Navigator.of(context).pop();


    } catch(e){
      print("error::::::::: $e");
    }
  }
  void showImagePicker(BuildContext context) {

    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Wrap(
          children: [
            ListTile(
              onTap: (){
                getImage(ImageSource.camera, context);
              },
              leading: Icon(Icons.camera),
              title: Text('Use Camera'),
            ),
            ListTile(
              onTap: (){
                getImage(ImageSource.gallery, context);
              },
              leading: Icon(Icons.picture_in_picture),
              title: Text('Choose Gallery'),
            ),

          ],
        );
      },
    );


  }
  _addCategory() async {
    try {
      if (addCategoryController.text.isEmpty ) {
        showSnackBar(key: _scaffoldKey, snackBarMessage: 'Add a category');
        return;
      }

      if (_tImage == null ) {
        showSnack(snackBarMessage:"Choose at least one image ");
        return;
      }
        bool isConnected = await br!.checkConnectivity();
        if (isConnected) {
          setState(() {
            isLoading = true;
          });
          await apiHelper?.addcategory(global.user.id!,
              addCategoryController.text.trim(),_tImage ).then((result) {
            if (result != null) {
              if (result.resp_code == "00") {
                setState(() {
                  isLoading = false;
                });

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
