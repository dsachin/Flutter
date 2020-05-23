import 'package:age_flutter/ageApp.dart';
import 'package:age_flutter/setting.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Age',
      initialRoute: "/",
      routes: {'/': (context) => AgeApp(), '/setting': (context) => Setting()},
    );
  }
}
