import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_1/screens/home_screen.dart';
import 'package:firebase_auth_1/screens/veryfiy_email_screen.dart';
import 'package:flutter/material.dart';

class FireBaseStream extends StatelessWidget {
  const FireBaseStream({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Scaffold(
              body: Center(child: Text('Что то пошло не так')),
            );
          } else if (snapshot.hasData) {
            if (!snapshot.data!.emailVerified) {
              return const VerifiyEmailScreen();
            }
            return const HomeScreen();
          } else {
            return const HomeScreen();
          }
        });
  }
}
