import 'package:flutter/material.dart';

Widget texts(String text, String price) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        text,
        style: const TextStyle(
          color: Color(0xFFABABAD),
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
      Text(
        price,
        style: const TextStyle(
          color: Color(0xFF1E1E1E),
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      )
    ],
  );
}
