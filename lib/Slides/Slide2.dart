import 'package:flutter/material.dart';
import 'package:azkar/Helps/BottomBar.dart';
import 'package:azkar/Helps/Container.dart';
import 'package:azkar/Helps/AppBar.dart';

class Slide2 extends StatefulWidget{


  @override
  _Slide2 createState() => _Slide2();
}

class _Slide2 extends State<Slide2>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(text: 'الأذكار'),
      body: ListView(
        padding: EdgeInsets.all(50.0),
        children: <Widget>[
          new RaisedButton(onPressed: ()=>Navigator.of(context).pushNamed('Slide3'),child: Text("أذكار الصباح",
            style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.0),),
            color: color1,
            padding: EdgeInsets.all(30.0),),
          new Padding(padding: EdgeInsets.all(30)),
          new RaisedButton(onPressed: ()=>Navigator.of(context).pushNamed('Slide4'),child: Text("أذكار المساء",
            style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.0),),
            color: color1,
            padding: EdgeInsets.all(30.0),),
          new Padding(padding: EdgeInsets.all(30)),
          new RaisedButton(onPressed: ()=>Navigator.of(context).pushNamed('Slide5'),child: Text("أذكار المسجد",
            style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.0),),
            color: color1,
            padding: EdgeInsets.all(30.0),),
          new Padding(padding: EdgeInsets.all(30)),
          new RaisedButton(onPressed: ()=>Navigator.of(context).pushNamed('Slide6'),child: Text("أذكار بعد الصلاة",
            style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.0),),
            color: color1,
            padding: EdgeInsets.all(30.0),),
          new Padding(padding: EdgeInsets.all(30)),
          new RaisedButton(onPressed: ()=>Navigator.of(context).pushNamed('Slide7'),child: Text("أذكار الاستيقاظ",
            style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.0),),
            color: color1,
            padding: EdgeInsets.all(30.0),),
          new Padding(padding: EdgeInsets.all(30)),
          new RaisedButton(onPressed: ()=>Navigator.of(context).pushNamed('Slide8'),child: Text("أذكار النوم",
            style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.0),),
            color: color1,
            padding: EdgeInsets.all(30.0),),
        ],
      ),
      bottomNavigationBar: Bar(2),
    );
  }
}