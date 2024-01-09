import 'package:eco_market/config/theme/app_colors.dart';
import 'package:flutter/material.dart';

class SocialButtonWidget extends StatelessWidget {
  const SocialButtonWidget({
    super.key,
    this.onPressed,
    required this.text,
    required this.child,
  });
  final void Function()? onPressed;
  final String text;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16), // <-- Radius
        ),
        backgroundColor: const Color(0xFFF8F8F8),
        fixedSize: const Size(double.infinity, 54),
      ),
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          child,
          const SizedBox(
            width: 8,
          ),
          Text(
            text,
            style: const TextStyle(
              color: AppColors.black,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
