import 'package:flutter/material.dart';
import 'package:todo_appwrite/landing/landing_screen.dart';
import 'package:todo_appwrite/utils/themes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: appTheme,
      home: LandingScreen(),
    );
  }
}
