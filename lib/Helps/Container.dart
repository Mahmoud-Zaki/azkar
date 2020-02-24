import 'package:flutter/material.dart';

const Color color1 = Colors.teal;
const Color color2 = Colors.tealAccent;

class mycontainer extends StatefulWidget{
  String text1;
  int num;
  mycontainer({this.text1,this.num});
  @override
  mycontainer1 createState()=>mycontainer1(this.text1,this.num);
}
class mycontainer1 extends State<mycontainer> {
  String text1;
  int num;

  mycontainer1(this.text1, this.num);

  calc(){
    setState(() {
      if(num>0)
        num--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: calc,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(topRight: Radius.circular(20.0),topLeft: Radius.circular(20.0)),
              color: color1,
            ),
            margin: EdgeInsets.only(left: 15.0,right: 15.0,top: 15.0),
            padding: EdgeInsets.all(15.0),
            child: Text(text1,textDirection: TextDirection.rtl,textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18.0),),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(bottomRight: Radius.circular(20.0),bottomLeft: Radius.circular(20.0)),
              color: color2,
            ),
            padding: EdgeInsets.all(15.0),
            margin: EdgeInsets.only(left: 15.0,right: 15.0),
            child: Text('التكرار $num',textAlign: TextAlign.center,textDirection: TextDirection.rtl,
              style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.0),),
          ),
        ],
      ),
    );
  }
}