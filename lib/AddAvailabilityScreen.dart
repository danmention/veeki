
import 'dart:io';


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:veeki/models/businessLayer/global.dart' as global;


import 'package:veeki/utils/global.colors.dart';
import 'package:veeki/widgets/MyDropDownForm.dart';

import 'package:veeki/widgets/button.global.dart';
import 'package:veeki/widgets/text.form.global.dart';

import 'SignUpScreen.dart';
import 'models/businessLayer/base.dart';
import 'models/request/addservice_request.dart';

import 'models/response/category_response.dart';

class AddServiceScreen extends Base {

  @override
  _AddServiceScreenState createState() => _AddServiceScreenState();
}
class _AddServiceScreenState extends BaseState{


  Category? _selectedCategory;
  final TextEditingController _ctitle = TextEditingController();
  final TextEditingController _cdescription = TextEditingController();
  final TextEditingController _camount = TextEditingController();
  bool isLoading = false;
  GlobalKey<ScaffoldState> _scaffoldkey  = GlobalKey<ScaffoldState>();
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  AddServiceRequest _addServiceRequest = new AddServiceRequest();
  Box? box;
  File? _tImage;
  File? _tImage1;
  File? _tImage2;
  File? _tImage3;
  File? _tImage4;
  String? imageFlag;
  bool _isDataLoaded = false;
  bool _isRecordPending = true;
  List<Category> _categoryList = [];
  List<File> images = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key:_scaffoldkey,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(15.0),
            child: Form(
              key: _formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  const SizedBox(height: 55),
                  Text(
                    'Add Service',
                    style: TextStyle(
                        color: GlobalColors.textColor,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Add in to continues',
                    style: TextStyle(
                        color: GlobalColors.textColor,
                        fontSize: 13,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 40),

                  TextFormGlobal(
                    controller: _ctitle,
                    text: 'Title',
                    obscure: false,
                    textInputType: TextInputType.text,
                  ),
                  const SizedBox(height: 15),
                  TextFormGlobal(
                    controller: _cdescription,
                    text: 'Description',
                    obscure: false,
                    textInputType: TextInputType.emailAddress,
                  ),



                  const SizedBox(height: 15),

                  MyDropdownFormField<Category>(
                    items: _categoryList,
                    displayText: (category) => category.title!,
                    onSelected: (category) {
                      setState(() {
                        _selectedCategory = category;
                      });
                    },
                    labelText: 'Category',
                  ),
                  const SizedBox(height: 15),
                  TextFormGlobal(
                    controller: _camount,
                    text: 'Amount',
                    obscure: false,
                    textInputType: TextInputType.number,
                  ),
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
                  ButtonGlobal(
                    isLoading:isLoading ,
                    ontap:(){
                      setState(() {
                        isLoading = true;
                      });
                      addservice();
                    },
                  //  OnBoardingPage(),
                    text: 'Add Service',
                    color: GlobalColors.primaryColor,
                    fontsize: 15,
                  ),
                  const SizedBox(height: 60),



                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 50,
        color: Colors.white24,
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Can\'t submit service, send a feedback?',
            ),
            InkWell(
              onTap: (){
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => SignUpScreen()),
                );
              },
              child: Text(
                ' Click here',
                style: TextStyle(
                  color: GlobalColors.primaryColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future getImage1(ImageSource imageSource, BuildContext context)async{
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

      if(imageFlag=="image1")
        {
          setState(() {
            _tImage1 = imageTemporary;
            images.add(_tImage1!);
          });
        }else if(imageFlag=="image2"){
        setState(() {
          _tImage2 = imageTemporary;
          images.add(_tImage2!);
        });
        }else if(imageFlag=="image3"){
          setState(() {
            _tImage3 = imageTemporary;
            images.add(_tImage3!);
          });
        }
        else if(imageFlag=="image4"){
          setState(() {
            _tImage4 = imageTemporary;
            images.add(_tImage4!);
          });
      }

      }
      Navigator.of(context).pop();


    } catch(e){
      print("error::::::::: $e");
    }
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





  void showImagePicker1(BuildContext context) {

    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Wrap(
          children: [
            ListTile(
              onTap: (){
                getImage1(ImageSource.camera, context);
              },
              leading: Icon(Icons.camera),
              title: Text('Use Camera'),
            ),
            ListTile(
              onTap: (){
                getImage1(ImageSource.gallery, context);
              },
              leading: Icon(Icons.picture_in_picture),
              title: Text('Choose Gallery'),
            ),

          ],
        );
      },
    );


  }






  _getAllCategory() async {
    try {
      bool isConnected = await br!.checkConnectivity();
      if (isConnected) {
        // showOnlyLoaderDialog();
        if (_isRecordPending) {
          await apiHelper?.getAllCategory().then((result) {
            // hideLoader();
            if (result != null) {
              if (result.resp_code == "00") {
                List<Category> _tList = result.recordList;

                if (_tList.isEmpty) {
                  _isRecordPending = false;
                }

                _categoryList.addAll(_tList);

                setState(() {
                  //  _isMoreDataLoaded = false;
                });
              } else {
                _categoryList = [];
              }
            }
          });
        }
      } else {
        hideLoader();
        showNetworkErrorSnackBar(_scaffoldkey);

      }
    } catch (e) {
      print("Exception - hopCategoryScreen.dart - _getCategory():" +
          e.toString());
    }
  }

