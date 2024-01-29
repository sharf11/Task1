import 'package:saulight/utils/AppTheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../config/GlobalFunction.dart';
import '../Search/Search.dart';
import '../mainPages/Notifications.dart';

class CustomAppBar extends StatelessWidget{
  final VoidCallback? back;
  CustomAppBar({this.back});
  @override
  Widget build(BuildContext context) {
    var h=MediaQuery.of(context).size.height;
    var w=MediaQuery.of(context).size.width;
   return       Container(
     width: w,
     padding: EdgeInsets.only(left: w*.05,right: w*.05,top: h*.055),
     child: Row(
       mainAxisAlignment: MainAxisAlignment.spaceBetween,
       children: [
         GestureDetector(
             onTap: (){
               Navigator.push(context, GlobalFunction.route(Notifications()));
             },child: Image.asset("assets/images/notifications.png",width: 18,)),
         GestureDetector(
           onTap: (){
             Navigator.push(context, GlobalFunction.routeBottom(Search()));
           },
           child: Container(
               width: w*.68,height: 40,
               decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(5),
                   border: Border.all(color: Colors.black12,width: 1),
                   color: Colors.white
               ),
               padding: EdgeInsets.only(left: w*.05,right: w*.05),
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   Row(
                     children: [
                       Icon(Icons.search,size: 18,color: Colors.black45,),
                       SizedBox(width: 7,),
                       Text("بحث")
                     ],
                   ),
                  // Image.asset("assets/images/filter.png",width: 20,color: Colors.black45)
                 ],
               )
           ),
         ),
         GestureDetector(
           onTap:back==null? (){
             Navigator.pop(context);
           }:back,
           child: ClipRRect(
               borderRadius: BorderRadius.circular(5),
               child: Container(
                   decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(5),
                       color: AppTheme.primaryColor
                   ),
                   padding: EdgeInsets.all(7),
                   child: Icon(Icons.arrow_forward_ios,size: 17,color: Colors.white,))
           ),
         )
       ],
     ),
   );
  }
}