import 'package:flutter/material.dart';
class MydrawerUI extends StatefulWidget {
  @override
  _MydrawerUIState createState() => _MydrawerUIState();
}

class _MydrawerUIState extends State<MydrawerUI> {
  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.green,width: 300.0,height: MediaQuery.of(context).size.height,child: Center(child: Text('My draere'),),);
  }
}
