import 'package:eco_market/config/config.dart';
import 'package:flutter/material.dart';

Future<void> aboutBottomSheet(BuildContext context) {
  return showModalBottomSheet<void>(
    context: context,
    builder: (BuildContext context) {
      return const SizedBox(
        height: 100,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: AppColors.red,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Center(
              child: Text(
                'Извините на данный момент контакт не работает пишите на Ватсап',
                style: TextStyle(color: AppColors.white, fontSize: 15),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      );
    },
  );
}
