import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SecondPage'),
        centerTitle: true,
      ),
      body: const SafeArea(
        child: Column(
          children: [
            Center(child: Text('kandaisyn')),
          ],
        ),
      ),
    );
  }
}
