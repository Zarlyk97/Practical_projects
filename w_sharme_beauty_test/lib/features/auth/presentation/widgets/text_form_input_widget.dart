import 'package:flutter/material.dart';

import 'package:w_sharme_beauty_test/config/theme/theme.dart';

class TextFormInputWidget extends StatelessWidget {
  final String labelText;
  final Widget? suffixIcon;
  final bool obscureText;

  const TextFormInputWidget({
    super.key,
    required this.labelText,
    this.suffixIcon,
    required this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        suffixIconColor: theme.colorScheme.primary,
        labelText: labelText,
        filled: true,
        fillColor: const Color(0xffF3F3F3),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
