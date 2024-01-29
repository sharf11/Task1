import 'dart:convert';
import 'dart:io';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
//import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter/material.dart';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/provider/MainProvider.dart';
import 'package:untitled/ui/Splash.dart';
import 'package:untitled/utils/AppTheme.dart';
import 'Local/AppLanguage.dart';
import 'Local/DefaultData.dart';

import 'package:provider/provider.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'config/Routes.dart';
import 'package:firebase_core/firebase_core.dart' as f;


Future<void> main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await f.Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  static int type = 1;
  static String code = "";
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Locale local;
  final GlobalKey<NavigatorState> navKey = GlobalKey();
  var title = '';
  var body = {};
  var lang;
  @override
  void initState() {
    setState(() {
      //  appPushNotifications.notificationSetup(navKey);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MultiProvider(
        providers: [
          ChangeNotifierProvider.value(
            value: MainProvider(),
          ),
        ],
        child: MaterialApp(
          navigatorKey: navKey,
          routes: Routes.routes,
          debugShowCheckedModeBanner: false,
          home: App(),

        ));
  }
}
class App extends StatefulWidget {
  static String? name;
  static String? image;
  static String Id = "0";
  static String AppLang = "";
  static void setLocale(BuildContext context, Locale newLocale) {
    _MyAppState? state = context.findAncestorStateOfType();

    // ignore: invalid_use_of_protected_member
    state!.setState(() => state.local = newLocale);
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _AppState();
  }

// This widget is the root of your application.
}
class _AppState extends State<App> {
  final GlobalKey<NavigatorState> navKey = GlobalKey();
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  new FlutterLocalNotificationsPlugin();
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  var title = '';
  var body = "";
  void firebaseCloudMessaging_Listeners() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var android = new AndroidInitializationSettings('@mipmap/launcher_icon');
    var ios = new DarwinInitializationSettings();
    var platform = new InitializationSettings(android: android, iOS: ios);
    flutterLocalNotificationsPlugin.initialize(platform);
    if (Platform.isIOS) iOS_Permission();
    await messaging
        .getToken(
      vapidKey:
      "BBuN5gVHGkN7vetGa_5rywk_Iix5NZni22Srnqfyf3UaXjXLNHQAIavxZLxDY1Gt-zwqo-5U3bQeSHFqkswBJiI",
    )
        .then((token) {
      sharedPreferences.setString("fcmToken", token!);
      print(token);
    });
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('Got a message whilst in the foreground!');
      print(message.notification?.title);
      print("messageeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee");
      print('Message data: ${message.data.toString()}');
      showNotification(message);
      if (message.notification != null) {
        print('Message also contained a notification: ${message.notification}');
      }
    });
  }
  showNotification(RemoteMessage msg) async {
    print("enter show notification");
    var android = new AndroidNotificationDetails("1", "channelName",
        channelDescription: "channelDescription");
    var iOS = new DarwinNotificationDetails();
    var platform = new NotificationDetails(android: android, iOS: iOS);
    print(msg.data);
    print("---------------------------");
    title = msg.notification?.title ?? "";
    body = msg.notification?.body ?? "";
    setState(() {});
    print("title $title , body $body");

    await flutterLocalNotificationsPlugin.show(0, title, body, platform);
  }
  void iOS_Permission() async {
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
    print('User granted permission: ${settings.authorizationStatus}');
  }
  @override
  void initState(){
    firebaseCloudMessaging_Listeners();
    iOS_Permission();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: Routes.routes,
      theme: ThemeData(fontFamily: "Montserrat", primaryColor: AppTheme.primaryColor),
      home: Splash(),
    );
  }
}
