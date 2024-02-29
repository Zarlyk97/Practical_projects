import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_1/services/snack_bar.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isHiddenPassword = true;
  TextEditingController emailTextInputController = TextEditingController();
  TextEditingController passwordTextInputController = TextEditingController();
  final formkey = GlobalKey<FormState>();
  @override
  void dispose() {
    emailTextInputController.dispose();
    passwordTextInputController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Войти'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: emailTextInputController,
                validator: (email) =>
                    email != null && !EmailValidator.validate(email)
                        ? 'Введите правильный Email'
                        : null,
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.only(left: 20),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    hintText: 'Введите Email'),
              ),
              const SizedBox(
                height: 30,
              ),
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                obscureText: isHiddenPassword,
                autocorrect: false,
                controller: passwordTextInputController,
                validator: (value) => value != null && value.length < 6
                    ? 'Минимум 6 символов'
                    : null,
                decoration: InputDecoration(
                    suffixIcon: GestureDetector(
                        onTap: togglePasswordView,
                        child: Icon(isHiddenPassword
                            ? Icons.visibility_off
                            : Icons.visibility)),
                    contentPadding: const EdgeInsets.only(left: 20),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30)),
                    hintText: 'Введите пароль,'),
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                  height: 40,
                  width: double.infinity,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue),
                      onPressed: login,
                      child: const Text(
                        'Войти',
                        style: TextStyle(color: Colors.white),
                      ))),
              const SizedBox(height: 20),
              TextButton(
                  onPressed: () => Navigator.of(context).pushNamed('/signup'),
                  child: const Text('Регистрация')),
              TextButton(
                  onPressed: () =>
                      Navigator.of(context).pushNamed('/reset_password'),
                  child: const Text('Сбросить пароль'))
            ],
          ),
        ),
      ),
    );
  }

  void togglePasswordView() {
    setState(() {
      isHiddenPassword = !isHiddenPassword;
    });
  }

  Future<void> login() async {
    final navigator = Navigator.of(context);
    final isValid = formkey.currentState!.validate();
    if (!isValid) return;

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailTextInputController.text.trim(),
          password: passwordTextInputController.text.trim());
    } on FirebaseAuthException catch (e) {
      print(e.code);
      if (e.code == 'user-not-found' || e.code == 'wrong-password') {
        SnackbarService.showSnackbar(
            context, 'Неправильный email или пароль. Повторите попытку', true);
        return;
      } else {
        SnackbarService.showSnackbar(
            context,
            'Неизвестная ошибка! Попробуйте еще раз или обратитесь в поддержку.',
            true);
        return;
      }
    }

    navigator.pushNamedAndRemoveUntil('/home', (Route<dynamic> route) => false);
  }
}
