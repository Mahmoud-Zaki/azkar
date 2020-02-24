import 'package:flutter/material.dart';
import 'package:azkar/Helps/AppBar.dart';
import 'package:azkar/Helps/Container.dart';

class Slide7 extends StatefulWidget{

  @override
  _Slide7 createState() => _Slide7();
}

class _Slide7 extends State<Slide7>{

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: myAppBar(text: 'أذكار الاستيقاظ'),
      body: ListView(
        padding: EdgeInsets.all(15.0),
        children: <Widget>[
          mycontainer(
            text1: 'الحَمْـدُ لِلّهِ الّذي أَحْـيانا بَعْـدَ ما أَماتَـنا وَإليه النُّـشور. ',
            num: 1,
          ),
          Padding(padding: EdgeInsets.all(20.0)),
          mycontainer(
            text1: 'الحمدُ للهِ الذي عافاني في جَسَدي وَرَدّ عَليّ روحي وَأَذِنَ لي بِذِكْرِه. ',
            num: 1,
          ),
          Padding(padding: EdgeInsets.all(20.0)),
          mycontainer(
            text1: 'لا إلهَ إلاّ اللّهُ وَحْـدَهُ لا شَـريكَ له، لهُ المُلـكُ ولهُ الحَمـد، وهوَ على كلّ شيءٍ قدير، سُـبْحانَ اللهِ، والحمْـدُ لله ، ولا إلهَ إلاّ اللهُ واللهُ أكبَر، وَلا حَولَ وَلا قوّة إلاّ باللّهِ العليّ العظيم. رَبِّ اغْفرْ لي. ',
            num: 1,
          ),
          Padding(padding: EdgeInsets.all(20.0)),
        ],
      ),
    );
  }
}