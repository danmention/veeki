import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:veeki/LoginScreen.dart';
import 'package:veeki/models/businessLayer/base.dart';
import 'package:veeki/utils/global.colors.dart';
import 'package:veeki/widgets/MyDropDownForm.dart';
import 'package:veeki/widgets/back.button.global.dart';
import 'package:veeki/widgets/button.global.dart';
import 'package:veeki/widgets/text.form.global.dart';
import 'package:veeki/models/businessLayer/global.dart' as global;
import 'AddMedicalHistoryForm2Screen.dart';
import 'models/request/medical_history_request.dart';
import 'utils/constant.dart';

class MedicalHistoryForm1Screen extends Base {
   MedicalHistoryForm1Screen({Key? key});

  @override
  _MedicalHistoryForm1ScreenState createState() => _MedicalHistoryForm1ScreenState();
}

class _MedicalHistoryForm1ScreenState extends BaseState{


  MedicalHistoryRequest medicalHistoryRequest = MedicalHistoryRequest();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();


  GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();
  bool _isDataLoaded = false;
  bool _isRecordPending = true;
  bool isLoading = false;


  String? _selectedGender;
  String? _selectedmobilityOptions;


  var gender = [
    "Male",
    "Female",
  ];


  List<String> shareinfo = [
    "Yes",
    "No",
  ];


  var mobility = [
    "Wheelchair", "Bed bound", "Crutches",
    "Walking stick", "0ther"
  ];




