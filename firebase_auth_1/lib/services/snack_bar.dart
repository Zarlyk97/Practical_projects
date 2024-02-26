import 'package:flutter/material.dart';

class SnackbarService {
  static const errorColor = Colors.red;
  static const okColor = Colors.green;

  static Future<void> showSnackbar(
    BuildContext context,
    String massege,
    bool error,
  ) async {
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    final snackbar = SnackBar(
      content: Text(
        massege,
      ),
      backgroundColor: error ? errorColor : okColor,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }
}
