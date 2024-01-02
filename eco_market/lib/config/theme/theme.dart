import 'package:flutter/material.dart';
import 'package:eco_market/config/config.dart';

ThemeData theme = ThemeData(
  // useMaterial3: true,
  primaryColor: AppColors.primary,
  primarySwatch: AppColors.primary,
  appBarTheme: const AppBarTheme(
    backgroundColor: AppColors.white,
    centerTitle: true,
    elevation: .2,
    iconTheme: IconThemeData(
      color: Colors.white,
    ),
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w500,
      fontSize: 17,
    ),
  ),
  scaffoldBackgroundColor: Colors.white,
  bottomSheetTheme: const BottomSheetThemeData(
    backgroundColor: Colors.transparent,
    shadowColor: Colors.transparent,
    showDragHandle: false,
  ),

  // TEXT THEMES
  textTheme: const TextTheme(
    bodySmall: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
    bodyMedium: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
    bodyLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
    displaySmall: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
    displayMedium: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
    displayLarge: TextStyle(fontSize: 26, fontWeight: FontWeight.w500),
  ),
);
