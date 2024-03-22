import 'package:flutter/material.dart';

const primaryColor = Color(0xFFF82B10);

final darkTheme = ThemeData(
  primaryColor: primaryColor,
  scaffoldBackgroundColor: const Color(0xFF1D1D1D),
  textTheme: textTheme,
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    seedColor: primaryColor,
    brightness: Brightness.dark,
  ),
);

final lightTheme = ThemeData(
    primaryColor: primaryColor,
    textTheme: textTheme,
    useMaterial3: true,
    scaffoldBackgroundColor: const Color(0xFFEFF1F3),
    colorScheme: ColorScheme.fromSeed(
      seedColor: primaryColor,
      brightness: Brightness.light,
    ));

const textTheme = TextTheme(
  titleMedium: TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
  ),
  headlineLarge: TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.w600,
  ),
);
