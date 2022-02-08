import 'package:flutter/material.dart';

class MainTheme {
  static ThemeData light = ThemeData(
      fontFamily: 'WorkSans',
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: 0.0,
          primary: Colors.red,
        ),
      ),
      appBarTheme: const AppBarTheme(
        foregroundColor: Colors.black,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      scaffoldBackgroundColor: const Color(0xffF5F7F9),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ));
}
