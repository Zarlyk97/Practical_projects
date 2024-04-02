// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:w_sharme_beauty_test/config/theme/theme.dart';

class TextFormInputWidget extends StatelessWidget {
  final String labelText;
  final Widget? suffixIcon;
  final bool obscureText;
  final Widget? prefixIcon;

  const TextFormInputWidget({
    super.key,
    required this.labelText,
    this.suffixIcon,
    required this.obscureText,
    this.prefixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: theme.colorScheme.primary,
      obscureText: obscureText,
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        contentPadding: const EdgeInsets.symmetric(horizontal: 20),
        suffixIcon: suffixIcon,
        suffixIconColor: theme.colorScheme.primary,
        hintText: labelText,
        hintStyle: const TextStyle(color: Color(0xff9CA3AF)),
        filled: true,
        fillColor: const Color(0xffF3F3F3),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
