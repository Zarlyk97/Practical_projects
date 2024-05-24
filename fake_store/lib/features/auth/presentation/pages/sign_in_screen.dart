import 'package:auto_route/auto_route.dart';
import 'package:fakestore/core/routes/routes.gr.dart';
import 'package:fakestore/features/auth/presentation/cubit/auth_cubit.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
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
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Введите Email';
                  }
                  return null;
                },
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
              BlocConsumer<AuthCubit, AuthState>(
                listener: (BuildContext context, AuthState state) {
                  if (state is LoginSuccess) {
                    context.router.pushAndPopUntil(const MainRoute(),
                        predicate: (route) => false);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(' Войти успешно'),
                        backgroundColor: Colors.green,
                      ),
                    );
                  } else if (state is LoginError) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Войти не удалось'),
                        backgroundColor: Colors.red,
                      ),
                    );
                  }
                },
                builder: (context, state) {
                  return SizedBox(
                    height: 40,
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue),
                      onPressed: () {
                        if (formkey.currentState!.validate()) {
                          context.read<AuthCubit>().login(
                                emailTextInputController.text,
                                passwordTextInputController.text,
                              );
                        }
                      },
                      child: state is LoginLoading
                          ? const CircularProgressIndicator(
                              color: Colors.white,
                            )
                          : const Text(
                              'Войти',
                              style: TextStyle(color: Colors.white),
                            ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 20),
              TextButton(
                  onPressed: () {
                    context.pushRoute(const SignUpRoute());
                  },
                  child: const Text('Регистрация')),
              TextButton(
                onPressed: () {},
                child: const Text('Сбросить пароль'),
              ),
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
}
