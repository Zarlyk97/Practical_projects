import 'package:flutter/material.dart';
import 'package:spotify/core/configs/theme/app_colors.dart';

class BasicAppButton extends StatelessWidget {
  const BasicAppButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: const StadiumBorder(side: BorderSide.none),
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.black,
          minimumSize: const Size(280, 70),
        ),
        onPressed: () {},
        child: const Text(
          'Get Started',
          style: TextStyle(
              fontSize: 20,
              color: AppColors.lightBackground,
              fontWeight: FontWeight.bold),
        ));
  }
}
