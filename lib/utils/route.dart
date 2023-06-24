import 'package:flutter/material.dart';
import 'package:veeki/Profile_Edit.dart';
import 'package:veeki/BookAppointment/ViewBookingScreen.dart';

import '../HomePage.dart';
import '../LoginScreen.dart';
import '../Profile.dart';
import '../ResetPasswordScreen.dart';



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