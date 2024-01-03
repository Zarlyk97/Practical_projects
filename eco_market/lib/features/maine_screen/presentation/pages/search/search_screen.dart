import 'package:auto_route/auto_route.dart';
import 'package:eco_market/config/config.dart';
import 'package:flutter/material.dart';

@RoutePage()
class SeachScreen extends StatefulWidget {
  const SeachScreen({super.key});

  @override
  State<SeachScreen> createState() => _SeachScreenState();
}

class _SeachScreenState extends State<SeachScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: AppColors.black),
        title: const Text(
          'Продукты',
          style: TextStyle(color: AppColors.black),
        ),
      ),
    );
  }
}
