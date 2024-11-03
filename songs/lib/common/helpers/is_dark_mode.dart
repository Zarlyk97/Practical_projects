import 'package:flutter/material.dart';

extension IsdarlkMode on BuildContext {
  bool get isDarkMode => Theme.of(this).brightness == Brightness.dark;
}
