import 'package:auto_route/auto_route.dart';
import 'package:eco_market/config/config.dart';
import 'package:flutter/material.dart';

@RoutePage()
class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'История заказов',
          style: TextStyle(color: AppColors.black),
        ),
      ),
    );
  }
}
