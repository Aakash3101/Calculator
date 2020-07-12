import 'package:calculator/pages/calculator.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData(
        brightness: Brightness.dark,
        splashColor: Colors.greenAccent,
        accentColor: Colors.black,
        textTheme: TextTheme(
          headline1: TextStyle(color: Colors.green, fontSize: 50.0, fontWeight: FontWeight.w300),
          headline2: TextStyle(color: Colors.green, fontSize: 25.0, fontWeight: FontWeight.w400),
          headline3: TextStyle(color: Colors.black, fontSize: 22.0, fontWeight: FontWeight.w500),
        ),
        dividerColor: Colors.green
      ),
      debugShowCheckedModeBanner: false,
      home: Calculator()
    );
  }
}