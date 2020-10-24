import 'package:flutter/material.dart';
import 'package:task1/main.dart';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  void _onItemTapped(int index) {
    setState(() {
      _indexPage = index;
    });
  }
  int _indexPage=0;
  List<Widget>itemsUi=[
    Home(),
    Container(child: Center(child: Text('second Page'),),),
    Container(child: Center(child: Text('third Page'),),),
    Container(child: Center(child: Text('forth Page'),),),
   ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body:itemsUi.elementAt(_indexPage),

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xff4852c1),
        type: BottomNavigationBarType.fixed,
    showUnselectedLabels: true,
    unselectedItemColor: Colors.white,
        currentIndex: _indexPage,
        selectedItemColor: Colors.white,
        onTap: _onItemTapped,
    items: const <BottomNavigationBarItem>[
    BottomNavigationBarItem(
        icon: Icon(Icons.car_repair),
      label: 'التامين',
    ),
    BottomNavigationBarItem(
    icon: Icon(Icons.business),
    label: 'التثمين',
    ),
    BottomNavigationBarItem(
    icon: Icon(Icons.school),
    label: 'الخدمات',
    ),
    BottomNavigationBarItem(
        icon: Icon(Icons.school),
        label: 'الوكلات',
      ),


    ],

    ),
    ));
  }
  }

