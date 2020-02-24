import 'package:flutter/material.dart';
import 'package:azkar/Helps/BottomBar.dart';
import 'package:azkar/Helps/Container.dart';
import 'package:azkar/Helps/MainContainer.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'dart:math';
import 'package:azkar/Helps/Lists&Maps.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Slide1 extends StatefulWidget{

  @override
  _Slide1 createState() => _Slide1();
}

class _Slide1 extends State<Slide1>{
  Random random = new Random();
  bool black;
  int count1,count2,count3;
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

  void get_shared_performance()async{
    SharedPreferences _preferences = await SharedPreferences.getInstance();
    setState(() {
      black=_preferences.getBool('darkMode') ?? false;
    });
  }
  void local_notification()async{
    flutterLocalNotificationsPlugin = new FlutterLocalNotificationsPlugin();
    var android = new AndroidInitializationSettings('@mipmap/ic_launcher');
    var ios = new IOSInitializationSettings();
    var initSettings = new InitializationSettings(android, ios);
    await flutterLocalNotificationsPlugin.initialize(
        initSettings);
  }
  @override
  void initState() {
    super.initState();
    get_shared_performance();
    local_notification();
    nnoti();
    count3=random.nextInt(31);
    for(int i=0;;i++){
      count1=random.nextInt(190);
      count2=random.nextInt(50);
      if(count1%2==0&&count2%2==0)
        break;
    }
  }

