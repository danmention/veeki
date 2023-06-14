import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import '../Notifications.dart';

class NotificationHandler {
  static void configureFirebaseMessaging(BuildContext context) {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {


      if (message.notification != null) {
        final notification = message.notification!;


        showDialog(
            context: context,
            builder: (_) {
              return AlertDialog(
                title: Text("kool"),
                content: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [Text("lovely ")],
                  ),
                ),
              );
            });
        // Navigator.of(context).push(
        //     MaterialPageRoute(builder: (context) => Notifications())
        // );
      }
    });
  }
}