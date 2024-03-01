import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_1/screens/home_screen.dart';
import 'package:firebase_auth_1/services/snack_bar.dart';
import 'package:flutter/material.dart';

class VerifiyEmailScreen extends StatefulWidget {
  const VerifiyEmailScreen({super.key});

  @override
  State<VerifiyEmailScreen> createState() => _VerifiyEmailScreenState();
}

class _VerifiyEmailScreenState extends State<VerifiyEmailScreen> {
  bool isEmailverified = false;
  bool canResendEmail = false;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    isEmailverified = FirebaseAuth.instance.currentUser!.emailVerified;
    if (!isEmailverified) {
      sendVerificationEmail();
      timer = Timer.periodic(
        const Duration(seconds: 3),
        (_) => checkEmailVerified,
      );
    }
  }

  @override
  void dispose() {
    timer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => isEmailverified
      ? const HomeScreen()
      : Scaffold(
          appBar: AppBar(
            title: const Text('Верификация Email адреса'),
            centerTitle: true,
          ),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Письмо с подтверждением было отправлено на вашу электронную почту.',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton.icon(
                    onPressed: canResendEmail ? sendVerificationEmail : null,
                    icon: const Icon(Icons.email),
                    label: const Text('Повторно отправьте'),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextButton(
                      onPressed: () async {
                        timer?.cancel();
                        await FirebaseAuth.instance.currentUser!.delete();
                      },
                      child: const Text(
                        'Отменит',
                        style: TextStyle(color: Colors.blue),
                      ))
                ],
              ),
            ),
          ),
        );

  Future<void> checkEmailVerified() async {
    await FirebaseAuth.instance.currentUser!.reload();
    setState(() {
      isEmailverified = FirebaseAuth.instance.currentUser!.emailVerified;
    });
    print(isEmailverified);
    if (isEmailverified) timer?.cancel();
  }

  Future<void> sendVerificationEmail() async {
    try {
      final user = FirebaseAuth.instance.currentUser!;
      await user.sendEmailVerification();

      setState(() => canResendEmail = false);
      await Future.delayed(
        const Duration(seconds: 5),
      );
      setState(() => canResendEmail = true);
    } catch (e) {
      print(e);
      if (mounted) {
        SnackbarService.showSnackbar(
          context,
          "$e",
          true,
        );
      }
    }
  }
}
