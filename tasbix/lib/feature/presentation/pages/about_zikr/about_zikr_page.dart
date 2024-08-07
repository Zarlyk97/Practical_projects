import 'package:flutter/material.dart';

class AboutZikrPage extends StatelessWidget {
  final String name;
  final String description;
  const AboutZikrPage({
    super.key,
    required this.name,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [Center(child: Text(description))],
        ),
      ),
    );
  }
}
