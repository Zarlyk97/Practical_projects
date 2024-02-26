import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_1/services/snack_bar.dart';
import 'package:flutter/material.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  TextEditingController emailTextInputController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailTextInputController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Сброс пароля'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                controller: emailTextInputController,
                autocorrect: false,
                validator: (email) =>
                    email != null && !EmailValidator.validate(email)
                        ? 'Введите правельный Email'
                        : null,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), hintText: 'Введите email'),
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                  onPressed: () {}, child: const Text('Сбросить пароль')),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> resetPassword() async {
    final navigator = Navigator.of(context);
    final scaffoldMassager = ScaffoldMessenger.of(context);
    final isValid = formKey.currentState!.validate();
    if (!isValid) return;

    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: emailTextInputController.text.trim());
    } on FirebaseAuthException catch (e) {
      // ignore: avoid_print
      print(e.code);
      if (e.code == 'user-not-found') {
        SnackbarService.showSnackbar(
            // ignore: use_build_context_synchronously
            context,
            'Такой email незарегистрирован!',
            true);
        return;
      } else {
        SnackbarService.showSnackbar(
            // ignore: use_build_context_synchronously
            context,
            'Неизвестная ошибка! Попробуйте еще раз или обратитесь в поддержку.',
            false);
        return;
      }
    }
    const snackbar = SnackBar(
      content: Text('Сброс пароля осуществен. Проверьте почту'),
      backgroundColor: Colors.green,
    );

    scaffoldMassager.showSnackBar(snackbar);
    navigator.pushNamedAndRemoveUntil('/home', (Route<dynamic> route) => false);
  }
}
