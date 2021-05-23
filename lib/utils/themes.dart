import 'package:flutter/material.dart';

final appTheme = ThemeData(
  textTheme: TextTheme(
    headline1: TextStyle(
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    headline4: TextStyle(color: Colors.black),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
      style: ButtonStyle(
    backgroundColor: MaterialStateProperty.resolveWith<Color?>(
      (states) {
        if (states.contains(MaterialState.hovered)) return Colors.black;
        return Colors.white;
      },
    ),
    side: MaterialStateProperty.all(BorderSide(color: Colors.black)),
    padding: MaterialStateProperty.all(
        const EdgeInsets.symmetric(horizontal: 100, vertical: 25)),
    foregroundColor: MaterialStateProperty.resolveWith<Color?>(
      (states) {
        if (states.contains(MaterialState.hovered)) return Colors.white;
        return Colors.black;
      },
    ),
    textStyle: MaterialStateProperty.all<TextStyle?>(TextStyle(
      fontSize: 25,
      fontWeight: FontWeight.bold,
    )),
  )),
);
