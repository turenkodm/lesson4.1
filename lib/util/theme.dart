import 'package:flutter/material.dart';

ThemeData darkTheme() => ThemeData(
    primaryColor: Colors.white,
    disabledColor: Colors.white,
    toggleableActiveColor: Colors.lightGreenAccent,
    dividerColor: Colors.white54,
    colorScheme: ColorScheme.fromSwatch(
      brightness: Brightness.dark,
      cardColor: Colors.black,
    ),
    textTheme: const TextTheme(
      headline1: TextStyle(fontSize: 30.0, fontWeight: FontWeight.w600, color: Colors.white),
      headline2: TextStyle(fontSize: 17.0, fontWeight: FontWeight.w600, color: Colors.white),
      headline3: TextStyle(fontSize: 19.0, fontWeight: FontWeight.w400, color: Colors.white),
      bodyText1: TextStyle(fontSize: 40),
      bodyText2: TextStyle( fontSize: 16, fontWeight: FontWeight.w500),
      button: TextStyle(fontSize: 20),
    ));

ThemeData lightTheme() => ThemeData(
    primaryColor: Colors.blue,
    disabledColor: Colors.black54,
    toggleableActiveColor: Colors.lightGreen,
    dividerColor: Colors.blue,
    colorScheme: ColorScheme.fromSwatch(
      brightness: Brightness.light,
      primarySwatch: Colors.blue,
      cardColor: Colors.white,
    ),
    textTheme: const TextTheme(
      headline1: TextStyle(fontSize: 30.0, fontWeight: FontWeight.w600, color: Colors.black),
      headline2: TextStyle(fontSize: 17.0, fontWeight: FontWeight.w600, color: Colors.black),
      headline3: TextStyle(fontSize: 19.0, fontWeight: FontWeight.w400, color: Colors.black),
      bodyText1: TextStyle(fontSize: 40),
      bodyText2: TextStyle( fontSize: 16, fontWeight: FontWeight.w500),
      button: TextStyle(fontSize: 20),
    ));