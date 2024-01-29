import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/Config/LocalStorage.dart';
import '../../config/GlobalFunction.dart';
import '../../main.dart';
import '../../provider/MainProvider.dart';
import '../../utils/AppTheme.dart';


class MainPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
   return _state();
  }
}
class _state extends State<MainPage>{
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  bool loading=true;
  loadData()async{
    var mainProvider= Provider.of<MainProvider>(context, listen: false);
    await mainProvider.getUsers();
    print(mainProvider.users.length);
   print("*********************************************************************");
   setState(() {
     loading=false;
   });

  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }
  int ios_version=1;
  int android_version=1;
  @override
  Widget build(BuildContext context) {
    var mainProvider= Provider.of<MainProvider>(context, listen: true);
    var w=MediaQuery.of(context).size.width;
    var h=MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppTheme.BGColor,
        key: _scaffoldKey,
      body:Directionality(
        textDirection: TextDirection.rtl,
        child: Column(
          children: [
            SizedBox(height: h*.06,),
            Container(
              width: w,
              padding: EdgeInsets.only(left: w*.05,right: w*.05),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("اهلا بك",style: TextStyle(fontSize: 22,fontWeight: FontWeight.w600),),
                      GestureDetector(
                          onTap: (){
                            LocalStorage.removeData("email");
                            Navigator.pushNamedAndRemoveUntil(context, "/login", (route) => false);
                          },
                          child: Icon(Icons.logout,color: Colors.red,))
                    ],
                  ),
                  SizedBox(height: 3,),
                  Container(
                    width: w,height: 1,color: Colors.black12,
                  ),
                  SizedBox(height: 5,),
                ],
              ),
            ),
            Expanded(child:loading? Center(child: CircularProgressIndicator.adaptive(),):ListView.builder(
                padding: EdgeInsets.only(top: 10),
                itemCount: mainProvider.users.length,
                itemBuilder: (context,index){
              return Container(
                width: w,
                margin: EdgeInsets.only(
                    left: w*.05,right: w*.05,bottom: 10
                ),
                padding: EdgeInsets.only(      left: w*.03,right: w*.03),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black12,width: .5),
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 5,),
                   Row(
                     children: [
                       Text("الاسم : "),
                       Text(mainProvider.users[index].name)
                     ],
                   ),
                    SizedBox(height: 5,),
                    Row(
                      children: [
                        Text("الايميل : "),
                        Text(mainProvider.users[index].email)
                      ],
                    ),
                    SizedBox(height: 5,),
                    Row(
                      children: [
                        Text("الهاتف : "),
                        Text(mainProvider.users[index].phone)
                      ],
                    ),
                    SizedBox(height: 5,),
                  ],
                ),
              );
            }))
          ],
        ),
      )
    );
  }
}