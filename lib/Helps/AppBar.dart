import 'package:flutter/material.dart';
import 'package:azkar/Helps/Container.dart';

AppBar myAppBar({String text}){
  return AppBar(
    backgroundColor: color1,
    centerTitle: true,
    title: Text(text,
      textDirection: TextDirection.rtl,
      style: TextStyle(
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}