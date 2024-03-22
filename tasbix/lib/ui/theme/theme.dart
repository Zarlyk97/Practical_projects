import 'package:flutter/material.dart';

const primaryColor = Color(0xFFF82B10);
final themeData = ThemeData(
  dividerTheme: DividerThemeData(
    color: Colors.grey.withOpacity(0.1),
  ),
  primaryColor: primaryColor,
  scaffoldBackgroundColor: const Color(0xFFEFF1F3),
  colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
);
final darkTheme = ThemeData(
  textTheme: textTheme,
  useMaterial3: true,
);

final lightTheme = ThemeData(
  textTheme: textTheme,
  useMaterial3: true,
);

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