  _init() async {
    try {

      await  _getAllCategory() ;


      _isDataLoaded = true;
      setState(() {});
    } catch (e) {
      print("Exception - initcatgory.dart - _initFinal():" + e.toString());
    }
  }

  void addservice() async{
    try {

      _addServiceRequest.title = _ctitle.text.trim();
      _addServiceRequest.desc = _cdescription.text.trim();
      _addServiceRequest.amount = _camount.text.trim();



      if (_selectedCategory?.id == null) {
        showSnack(snackBarMessage:" please choose a category" );
        return;
      } else if (_ctitle.text.isEmpty && _cdescription.text.isEmpty && _camount.text.isEmpty ) {
        showSnack(snackBarMessage:"Enter all fields ");

        return;
      }
      else if (_tImage==null ||_tImage3==null ||_tImage1==null|| _tImage2==null||_tImage4==null ) {
        showSnack(snackBarMessage:"Choose at least one image ");

        return;
      }





        bool isConnected = await br!.checkConnectivity();
        if (isConnected) {
          showOnlyLoaderDialog();
          await apiHelper!.addService(id:global.user.id!,user_image:_tImage,
          title: _ctitle.text.trim(), desc: _cdescription.text.trim(),amount: _camount.text.trim(),
            cat_id: _selectedCategory!.id,amountrange: ''
          ).then((result) async {


            if (result != null) {
              if (result.resp_code == "00") {
               // hideLoader();


                setState(() {
                  isLoading = false;
                });
             int serviceid = result.data.id;
                print(serviceid);
              if(_tImage1 != null ||_tImage2  != null ||_tImage3 != null  ||_tImage1 != null ){
                addserviceImages(serviceid);
              }else{
                hideLoader();
                showSnackBar(snackBarMessage: 'Service submitted successfully');
              }


              //


              //


            //   Navigator.of(context).pushNamedAndRemoveUntil('home', (Route<dynamic> route) => false);


              }
              // else if(result.resp_code =="01" && result.resp_message.contains("please complete registration process"))
              // {
              //   nextScreen(context, 'login');
              // }


              else if(result.resp_code =="01")
              {
                hideLoader();
                showSnack(snackBarMessage: result.resp_message.toString());
              }

              else {
                hideLoader();



                if(result.errors[0].message != null){
                  showSnack( snackBarMessage: result.errors[0].message.toString());
                }else{
                  showSnack(snackBarMessage: result.resp_message.toString());
                }
              }
            }
          });
        }

        else {

          showSnack(snackBarMessage:" No network connection" );
        }

    } catch (e) {
      print("Exception - addserviceScreen.dart - _addsevice():" + e.toString());
    }
  }


  void addserviceImages(int serviceid) async{
    try {



      bool isConnected = await br!.checkConnectivity();
        if (isConnected) {
          showOnlyLoaderDialog();
          await apiHelper!.addServiceImages(userid:global.user.id!,user_image:images, serviceid: serviceid
          ).then((result) async {
            if (result != null) {
              if (result.resp_code == "00") {



                showSnackBar(snackBarMessage: result.resp_message.toString());


                hideLoader();


                Navigator.of(context).pushNamedAndRemoveUntil('home', (Route<dynamic> route) => false);


              }
              // else if(result.resp_code =="01" && result.resp_message.contains("please complete registration process"))
              // {
              //   nextScreen(context, 'login');
              // }


              else if(result.resp_code =="01")
              {
                hideLoader();
                showSnack(snackBarMessage: result.resp_message.toString());
              }

              else {
                hideLoader();



                if(result.errors[0].message != null){
                  showSnack( snackBarMessage: result.errors[0].message.toString());
                }else{
                  showSnack(snackBarMessage: result.message.toString());
                }
              }
            }
          });
        }

        else {

          showSnack(snackBarMessage:" No network connection" );
        }

    } catch (e) {
      print("Exception - signInScreen.dart - _loginWithEmail():" + e.toString());
    }
  }

  _showCupertinoModalSheet() {
    try {
      showCupertinoModalPopup(
        context: context,
        builder: (BuildContext context) => CupertinoActionSheet(
          title: Text(" Select Image"),
          actions: [
            CupertinoActionSheetAction(
              child: Text("Take a picture", style: TextStyle(color: Color(0xFF171D2C))),
              onPressed: () async {
                Navigator.pop(context);
                showOnlyLoaderDialog();
                _tImage = await br?.openCamera();
                hideLoader();

                setState(() {});
              },
            ),
            CupertinoActionSheetAction(
              child: Text("Choose from gallery", style: TextStyle(color: Color(0xFF171D2C))),
              onPressed: () async {
                Navigator.pop(context);
                showOnlyLoaderDialog();
                _tImage = await br?.selectImageFromGallery();
                hideLoader();

                setState(() {});
              },
            )
          ],
          cancelButton: CupertinoActionSheetAction(
            child: Text("Cancel", style: TextStyle(color: Color(0xFFFA692C))),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      );
    } catch (e) {
      print("Exception - accountSettingScreen.dart - _showCupertinoModalSheet():" + e.toString());
    }
  }



  @override
  void initState() {
    _init();

    // TODO: implement initState
    super.initState();
  }
}
