import 'package:flutter/cupertino.dart';
import 'package:untitled/ui/mainPages/MainPage.dart';
import '../ui/Auth/Login.dart';
import '../ui/Splash.dart';


class Routes{
  static Map <String,WidgetBuilder> routes={
  '/splah':(BuildContext context)=>new Splash(),
    '/login':(BuildContext context)=>new Login(),
    '/mainPage':(BuildContext context)=>new MainPage(),

  };
}