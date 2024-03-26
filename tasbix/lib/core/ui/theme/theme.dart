import 'package:flutter/material.dart';

const _primaryColor = Color(0xFF0A0E21);

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
      elevation: 1,
      color: Colors.white,
    ),
    primaryColor: _primaryColor,
    textTheme: _textTheme,
    useMaterial3: true,
    scaffoldBackgroundColor: const Color(0xFFFFFFFF),
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