  @override
  Widget build(BuildContext context) {

    medicalHistoryRequest.userId =  global.user.id.toString();
    return Scaffold(

      key: _scaffoldkey,
      body: SingleChildScrollView(
        child: SafeArea(

          child: Container(

            width: double.infinity,
            padding: const EdgeInsets.all(15.0),
            child: Form(
              key: _formkey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children:  [

                  const SizedBox(height: 55),
                  Text(
                    ' Medical Health History',
                    style: TextStyle(
                        color: GlobalColors.textColor,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Submit Report',
                      style: TextStyle(
                          color: GlobalColors.textColor,
                          fontSize: 13,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  const SizedBox(height: 30),

                  TextFormGlobal(
                    onsave: (value){

                      medicalHistoryRequest.nextOfKinName = value;
                      },

                    text: 'Next of  Kin Name',
                    obscure: false,
                    textInputType: TextInputType.text,
                  ),
                  const SizedBox(height: 20),
                  TextFormNumberGlobal(
                    onsave: (value){

                      medicalHistoryRequest.nextOfKinPhone = value;
                    },

                    text: 'Next of  Kin Phone Number',
                    obscure: false,
                    textInputType: TextInputType.number,
                  ),
                  const SizedBox(height: 20),

                  TextFormNumberGlobal(
                    onsave: (value){

                      medicalHistoryRequest.nextOfKinAltPhone = value;
                    },

                    text: 'Next of  Kin Alternate PhoneNumber',
                    obscure: false,
                    textInputType: TextInputType.number,
                  ),
                  const SizedBox(height: 20),
                  TextFormGlobal(
                    onsave: (value){

                      medicalHistoryRequest.nextOfKinAltAddress = value;
                    },

                    text: 'Next of  Kin Address',
                    obscure: false,
                    textInputType: TextInputType.text,
                  ),

                  const SizedBox(height: 20),




                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [


                      Expanded(
                        child: Container(
                          width:230,
                          child: MyDropdownFormField<String>(
                            items: mobility,
                            displayText: (usertype) => usertype,
                            onSelected: (usertype) {
                              setState(() {
                                medicalHistoryRequest.mobilityOptions   = usertype;
                              });
                            },
                            labelText: 'Select Mobility Options',
                          ),
                        ),
                      ),
                      SizedBox(width: 10,),




                      const SizedBox(height: 15),

                      Expanded(
                        child: Container(
                          width:180,
                          child: MyDropdownFormField<String>(
                            items: gender,
                            displayText: (area) => area,
                            onSelected: (gen) {
                              setState(() {
                                _selectedGender = gen;

                                medicalHistoryRequest.nextOfKinAltGender = _selectedGender;
                              });
                            },
                            labelText: 'Next of Kin Gender',
                          ),
                        ),
                      ),

                    ],),


                  const SizedBox(height: 20),
                  TextFormGlobal(
                    controller: emailController,
                    text: 'Next of Kin Email Address',
                    onsave: (value){
                      medicalHistoryRequest.nextOfKinEmail = value;
                    },
                    obscure: false,
                    textInputType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 20),
                       Text('Do you consent to sharing confidential information with  next of kin?'),
                  Container(
                  //  width:180,
                    child: MyDropdownFormField<String>(
                      items: shareinfo,

                      onSelected: (gen) {
                        setState(() {
                       var   _selected = gen;
                          medicalHistoryRequest.shareNextOfKinInfo = _selected=="Yes"?true:false ;
                        });
                      },
                      labelText: 'Do you?',
                    ),
                  ),
                  SizedBox(height: 20),
                  // TextFormNumberGlobal(
                  //   onsave: (value){
                  //     medicalHistoryRequest.shareNextOfKinInfo = value;
                  //   },
                  //   text: 'Do you consent to sharing confidential information with  next of kin?',
                  //   obscure: false,
                  //   textInputType: TextInputType.text,
                  // ),



                  // Row(
                  //   crossAxisAlignment: CrossAxisAlignment.start,
                  //
                  //   children: [
                  //     Expanded(
                  //       child: Container(
                  //         width: 150,
                  //         child: TextFormNumberGlobal(
                  //           onsave: (value){
                  //             medicalHistoryRequest.age = value;
                  //           },
                  //
                  //           text: 'Your Age ',
                  //           obscure: false,
                  //           textInputType: TextInputType.phone,
                  //         ),
                  //       ),
                  //     ), SizedBox(width: 30,),
                  //     Expanded(
                  //       child: Container(
                  //         width: 150,
                  //         child: TextFormNumberGlobal(
                  //           onsave: (value){
                  //             medicalHistoryRequest.weight = value;
                  //           },
                  //
                  //           text: 'Your Weight /Kg',
                  //           obscure: false,
                  //           textInputType: TextInputType.phone,
                  //         ),
                  //       ),
                  //     ),
                  //   ],
                  // ),






                  const SizedBox(height: 40),
                  ButtonGlobal(
                    isLoading:isLoading ,
                    ontap:(){
                      setState(() {
                        isLoading = true;
                      });
                      _updatemedicals();
                    } ,
                    text: 'Next',
                    color: GlobalColors.primaryColor,
                    fontsize: 16,
                  ),
                  const SizedBox(height: 60),

                ],
              ),
            ),
          ),
        ),
      ),

    );
  }


  _updatemedicals() async {
    try {

      setState(() {
        isLoading = false;
      });

      _formkey.currentState!.save();

      // medicalHistoryRequest.fullname = nameController.text.trim();
      // medicalHistoryRequest.email = emailController.text.trim();
      // medicalHistoryRequest.phone = mobileController.text.trim();
      // medicalHistoryRequest.password = passwordController.text.trim();
      // medicalHistoryRequest.referral_code = referralController.text.trim();
      //
      // signupRequest.category_id = 1;
      // signupRequest.gender = "Male";
      // signupRequest.user_type = "USER";
      // signupRequest.StreetAddress = "00";
      // signupRequest.state = "lagos";
      // signupRequest.city = "Lagos";
      // signupRequest.DateOfBirth = "24-12-1990";





      //
      if (medicalHistoryRequest.nextOfKinEmail!.isEmpty) {
        showSnack( snackBarMessage: txt_please_enter_your_name);
        return;
      }
      //else if (emailController.text.isEmpty) {
      //   showSnack( snackBarMessage: txt_please_enter_your_email);
      //   return;
      // }
      else if (medicalHistoryRequest.nextOfKinEmail!.isNotEmpty && !EmailValidator.validate(medicalHistoryRequest.nextOfKinEmail!)) {
        showSnack( snackBarMessage: txt_please_enter_your_valid_email);
        return;
      }
      // else if (mobileController.text.isEmpty || (mobileController.text.isNotEmpty && mobileController.text.trim().length < 10)) {
      //   showSnack( snackBarMessage: txt_please_enter_valid_mobile_number);
      //   return;
      // } else if (passwordController.text.isEmpty) {
      //   showSnack( snackBarMessage: txt_please_enter_your_password);
      //   return;
      // } else if (passwordController.text.isNotEmpty && passwordController.text.trim().length < 6) {
      //   showSnack( snackBarMessage: txt_password_should_be_of_minimum_8_character);
      //   return;
      // }


      bool isConnected = await br!.checkConnectivity();
      if (isConnected) {

        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) =>
              MedicalHistoryForm2Screen(medicalHistoryRequest:medicalHistoryRequest)),);

      } else {
        showNetworkErrorSnackBar(_scaffoldkey);
      }



    } catch (e) {
      print("Exception - signUpScreen.dart - _signUp():" + e.toString());
    }
  }

}


