import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_1/services/snack_bar.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool isFirstPasswordHidden = true;
  bool isSecondPasswordHidden = true;
  TextEditingController emailTextInputController = TextEditingController();
  TextEditingController passwordTextInputController = TextEditingController();
  TextEditingController passwordTextRepeatInputController =
      TextEditingController();
  final formkey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailTextInputController.dispose();
    passwordTextInputController.dispose();
    passwordTextRepeatInputController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Зарегистрироваться'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: formkey,
            child: Column(
              children: [
                const SizedBox(
                  height: 80,
                ),
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
                  obscureText: isFirstPasswordHidden,
                  autocorrect: false,
                  controller: passwordTextInputController,
                  validator: (value) => value != null && value.length < 6
                      ? 'Минимум 6 символов'
                      : null,
                  decoration: InputDecoration(
                      suffixIcon: GestureDetector(
                          onTap: toggleFirstPasswordView,
                          child: Icon(isFirstPasswordHidden
                              ? Icons.visibility_off
                              : Icons.visibility)),
                      contentPadding: const EdgeInsets.only(left: 20),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30)),
                      hintText: 'Введите пароль'),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  obscureText: isSecondPasswordHidden,
                  autocorrect: false,
                  controller: passwordTextRepeatInputController,
                  validator: (value) => value != null && value.length < 6
                      ? 'Минимум 6 символов'
                      : null,
                  decoration: InputDecoration(
                      suffixIcon: GestureDetector(
                          onTap: toggleSecondPasswordView,
                          child: Icon(isSecondPasswordHidden
                              ? Icons.visibility_off
                              : Icons.visibility)),
                      contentPadding: const EdgeInsets.only(left: 20),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30)),
                      hintText: 'Введите пароль еще раз'),
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
                        onPressed: signUp,
                        child: const Text(
                          'Регистрация',
                          style: TextStyle(color: Colors.white),
                        ))),
                const SizedBox(height: 20),
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text(
                    'Войти',
                    style: TextStyle(
                        color: Colors.blue,
                        decoration: TextDecoration.underline),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void toggleFirstPasswordView() {
    setState(() {
      isFirstPasswordHidden = !isFirstPasswordHidden;
    });
  }

  void toggleSecondPasswordView() {
    setState(() {
      isSecondPasswordHidden = !isSecondPasswordHidden;
    });
  }

  Future<void> signUp() async {
    final navigator = Navigator.of(context);

    final isValid = formkey.currentState!.validate();
    if (!isValid) return;

    if (passwordTextInputController.text !=
        passwordTextRepeatInputController.text) {
      SnackbarService.showSnackbar(context, 'Пароли должны совпадать', true);
      return;
    }
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailTextInputController.text.trim(),
          password: passwordTextInputController.text.trim());
    } on FirebaseAuthException catch (e) {
      print(e.code);

      if (e.code == 'email-already-in-use') {
        SnackbarService.showSnackbar(
            context,
            'Такой Email уже используется, повторите попытку с использованием другого Email',
            true);
        return;
      } else {
        SnackbarService.showSnackbar(
            context,
            'Неизвестная ошибка! Попробуйте еще раз или обратитесь в поддержку.',
            true);
      }
    }

    navigator.pushNamedAndRemoveUntil('/', (Route<dynamic> route) => false);
  }
}
