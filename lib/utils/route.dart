import 'package:flutter/material.dart';
import 'package:veeki/GetReferralScreen.dart';
import 'package:veeki/Profile_Edit.dart';
import 'package:veeki/BookAppointment/ViewBookingScreen.dart';
import 'package:veeki/admin/AddDisputesScreen.dart';
import 'package:veeki/admin/AddcategoryScreen.dart';
import 'package:veeki/admin/SetDiscountScreen.dart';
import 'package:veeki/admin/ViewBookingAdminScreen.dart';
import 'package:veeki/admin/ViewCareGiverList.dart';
import 'package:veeki/sendSOS.dart';

import '../AddMedicalHistoryForm1Screen.dart';
import '../AddServiceScreen.dart';
import '../HomePage.dart';
import '../LoginScreen.dart';
import '../Profile.dart';
import '../ResetPasswordScreen.dart';
import '../ServiceList.dart';
import '../ViewServiceDetailScreen.dart';
import '../admin/ViewCategoryScreen.dart';
import '../admin/ViewPaymentScreen.dart';
import '../widgets/ViewMyServiceScreen.dart';



class RouteGenerator{


  static Route<dynamic> generateRoute(RouteSettings settings)  {
    switch (settings.name) {
      case "home":
        return MaterialPageRoute(builder: (_) => HomePage());
      // case "home1":
      //   return MaterialPageRoute(builder: (_) => HomeScreen());
      case "login":
        return MaterialPageRoute(builder: (_) => LoginScreen());

      case "editprofile":
        return MaterialPageRoute(builder: (_) => EditProfile());

      case "profile":
        return MaterialPageRoute(builder: (_) => Profile());

      case "viewservice":
        return MaterialPageRoute(builder: (_) => ViewServiceScreen());

      case "addservice":
        return MaterialPageRoute(builder: (_) => AddServiceScreen());


      case "viewuser":
        return MaterialPageRoute(builder: (_) => ViewCareGiverList());

      case "medicalhistory":
        return MaterialPageRoute(builder: (_) => MedicalHistoryForm1Screen());

      case "viewallservice":
        return MaterialPageRoute(builder: (_) => ServiceList());
      case "viewdetailservice":
        return MaterialPageRoute(builder: (_) => ViewServiceDetailScreen());

      case "addcategory":
        return MaterialPageRoute(builder: (_) => AddCategoryScreen());

      case "viewcategory":
        return MaterialPageRoute(builder: (_) => ViewCategoryScreen());

      case "viewadminbooking":
        return MaterialPageRoute(builder: (_) => ViewBookingAdminScreen());

      case "viewpayment":
        return MaterialPageRoute(builder: (_) => ViewPaymentScreen());

      case "sendsos":
        return MaterialPageRoute(builder: (_) => sendSOS());
      case "setdiscount":
        return MaterialPageRoute(builder: (_) => SetDiscountScreen());

      case "getallreferral":
        return MaterialPageRoute(builder: (_) => GetReferralScreen());

      case "addDisputes":
        return MaterialPageRoute(builder: (_) => AddDisputesScreen());
      case "resetpassword":
        return MaterialPageRoute(builder: (_) => ResetPasswordScreen());
      case "viewbooking":
        return MaterialPageRoute(builder: (_) => ViewBookingScreen());
      default:
        return MaterialPageRoute(builder: (_) => LoginScreen());
    }
  }

  // Route<dynamic> _onGenerateRoute(RouteSettings settings) {
  //   switch (settings.name) {
  //     case "/":
  //       return MaterialPageRoute(builder: (BuildContext context) {
  //         return Home();
  //       });
  //     case "/login":
  //       return MaterialPageRoute(builder: (BuildContext context) {
  //         return Login();
  //       });
  //     case "/dashboard":
  //       return MaterialPageRoute(builder: (BuildContext context) {
  //         return Dashboard();
  //       });
  //     case "/single-order":
  //       return MaterialPageRoute(builder: (BuildContext context) {
  //         return SingleOrder();
  //       });
  //     default:
  //       return MaterialPageRoute(builder: (BuildContext context) {
  //         return Home();
  //       });
  //   }
  // }


}