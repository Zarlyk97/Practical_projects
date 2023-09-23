// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFormButton extends StatelessWidget {
  TextFormButton({
    Key? key,
    this.text,
    this.icon,
    this.suffixicon,
    this.hintext,
    this.border,
    this.helptext,
    this.maxLines,
    this.controller,
    this.keyboardType,
    this.validator,
    this.inputFormatters,
    this.errorBorder,
    this.focusNode,
    this.onFieldSubmitted,
    required this.obscureText,
    this.maxLength,
  }) : super(key: key);
  final String? text;
  final Icon? icon;
  final IconButton? suffixicon;
  final String? hintext;
  final InputBorder? border;
  final String? helptext;
  final int? maxLines;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatters;
  final InputBorder? errorBorder;
  final formkey = GlobalKey<FormState>();
  final FocusNode? focusNode;
  final Function(String)? onFieldSubmitted;
  final bool obscureText;
  final int? maxLength;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLength: maxLength,
      obscureText: obscureText,
      onFieldSubmitted: onFieldSubmitted,
      autofocus: true,
      focusNode: focusNode,
      decoration: InputDecoration(
          errorBorder: errorBorder,
          helperText: helptext,
          labelText: text,
          hintText: hintext,
          prefixIcon: icon,
          suffixIcon: suffixicon,
          border: border),
      maxLines: maxLines,
      controller: controller,
    );
  }
}
