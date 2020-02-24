import 'package:flutter/material.dart';
import 'package:azkar/Helps/AppBar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:azkar/Helps/BottomBar.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:azkar/Helps/provider.dart';
import 'package:provider/provider.dart';

class Slide10 extends StatefulWidget {
  @override
  _Slide10 createState() => _Slide10();
}

class _Slide10 extends State<Slide10> {

  bool darkModeEnabled;
  int notificationLevel;
  var times=[5,0,17,0];
  void changeNotificationLevel(int newLevel) async {
    SharedPreferences _preferences = await SharedPreferences.getInstance();
    setState(() {
      notificationLevel = newLevel;
      _preferences.setInt('notification_level', newLevel);
    });
  }

  void getSharedPreferences() async {
        SharedPreferences _preferences = await SharedPreferences.getInstance();
    setState(() {
      darkModeEnabled = _preferences.getBool('darkMode') ?? false;
      notificationLevel = _preferences.getInt('notification_level') ?? 0;
      times[0] = _preferences.getInt('hour1')??5;
      times[1] = _preferences.getInt('minute1')??0;
      times[2] = _preferences.getInt('hour2')??17;
      times[3] = _preferences.getInt('minute2')??0;
    });
  }

  @override
  void initState() {
    super.initState();
    getSharedPreferences();
  }
  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    return Scaffold(
      appBar: myAppBar(text: 'الإعدادات'),
      body: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20.0),
            color: Colors.grey,
            child: Text(
              'عام',
                textDirection: TextDirection.rtl,textAlign: TextAlign.right,style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
            child: Row(
              children: <Widget>[
                Switch(
                  value: darkModeEnabled,
                  onChanged: (bool newBool) async {
                    SharedPreferences _preferences = await SharedPreferences.getInstance();
                    setState(() {
                      darkModeEnabled=newBool;
                      _preferences.setBool('darkMode', newBool);
                      if(!newBool){
                        themeNotifier.setTheme(darkTheme);}
                      else{
                        themeNotifier.setTheme(lightTheme);}
                    });
                  },
                  inactiveThumbColor: Colors.white,
                  activeColor: Colors.black,
                ),
                Expanded(
                    child: Text('الوضع الليلي',
                      textDirection: TextDirection.rtl,
                      textAlign: TextAlign.right,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(20.0),
            color: Colors.grey,
            child: Text(
              'معدل الإشعارات',
              textDirection: TextDirection.rtl,textAlign: TextAlign.right,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
            child: Column(
              children: <Widget>[
                RadioListTile<int>(
                  value: 0,
                  groupValue: notificationLevel,
                  onChanged: changeNotificationLevel,
                  subtitle: Text('عالي',textDirection: TextDirection.rtl,textAlign: TextAlign.right,style: TextStyle(fontWeight: FontWeight.bold),),
                ),
                Divider(),
                RadioListTile<int>(
                  value: 1,
                  groupValue: notificationLevel,
                  onChanged: changeNotificationLevel,
                  subtitle: Text('متوسط',textDirection: TextDirection.rtl,textAlign: TextAlign.right,style: TextStyle(fontWeight: FontWeight.bold),),
                ),
                Divider(),
                RadioListTile<int>(
                  value: 2,
                  groupValue: notificationLevel,
                  onChanged: changeNotificationLevel,
                  subtitle: Text('منخفض',textDirection: TextDirection.rtl,textAlign: TextAlign.right,style: TextStyle(fontWeight: FontWeight.bold),),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(20.0),
            color: Colors.grey,
            child: Text(
              'أذكار الصباح والمساء',
              textDirection: TextDirection.rtl,textAlign: TextAlign.right,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
            child: Column(
              children: <Widget>[
                Text('أذكار الصباح',textDirection: TextDirection.rtl,textAlign: TextAlign.right,style: TextStyle(fontWeight: FontWeight.bold),),
                DateTimeField(
                  onShowPicker: (context, currentValue) async {
                    final time = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
                    );
                    SharedPreferences _preferences = await SharedPreferences.getInstance();
                    setState(() {
                      _preferences.setInt('hour1', time.hour);
                      _preferences.setInt('minute1', time.minute);
                      times[0] = _preferences.getInt('hour1')??5;
                      times[1] = _preferences.getInt('minute1')??0;
                    });
                  },
                  decoration: InputDecoration(
                    labelText: '  ${times[0]} : ${times[1]}',
                  ),
                ),
                Text('أذكار المساء',textDirection: TextDirection.rtl,textAlign: TextAlign.right,style: TextStyle(fontWeight: FontWeight.bold),),
                DateTimeField(
                  onShowPicker: (context, currentValue) async {
                    final time = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
                    );
                    SharedPreferences _preferences = await SharedPreferences.getInstance();
                    setState(() {
                      _preferences.setInt('hour2', time.hour);
                      _preferences.setInt('minute2', time.minute);
                      times[2] = _preferences.getInt('hour2')??17;
                      times[3] = _preferences.getInt('minute2')??0;
                    });
                  },
                  decoration: InputDecoration(
                    labelText: '  ${times[2]} : ${times[3]}',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Bar(0),
    );
  }
}