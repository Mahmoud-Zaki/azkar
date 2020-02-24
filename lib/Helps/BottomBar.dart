import 'package:flutter/material.dart';

class Bar extends StatefulWidget{
  int currenttab;
  Bar(this.currenttab);
  @override
  Bar1 createState()=>Bar1(this.currenttab);
}
class Bar1 extends State<Bar>{

  int currenttab;
  Bar1(this.currenttab);
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: [
        new BottomNavigationBarItem(
          icon: Tab(icon: Icon(Icons.settings),),
          title: Text('الإعدادات'),
          activeIcon: Icon(Icons.settings),
        ),
        new BottomNavigationBarItem(
          icon: Tab(icon: Icon(Icons.wb_incandescent),),
          title: Text('أذكاري'),
          activeIcon: Icon(Icons.wb_incandescent),
        ),
        new BottomNavigationBarItem(
          icon: Tab(icon: Icon(Icons.brightness_2),),
          title: Text('الأذكار'),
          activeIcon: Icon(Icons.brightness_2),
        ),
        new BottomNavigationBarItem(
          icon: Tab(icon: Icon(Icons.home),),
          title: Text('الرئيسية'),
          activeIcon: Icon(Icons.home),
        ),
      ],
      fixedColor: Colors.teal,
      type: BottomNavigationBarType.fixed,
      currentIndex: currenttab,
      onTap: (int index){
        setState(() {
          currenttab=index;
        });
        switch (currenttab) {
          case 0:
            Navigator.of(context).pushNamedAndRemoveUntil('Slide10', (Route<dynamic> route) => false,);
            break;
          case 1:
            Navigator.of(context).pushNamedAndRemoveUntil('Slide9', (Route<dynamic> route)=>false,);
            break;
          case 2:
            Navigator.of(context).pushNamedAndRemoveUntil('Slide2', (Route<dynamic> route) => false,);
            break;
          case 3:
            Navigator.of(context).pushNamedAndRemoveUntil('Slide1', (Route<dynamic> route) => false,);
            break;
        }
      },
    );
  }
}