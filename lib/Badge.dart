import 'package:flutter/material.dart';

class Badge extends StatelessWidget {
   final Widget child;
   final Color color;
   final String value;

  const Badge({Key key, this.color, this.value, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(overflow: Overflow.visible,
      alignment: Alignment.center,
      children: [
        child,
        Positioned(bottom: 15.0,left: 15.0,
          child: Container(padding: EdgeInsets.only(left: 4.0,right: 4.0),
            child: Text(value,style: TextStyle(color: Colors.white),),
            decoration: BoxDecoration(border: Border.all(color: Colors.red,width: 1.0),
            color:Colors.red,
                borderRadius: BorderRadius.circular(20.0),),),
        )

      ],
    );
  }
}
