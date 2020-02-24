import 'package:flutter/material.dart';
import 'package:azkar/Helps/Container.dart';
class PContainer extends StatelessWidget{

  PContainer({this.title,this.text,this.child});

  Text title,text;
  Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(30.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
        color: color1,
      ),
      padding: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          title,
          SizedBox(height: 20.0,),
          text,
          child,
        ],
      ),
    );
  }
}