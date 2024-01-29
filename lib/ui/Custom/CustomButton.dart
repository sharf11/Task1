import 'package:flutter/material.dart';
import 'package:saulight/utils/AppTheme.dart';

class CustomButton extends StatelessWidget {
 Color btnColor;
 Color txtColor;
 String txt;
 final VoidCallback action;
 CustomButton({this.btnColor:const Color(0xff03A582),this.txtColor:Colors.white,required this.txt,required this.action});
  @override
  Widget build(BuildContext context) {
    var w=MediaQuery.of(context).size.width;
    var h =MediaQuery.of(context).size.height;
    return   GestureDetector(
      onTap: action,
      child: Container(
        width: w*.9,
        height: h*.065,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10000),
            color: this.btnColor
        ),
        alignment: Alignment.center,
        child: Text(this.txt,style: TextStyle(fontSize: 15,color: this.txtColor),),
      ),
    );
  }
}
