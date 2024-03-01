import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_1/screens/account_screen.dart';
import 'package:firebase_auth_1/screens/login_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Главная страница'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              if (user == null) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LoginScreen()));
              } else {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AccountScreen()));
              }
            },
            icon: Icon(Icons.person,
                color: user == null ? Colors.black : Colors.amber),
          ),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            user == null
                ? const Text(
                    'Вам нужно зарегистрироваться!',
                    style: TextStyle(
                        fontSize: 20, decoration: TextDecoration.underline),
                  )
                : const Text(
                    'Вы  уже зарегистрировались',
                    style: TextStyle(
                        fontSize: 20, decoration: TextDecoration.underline),
                  )
          ],
        ),
      ),
    );
  }
}