  nnoti()async{
    SharedPreferences _preferences = await SharedPreferences.getInstance();
    var am = new Time(_preferences.getInt('hour1')??5,_preferences.getInt('minute1')??0, 00);
    var pm = new Time(_preferences.getInt('hour2')??17,_preferences.getInt('minute2')??0, 00);
    var time = new Time(23,30, 00);
    var androidPlatformChannelSpecifics1 =
    AndroidNotificationDetails('repeating channel id',
        'repeating channel name', 'repeating description');
    var iOSPlatformChannelSpecifics =
    IOSNotificationDetails();
    var platformChannelSpecifics1 = NotificationDetails(
        androidPlatformChannelSpecifics1, iOSPlatformChannelSpecifics);
      if(_preferences.getInt('notification_level')==0){
      await flutterLocalNotificationsPlugin.periodicallyShow(
          0,
          '${list_N1[random.nextInt(10)]}',
          '',
          RepeatInterval.Hourly, platformChannelSpecifics1);
    }
    else if(_preferences.getInt('notification_level')==1){
        var androidPlatformChannelSpecifics2 =
        AndroidNotificationDetails('repeatDailyAtTime channel id',
            'repeatDailyAtTime channel name', 'repeatDailyAtTime description');
        var platformChannelSpecifics2 = NotificationDetails(
            androidPlatformChannelSpecifics2, iOSPlatformChannelSpecifics);
        await flutterLocalNotificationsPlugin.showDailyAtTime(
            0,
            '${list_N1[random.nextInt(10)]}',
            '',
            Time(16,0,0),
            platformChannelSpecifics2);
        await flutterLocalNotificationsPlugin.showDailyAtTime(
            5,
            '${list_N1[random.nextInt(10)]}',
            '',
            Time(21,0,0),
            platformChannelSpecifics2);
    }
    else if(_preferences.getInt('notification_level')==2){
      await flutterLocalNotificationsPlugin.periodicallyShow(
          0,
          '${list_N1[random.nextInt(10)]}',
          '',
          RepeatInterval.Daily, platformChannelSpecifics1);
    }
    var androidPlatformChannelSpecifics2 =
    AndroidNotificationDetails('repeatDailyAtTime channel id',
        'repeatDailyAtTime channel name', 'repeatDailyAtTime description');
    var platformChannelSpecifics2 = NotificationDetails(
        androidPlatformChannelSpecifics2, iOSPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.showDailyAtTime(
        1,
        'أذكار الصباح',
        'أبدأ يومك بذكر الله',
        am,
        platformChannelSpecifics2);
    await flutterLocalNotificationsPlugin.showDailyAtTime(
        2,
        'أذكار المساء',
        'تجلب لقلبك الفرح والسرور',
        pm,
        platformChannelSpecifics2);
    var androidPlatformChannelSpecifics3 =
    AndroidNotificationDetails('show weekly channel id',
        'show weekly channel name', 'show weekly description');
    var platformChannelSpecifics3 = NotificationDetails(
        androidPlatformChannelSpecifics3, iOSPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.showWeeklyAtDayAndTime(
        3,
        '${list_N2[random.nextInt(8)]}',
        'صيام الأثنين',
        Day.Sunday,
        time,
        platformChannelSpecifics3);
    await flutterLocalNotificationsPlugin.showWeeklyAtDayAndTime(
        4,
        '${list_N2[random.nextInt(8)]}',
        'صيام الخميس',
        Day.Wednesday,
        time,
        platformChannelSpecifics3);
  }
  Color mycolor;
  Text zekr=Text('الله\nأكبر',
    textDirection: TextDirection.rtl,
    textAlign: TextAlign.center,
    style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold
    ),
  );
  int m=0;
  double c=0.0;
  String resala='رسالتك';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(bottomRight: Radius.circular(10.0),bottomLeft: Radius.circular(10.0)),
                  color: color1,
                ),
                padding: EdgeInsets.only(left: 20.0,bottom: 70.0,right: 20.0,top: 0.0),
                child: Center(
                  child:Text('أذكار',
                    style: TextStyle(
                      fontFamily: 'ArefRuqaa',
                      fontSize: 100,
                      fontStyle: FontStyle.normal,
                    ),),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  color: Colors.white70
                ),child: Image.asset('Images/24998-black-white-800x500.png',fit: BoxFit.contain,),
                margin: EdgeInsets.fromLTRB(30.0, 160.0, 30.0, 0),
              ),
            ],
          ),
          SizedBox(height: 40.0,),
          RaisedButton(
            padding: EdgeInsets.all(20.0),
            color: color1,
            child: Text(resala,textDirection: TextDirection.rtl,style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 20.0,),),
            onPressed: (){
              setState(() {
                resala=list_R[random.nextInt(25)];
              });
            },
          ),
          SizedBox(height: 40.0,),
          PContainer(
            title: Text('أسماء الله الحسنى',textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 25.0,),),
            text: Text('${list_A[count1]}',textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 20.0,),),
            child:Text('${list_A[count1+1]}',textDirection: TextDirection.rtl,style: TextStyle(color: Colors.white,fontSize: 20.0,),),
          ),
          SizedBox(height: 40.0,),
          PContainer(
            title: Text('نسبُ النبيِّ صَلَّى الله عليه وسلم',textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 25.0,),),
            text: Text('محُمَّدٌ رَسُولُ اللهِ صَلَّى اللهُ عَلَيْهِ وَسَلَّمَ،',textAlign: TextAlign.center,textDirection: TextDirection.rtl,style: TextStyle(color: Colors.white,fontSize: 20.0,),),
            child: Text(' ابْنُ عَبْدِ اللهِ بْنِ عَبْدِ المُطَّلِبِ بْنِ هَاشِمِ بْنِ عَبْدِ مَنَافِ بْنِ قُصَيِّ بْنِ كِلَابِ بْنِ مُرَّةَ بْنِ كَعْبِ بْنِ لُؤَيِّ بْنِ غَالِبِ بْنِ فِهْرِ بْنِ مَالِكِ بْنِ النَّضْرِ بْنِ كِنَانَةَ بْنِ خُزَيْمَةَ بْنِ مُدْرِكَةَ بْنِ إِلْيَاسَ بْنِ مُضَرَ بْنِ نِزَارَ بْنِ مَعَدَّ بْنِ عَدْنَانَ.',textDirection: TextDirection.rtl,style: TextStyle(color: Colors.white,fontSize: 20.0,),),
          ),
          SizedBox(height: 40.0,),
          PContainer(
            title: Text('حلقة التسبيح',textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 25.0,),),
            text: Text(''),
            child: Row(
          children: <Widget>[
          Expanded(
            flex: 1,
            child: Column(
              children: <Widget>[
                SizedBox(height: 10.0,),
                Container(
                  padding: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(30.0)),
                    color: Colors.purple,
                  ),
                  child: Text('الله أكبر',style: TextStyle(color: Colors.white,fontSize: 20.0,),),
                ),
                SizedBox(height: 6.0,),
                Container(
                  padding: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(30.0)),
                    color: Colors.pinkAccent,
                  ),
                  child: Text('الحمد لله',style: TextStyle(color: Colors.white,fontSize: 20.0,),),
                ),
                SizedBox(height: 6.0,),
                Container(
                  padding: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(30.0)),
                    color: Colors.blue,
                  ),
                  child: Text('سبحان الله',style: TextStyle(color: Colors.white,fontSize: 20.0,),),
                ),
                SizedBox(height: 6.0,),
                Container(
                  padding: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(30.0)),
                    color: Colors.amber,
                  ),
                  child: Text('أستغفر الله',style: TextStyle(color: Colors.white,fontSize: 20.0,),),
                ),
                SizedBox(height: 10.0,),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: CircularPercentIndicator(
              backgroundColor: Colors.tealAccent,
              progressColor: mycolor,
              radius: 150.0,
              lineWidth: 20.0,
              animation: true,
              percent: c,
              center: FlatButton(
                padding: EdgeInsets.all(35.0),
                onPressed: (){
                  setState(() {
                    if(c>0.9){
                      c=0;
                      m++;
                      if(m==4)
                        m=0;
                    }
                    if(m==0){
                      mycolor=Colors.purple;
                      zekr=Text('الله\nأكبر',
                        textDirection: TextDirection.rtl,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                        ),
                      );
                    }
                    else if(m==1){
                      mycolor=Colors.pinkAccent;
                      zekr=Text('الحمد\nلله',
                        textDirection: TextDirection.rtl,
                        textAlign: TextAlign.center,
                          style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                      ),
                      );
                    }
                    else if(m==2){
                      mycolor=Colors.blue;
                      zekr=Text('سبحان\nالله',
                        textDirection: TextDirection.rtl,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                        ),
                      );
                    }
                    else if(m==3){
                      mycolor=Colors.amber;
                      zekr=Text('أستغفر\nالله',
                        textDirection: TextDirection.rtl,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                        ),
                      );
                    }
                    c+=0.1;
                  });
                },
                child: zekr,
                shape: CircleBorder(),
              ),
            ),
          ),
        ],
      ),
    ),
          SizedBox(height: 40.0,),
          PContainer(
            title: Text('السنن المهجورة',textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 25.0,),),
            text: Text('${list_S[count3]}',textDirection: TextDirection.rtl,style: TextStyle(color: Colors.white,fontSize: 20.0,),),
            child: Text(''),
          ),
          SizedBox(height: 40.0,),
          PContainer(
            title: Text('الطريق الى الجنة',textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 25.0,),),
            text: Text('${list_H2[count2]}',textDirection: TextDirection.rtl,style: TextStyle(color: Colors.white,fontSize: 20.0,),),
            child: IconButton(
              icon: Icon(Icons.arrow_drop_down_circle,size: 40.0,),
              color: Colors.white,
              onPressed: _neverSatisfied,
            ),
          ),
        ],
      ),
      bottomNavigationBar: Bar(3),
    );
  }
  Future<void> _neverSatisfied() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('${list_H2[count2]}',textAlign: TextAlign.center,
                  style: TextStyle(color: black ?Colors.black:Colors.white,fontSize: 25.0,),),
                Text('التفسير',textDirection: TextDirection.rtl,style: TextStyle(color: Colors.black,fontSize: 20.0,),),
                SizedBox(height: 10.0,),
                Text('${list_H2[count2+1]}',textDirection: TextDirection.rtl,
                  style: TextStyle(color: black?Colors.black:Colors.white,fontSize: 25.0,),),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('اغلاق',textDirection: TextDirection.rtl,style: TextStyle(color: Colors.teal,fontSize: 20.0,),),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

}
