import 'package:flutter/material.dart';

import 'package:veeki/HomePage.dart';
import 'package:veeki/utils/global.colors.dart';
import 'package:veeki/widgets/BottomNavBar.dart';
import 'package:veeki/widgets/MyDropDownForm.dart';
import 'package:veeki/widgets/Profile.Buttons.dart';
import 'package:veeki/widgets/back.button.global.dart';
import 'package:veeki/widgets/text.form.global.dart';
import 'package:veeki/models/businessLayer/global.dart' as global;
import 'models/businessLayer/base.dart';
import 'models/request/signup_request.dart';
import 'models/response/category_response.dart';
import 'models/response/state_response.dart';

class AboutMe extends Base {
  @override
  _AboutMeState createState() => _AboutMeState();
  AboutMe ({Key? key,});
}

class _AboutMeState extends BaseState{

  String? birthDateInString;
  DateTime? birthDate;
  bool?  isDateSelected ;
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();
  bool _isDataLoaded = false;
  bool _isRecordPending = true;
  List<Category> _categoryList = [];
  List<States> _stateList = [];
  List<Area> _areaList = [];
  int? selected_area;
  String? _selectedGender;
  String? _selectedUserType;
  Category? _selectedCategory;
  States? _selectedState;

  String ? _selectedStateName;
  Area? _selectedArea;


  final TextEditingController aboutController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  SignupRequest signupRequest = SignupRequest();

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
                  Text("Tell us about yourself and your experience", style: TextStyle(fontSize: 20),),
                   SizedBox(height: 20,),
                  TextFormField(
                    decoration: InputDecoration(filled: true),
                    controller: aboutController,
                    minLines: 10, // any number you need (It works as the rows for the textarea)
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                  ),
                  SizedBox(height: 30,),
                  GestureDetector(
                    onTap: (){
                      _updateProfile();
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
                            "Submit ",
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




  _updateProfile() async {
    try {
    //  if (_selectedState &&  ) {
        bool isConnected = await br!.checkConnectivity();
        if (aboutController.text.isEmpty ||
            aboutController.text.trim().length < 6) {
             showSnack( snackBarMessage: 'Kindly fill in the values');
             return;
           }

        if (isConnected) {
         // showOnlyLoaderDialog();
          await apiHelper?.aboutmeProfile(
              global.user.id!,
              global.user.dateOfBirth!,global.user.city!,
              global.user.state!, global.user.streetAddress!,aboutController.text.trim()
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
