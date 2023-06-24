import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../Notifications.dart';
import '../main.dart';

class NotificationHandler {
  static void configureFirebaseMessaging(BuildContext context) {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
print('hello KKhoilla kkkkk');
      // if (message != null ) {
      //   flutterLocalNotificationsPlugin.show(
      //
      //       NotificationDetails(
      //         android: AndroidNotificationDetails(
      //           channel.id,
      //           channel.name,
      //
      //           // other properties...
      //         ),
      //       ));
      // }



      // if (message.notification != null) {
      //   final notification = message.notification!;
      //
      //
      //   showDialog(
      //       context: context,
      //       builder: (_) {
      //         return AlertDialog(
      //           title: Text("kool"),
      //           content: SingleChildScrollView(
      //             child: Column(
      //               crossAxisAlignment: CrossAxisAlignment.start,
      //               children: [Text("lovely ")],
      //             ),
      //           ),
      //         );
      //       });
      //   // Navigator.of(context).push(
      //   //     MaterialPageRoute(builder: (context) => Notifications())
      //   // );
      // }
    });
  }
}