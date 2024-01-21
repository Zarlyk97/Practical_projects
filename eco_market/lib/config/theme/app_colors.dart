import 'package:flutter/material.dart';

class AppColors {
  static const red = Color(0xFFD70015);
  static const line = Color.fromARGB(208, 164, 209, 215);
  static const black = Color.fromRGBO(0, 0, 0, 1);
  static const grey = Color(0xffD2D1D5);
  static const green = Color(0xff75DB1B);
  static const white = Colors.white;
  static const MaterialColor primary =
      MaterialColor(_primaryPrimaryValue, <int, Color>{
    50: Color(0xFFE5EDF0),
    100: Color(0xFFBDD1D9),
    200: Color(0xFF91B3C0),
    300: Color(0xFF6594A7),
    400: Color(0xFF447D94),
    500: Color(_primaryPrimaryValue),
    600: Color(0xFF1F5E79),
    700: Color(0xFF1A536E),
    800: Color(0xFF154964),
    900: Color(0xFF0C3851),
  });
  static const int _primaryPrimaryValue = 0xFF236681;

  static const MaterialColor primaryAccent =
      MaterialColor(_primaryAccentValue, <int, Color>{
    100: Color(0xFF87CEFF),
    200: Color(_primaryAccentValue),
    400: Color(0xFF21A4FF),
    700: Color(0xFF089AFF),
  });
  static const int _primaryAccentValue = 0xFF54B9FF;
}
