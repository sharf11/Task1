import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Config/LocalStorage.dart';
import '../main.dart';
import '../utils/AppTheme.dart';

class Splash extends StatefulWidget {
  @override
  _Splash1State createState() => _Splash1State();
}

class _Splash1State extends State<Splash> {
  var email;
  is_Login()async{
    email=await LocalStorage.getData("email");
    setState(() {
    });


  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
     is_Login();
  }
  @override
  Widget build(BuildContext context) {
    var w= MediaQuery.of(context).size.width;
    var h= MediaQuery.of(context).size.height;
    Timer(Duration(seconds: 3), (){
      Navigator.of(context)
          .pushNamedAndRemoveUntil(email==null?"/login":"/mainPage",
              (Route<dynamic> route) => false);
      // Phoenix.rebirth(context);
    });
    return Scaffold(
        body: Center(
          child: Image.asset("assets/images/Logo.jpg",width: MediaQuery.of(context).size.width*.92,),
        )
    );
  }
}
