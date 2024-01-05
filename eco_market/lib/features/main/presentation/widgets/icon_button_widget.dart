import 'package:eco_market/config/theme/app_colors.dart';
import 'package:flutter/material.dart';

class IconButtonWidget extends StatelessWidget {
  const IconButtonWidget({
    super.key,
    this.icon,
    this.onTap,
  });
  final IconData? icon;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: 32,
        width: 32,
        child: DecoratedBox(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: AppColors.green),
            child: Icon(
              icon,
              size: 24,
              color: AppColors.white,
            )),
      ),
    );
  }
}
