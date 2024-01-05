import 'package:eco_market/config/config.dart';
import 'package:flutter/material.dart';

class CustomButtomWidget extends StatelessWidget {
  const CustomButtomWidget({
    super.key,
    this.height,
    this.onPressed,
    required this.text,
  });
  final double? height;
  final void Function()? onPressed;
  final String text;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: double.infinity,
      child: ElevatedButton(
        style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            )),
            backgroundColor: const MaterialStatePropertyAll(AppColors.green)),
        onPressed: onPressed,
        child: Text(
          text,
          style: const TextStyle(
              color: AppColors.white,
              fontSize: 16,
              fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
