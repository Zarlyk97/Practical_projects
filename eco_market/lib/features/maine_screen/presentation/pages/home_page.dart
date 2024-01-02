import 'package:auto_route/auto_route.dart';
import 'package:eco_market/config/config.dart';
import 'package:flutter/material.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Amirchik',
          style: TextStyle(color: AppColors.primary),
        ),
      ),
      body: Column(
        children: [
          Container(
            height: 200,
            width: 200,
            decoration: const BoxDecoration(color: AppColors.primary),
          )
        ],
      ),
    );
  }
}
