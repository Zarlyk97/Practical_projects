import 'package:flutter/material.dart';

class SubmitButtonWidget extends StatelessWidget {
  final VoidCallback? onTap;
  final String title;
  final Color bgColor;
  final TextStyle? textStyle;
  final bool? isLoading;
  final double? height;
  final double? width;
  final Color? borderColor;

  const SubmitButtonWidget({
    super.key,
    this.onTap,
    required this.title,
    required this.bgColor,
    required this.textStyle,
    this.isLoading = false,
    this.height,
    this.width,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        foregroundColor:
            borderColor != null ? borderColor!.withAlpha(1) : Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: borderColor != null
              ? BorderSide(color: borderColor!)
              : BorderSide.none,
        ),
        shadowColor: borderColor != null ? Colors.transparent : Colors.blue,
        minimumSize: width != null
            ? Size(width!, height ?? 55)
            : Size.fromHeight(height ?? 55),
        backgroundColor: bgColor,
      ),
      child: isLoading == true
          ? const SizedBox(
              width: 25,
              height: 25,
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            )
          : Text(
              title,
              style: textStyle,
            ),
    );
  }
}
