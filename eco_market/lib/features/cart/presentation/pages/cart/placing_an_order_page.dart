import 'package:auto_route/annotations.dart';
import 'package:eco_market/config/theme/app_colors.dart';
import 'package:eco_market/core/resources/resources.dart';
import 'package:flutter/material.dart';

@RoutePage()
class PlacingAnOrderPage extends StatelessWidget {
  const PlacingAnOrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: AppColors.black),
        title: const Text(
          'Оформление заказа',
          style: TextStyle(color: AppColors.black),
        ),
        centerTitle: true,
      ),
      body: const Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            CustomInputWidget(hintText: 'Номер телефона'),
            CustomInputWidget(hintText: 'Адрес'),
            CustomInputWidget(hintText: 'Ориентир'),
            CustomInputWidget(hintText: 'Комментарии'),
          ],
        ),
      ),
    );
  }
}
