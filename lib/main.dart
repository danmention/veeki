import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:veeki/utils/foreground_notification.dart';

import 'package:veeki/utils/global.colors.dart';
import 'package:veeki/utils/route.dart';
import 'package:veeki/widgets/SplashScreen.dart';
import 'HomePage.dart';
import 'LoginScreen.dart';
import 'Notifications.dart';
import 'Profile.dart';
import 'firebase_options.dart';





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
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform, );
  FirebaseMessaging.onMessage.listen(_firebaseForegroundHandler);









  final fcmtoken = await FirebaseMessaging.instance.getToken();
  print("Firebasetoken $fcmtoken");
  final appDocumentDirectory = await getApplicationDocumentsDirectory();
  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );
  Hive.init(appDocumentDirectory.path);
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Veeeki',
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
    requestPermission();
    // TODO: implement initState
    super.initState();
    setupInterractedMessage();
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

  void _handleMessageOpen(RemoteMessage message) {
        if(message.data['type']=="booking"){

          // showDialog(
          //     context: context,
          //     builder: (_) {
          //       return AlertDialog(
          //         title: Text("kool"),
          //         content: SingleChildScrollView(
          //           child: Column(
          //             crossAxisAlignment: CrossAxisAlignment.start,
          //             children: [Text("lovely ")],
          //           ),
          //         ),
          //       );
          //     });



        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => Notifications())
        );


        }else{

          Navigator.pushNamed(context, 'resetpassword');
        }
  }


  void _handleMessageopenTerminated(RemoteMessage message) {
      print('message from app is terminated');
      _handleMessageOpen(message);
  }

  void requestPermission() async{

    FirebaseMessaging messaging = FirebaseMessaging.instance;

    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('User granted permission');
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      print('User granted provisional permission');
    } else {
      print('User declined or has not accepted permission');
    }
  }
}
