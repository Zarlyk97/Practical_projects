import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CircleAvatar(child: Text("A")),
        title: const Text("Главная"),
        actions: [
          Image.asset('assets/png/comment.png'),
          Image.asset('assets/notification.png'),
        ],
      ),
    );
  }
}
