
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:veeki/utils/foreground_notification.dart';

import 'package:veeki/utils/global.colors.dart';
import 'package:veeki/utils/route.dart';
import 'package:veeki/widgets/SplashScreen.dart';
import 'package:veeki/widgets/notificationDialog.dart';
import 'AcceptRejectScreen.dart';
import 'HomePage.dart';
import 'LoginScreen.dart';
import 'Notifications.dart';
import 'Profile.dart';
import 'firebase_options.dart';
import 'models/businessLayer/global.dart';
import 'models/response/service_response.dart';


FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
FlutterLocalNotificationsPlugin();

const AndroidNotificationChannel channel = AndroidNotificationChannel(
  'high_importance_channel', // id
  'High Importance Notifications', // title/ description
    description:
    'This channel is used for important notifications.', // description
    importance: Importance.high,
    playSound: true
);

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp();

  print("Handling a background message: ${message.messageId}");


}


Future<void> _firebaseForegroundHandler(RemoteMessage message)async{


    print('Got a message whilst in the foreground!');
    print('Message data: ${message.data}');

    if (message.notification != null) {
      print('Message also contained a notification: ${message.notification}');


    }

}




void main() async{
  WidgetsFlutterBinding.ensureInitialized();


  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform, );

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
      AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);

  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );



  FirebaseMessaging.onMessage.listen(_firebaseForegroundHandler);










  final fcmtoken = await FirebaseMessaging.instance.getToken();
  print("Firebasetoken $fcmtoken");
  final appDocumentDirectory = await getApplicationDocumentsDirectory();

  Hive.init(appDocumentDirectory.path);
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Veeki',
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RouteGenerator.generateRoute,

      home: Navigator(
        onGenerateRoute: (settings) {
          return MaterialPageRoute(
            builder: (context) => MyHomePage(),
          );
        },
      ),
    );
  }
}




class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // This widget is the root of your application.
  FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
Service service = new Service();
  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.transparent),
    );
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      onGenerateRoute: RouteGenerator.generateRoute,
      title: 'Veeki',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        primaryColor: GlobalColors.primaryColor,
        fontFamily: 'Lato'

      ),
      home:OnBoardingPage(),
     // home:LoginScreen(),

    );
  }


  @override
  void initState() {
   // requestPermission();

    initializeNotifications();
    createNotificationChannel();
    configureFirebaseMessaging();
    // TODO: implement initState
    super.initState();
    setupInterractedMessage();
  }



  void initializeNotifications() {
    var initializationSettingsAndroid =
    AndroidInitializationSettings('@mipmap/ic_launcher');

    var initializationSettings =
    InitializationSettings(android: initializationSettingsAndroid);

    flutterLocalNotificationsPlugin.initialize(initializationSettings);

    flutterLocalNotificationsPlugin.initialize(initializationSettings,
        );
  }

  void createNotificationChannel() {
    var androidPlatformChannelSpecifics = AndroidNotificationChannel(
      'high_priority_channel',
      'High Priority Notifications',
      description: 'This channel is used for high priority notifications',
      importance: Importance.high,
    );

    flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(androidPlatformChannelSpecifics);
  }

  void configureFirebaseMessaging() {
  //  messaging.subscribeToTopic('type');

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      showNotification(message);
    });



  }

  void showNotification(RemoteMessage message) async {
    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
      'high_priority_channel',
      'High Priority Notifications',
      channelDescription: 'This channel is used for high priority notifications',
      importance: Importance.high,
      priority: Priority.high,
      enableVibration: true, // Optional: Vibrate the device when the notification is shown
      // Optional: Override channel importance

    );

    var platformChannelSpecifics =
    NotificationDetails(android: androidPlatformChannelSpecifics);

    await flutterLocalNotificationsPlugin.show(
      0, // Notification ID
      message.notification?.title ?? '',
      message.notification?.body ?? '',
      platformChannelSpecifics,
    );


    if(message.notification != null){
       // assetsAudioPlayer.open(Audio("assets/alert.mp3"));
       // assetsAudioPlayer.play();
          if(message.notification!.title!.contains("accepted")){
            Navigator.push(context, MaterialPageRoute(
                builder: (context) => AcceptRejectScreen(status: 1)));
          }else{
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (BuildContext context) => NotificationDialog(title:   message.notification?.title ,body:message.notification?.body,  userToken: message.data['usertoken'], ),
            );


          }

            // Navigator.of(context).push(
            //     MaterialPageRoute(builder: (context) => Notifications())
            // );
    }


    if(message.data['type']=="booking"){
      print("new guy in the block  boss");


      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) => NotificationDialog(title: message.notification?.title ,body:message.notification?.body, userToken: message.data['usertoken'], ),
      );

      // Navigator.of(context).push(
      //     MaterialPageRoute(builder: (context) => Notifications())
      // );


    }else if(message.data['type']=="user"){
      Navigator.push(context, MaterialPageRoute(
          builder: (context) => AcceptRejectScreen(status: 1)));
    }
  }














  Future<void>setupInterractedMessage()async{

    NotificationHandler.configureFirebaseMessaging(context);
    RemoteMessage? initialMessage = await FirebaseMessaging.instance.getInitialMessage();

    if(initialMessage !=null){
      _handleMessageopenTerminated(initialMessage);
    }
    FirebaseMessaging.onMessageOpenedApp.listen(_handleMessageOpenBackground);
  }


  void _handleMessageOpenBackground(RemoteMessage message) {
    print('message from app is that was in the background');

    _handleMessageOpen(message);
  }
  //
  void _handleMessageOpen(RemoteMessage message) {
        if(message.data['type']=="booking"){
print("og  boss${message.data['body']}");


            // assetsAudioPlayer.open(Audio("assets/alert.mp3"));
            // //  assetsAudioPlayer.setVolume(0.9);
            //  assetsAudioPlayer.play();
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (BuildContext context) => NotificationDialog(body: message.data['body'],title:message.data['title'] ,),
            );

        // Navigator.of(context).push(
        //     MaterialPageRoute(builder: (context) => Notifications())
        // );


        }else if(message.data['type']=="user"){
          Navigator.push(context, MaterialPageRoute(
              builder: (context) => AcceptRejectScreen(status: 1)));

        }
  }
  //
  //
  void _handleMessageopenTerminated(RemoteMessage message) {
      print('message from app is terminated');
      _handleMessageOpen(message);
  }

  // void requestPermission() async{
  //
  //   FirebaseMessaging messaging = FirebaseMessaging.instance;
  //
  //   NotificationSettings settings = await messaging.requestPermission(
  //     alert: true,
  //     announcement: false,
  //     badge: true,
  //     carPlay: false,
  //     criticalAlert: false,
  //     provisional: false,
  //     sound: true,
  //   );
  //
  //   if (settings.authorizationStatus == AuthorizationStatus.authorized) {
  //     print('User granted permission');
  //   } else if (settings.authorizationStatus ==
  //       AuthorizationStatus.provisional) {
  //     print('User granted provisional permission');
  //   } else {
  //     print('User declined or has not accepted permission');
  //   }
  // }
}
