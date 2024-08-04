import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  fontFamily: 'Cairo',
  brightness: Brightness.dark,
);

ThemeData darkTheme = ThemeData(
    fontFamily: 'Cairo',
    scaffoldBackgroundColor: const Color(0xff141414),
    brightness: Brightness.dark,
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xff141414),
    ));
