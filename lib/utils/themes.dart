import 'package:flutter/material.dart';

final appTheme = ThemeData(
  checkboxTheme: CheckboxThemeData(
    fillColor: MaterialStateProperty.resolveWith(
      (states) => states.contains(MaterialState.selected)
          ? const Color(0xFF10B981)
          : null,
    ),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
    side: const BorderSide(
      width: 3,
      color: Color(0xFFA7F3D0),
    ),
    splashRadius: 0,
  ),
  textTheme: const TextTheme(
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
    side: MaterialStateProperty.all(const BorderSide()),
    backgroundColor: MaterialStateProperty.resolveWith<Color?>(
      (states) {
        if (states.contains(MaterialState.hovered)) return Colors.black;
        return Colors.white;
      },
    ),
    padding: MaterialStateProperty.all(
        const EdgeInsets.symmetric(horizontal: 100, vertical: 25)),
    foregroundColor: MaterialStateProperty.resolveWith<Color?>(
      (states) {
        if (states.contains(MaterialState.hovered)) return Colors.white;
        return Colors.black;
      },
    ),
    textStyle: MaterialStateProperty.all<TextStyle?>(const TextStyle(
      fontSize: 25,
      fontWeight: FontWeight.bold,
    )),
  )),
);
