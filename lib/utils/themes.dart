import 'package:flutter/material.dart';

final appTheme = ThemeData(
  checkboxTheme: CheckboxThemeData(
    fillColor: MaterialStateProperty.resolveWith(
      (states) => states.contains(MaterialState.selected)
          ? const Color(0xFF10B981)
          : null,
    ),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
    side: BorderSide(
      width: 3,
      color: const Color(0xFFA7F3D0),
    ),
    splashRadius: 0,
  ),
  textTheme: TextTheme(
    headline1: TextStyle(
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    headline2: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
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
