import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.theme,
  });

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
          minimumSize: const MaterialStatePropertyAll(Size(70, 30)),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          )),
          backgroundColor: MaterialStateProperty.all(theme.primaryColor),
        ),
        onPressed: () {},
        child:
            const Text("Подписаться", style: TextStyle(color: Colors.white)));
  }
}
