import 'package:flutter/material.dart';
import 'package:azkar/Slides/Slide1.dart';
import 'package:azkar/Slides/Slide2.dart';
import 'package:azkar/Slides/Slide3.dart';
import 'package:azkar/Slides/Slide4.dart';
import 'package:azkar/Slides/Slide5.dart';
import 'package:azkar/Slides/Slide6.dart';
import 'package:azkar/Slides/Slide7.dart';
import 'package:azkar/Slides/Slide8.dart';
import 'package:azkar/Slides/Slide9.dart';
import 'package:azkar/Slides/Slide10.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';
import 'package:azkar/Helps/provider.dart';

void main() {
  SharedPreferences.getInstance().then((_preferences) {
    var darkModeOn = _preferences.getBool('darkMode') ?? false;
    runApp(
      ChangeNotifierProvider<ThemeNotifier>(
        builder: (_) => ThemeNotifier(darkModeOn ? lightTheme : darkTheme),
        child: MyApp(),
      ),
    );
  });
}
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: themeNotifier.getTheme(),
      home:Slide1(),
      routes: <String,WidgetBuilder>{
        'Slide1':(BuildContext context) => Slide1(),
        'Slide2':(BuildContext context) => Slide2(),
        'Slide3':(BuildContext context) => Slide3(),
        'Slide4':(BuildContext context) => Slide4(),
        'Slide5':(BuildContext context) => Slide5(),
        'Slide6':(BuildContext context) => Slide6(),
        'Slide7':(BuildContext context) => Slide7(),
        'Slide8':(BuildContext context) => Slide8(),
        'Slide9':(BuildContext context) => Slide9(),
        'Slide10':(BuildContext context) => Slide10(),
      },
    );
  }
}