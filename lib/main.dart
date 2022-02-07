import 'package:fl02_lite/screens/ex0/ex0.dart';
import 'package:fl02_lite/screens/ex1/ex1.dart';
import 'package:flutter/material.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: ClockTimer(),
      // home: ex0(),
    );
  }
}
