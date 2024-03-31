import 'package:flutter/material.dart';

var theme = ThemeData(
  useMaterial3: true,
  textTheme: const TextTheme(
    bodySmall: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w600,
    ),
    bodyMedium: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w600,
    ),
    bodyLarge: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
    ),
    titleLarge: TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.w700,
    ),
    titleMedium: TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.w500,
    ),
    titleSmall: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w500,
    ),
  ),
  colorScheme: ColorScheme.fromSeed(
    seedColor: const Color(0xffF3F3F3),
    primary: const Color(0xffBA75FE),
    onPrimary: const Color(0xffF3F3F3),
    secondary: const Color(0xffF3F3F3),
  ),
);
