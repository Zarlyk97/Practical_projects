import 'package:flutter/material.dart';
import 'package:spotify/core/configs/theme/app_colors.dart';

class BasicAppButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;
  final double? height;
  const BasicAppButton({
    super.key,
    this.onPressed,
    required this.text,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: const StadiumBorder(
          side: BorderSide.none,
        ),
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.black,
        minimumSize: Size.fromHeight(height ?? 70),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: const TextStyle(
            fontSize: 20,
            color: AppColors.lightBackground,
            fontWeight: FontWeight.bold),
      ),
    );
  }
}
