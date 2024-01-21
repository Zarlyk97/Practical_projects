import 'package:flutter/material.dart';

Widget text(String text) {
  return Text(
    text,
    style: const TextStyle(
      color: Colors.white,
      fontSize: 16,
      fontWeight: FontWeight.w600,
    ),
  );
}

Widget priceText(String text) {
  return Text(
    text,
    style: const TextStyle(
      color: Color(0xFFD2D1D5),
      fontSize: 12,
      fontWeight: FontWeight.w500,
    ),
  );
}
