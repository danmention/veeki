import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:spa/BookAppointment/ChooseServiceScreen.dart';
import 'package:spa/Notifications.dart';
import 'package:spa/utils/global.colors.dart';
import 'HomePage.dart';
import 'LoginScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.transparent),
    );
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        primaryColor: GlobalColors.primaryColor,
      ),
      home:LoginScreen(),
    );
  }
}
