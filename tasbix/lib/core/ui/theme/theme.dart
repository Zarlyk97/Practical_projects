import 'package:flutter/material.dart';

const _primaryColor = Color(0xFFF82B10);

final darkTheme = ThemeData(
  appBarTheme: const AppBarTheme(color: Colors.black),
  primaryColor: _primaryColor,
  scaffoldBackgroundColor: const Color.fromARGB(255, 32, 30, 30),
  textTheme: _textTheme,
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    seedColor: _primaryColor,
    brightness: Brightness.dark,
  ),
);

final lightTheme = ThemeData(
    appBarTheme: const AppBarTheme(
      color: Colors.white,
    ),
    primaryColor: _primaryColor,
    textTheme: _textTheme,
    useMaterial3: true,
    scaffoldBackgroundColor: const Color(0xFFEFF1F3),
    colorScheme: ColorScheme.fromSeed(
      seedColor: _primaryColor,
      brightness: Brightness.light,
    ));

const _textTheme = TextTheme(
  titleMedium: TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
  ),
  headlineLarge: TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.w600,
  ),
);
