import 'package:auto_route/auto_route.dart';
import 'package:fakestore/features/auth/domain/models/user_model.dart';
import 'package:fakestore/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool isFirstPasswordHidden = true;
  bool isSecondPasswordHidden = true;
  TextEditingController emailTextInputController = TextEditingController();
  TextEditingController userNameTextInputController = TextEditingController();
  TextEditingController passwordTextInputController = TextEditingController();
  TextEditingController passwordTextRepeatInputController =
      TextEditingController();
  final formkey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailTextInputController.dispose();
    userNameTextInputController.dispose();
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
                  controller: userNameTextInputController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Введите имя';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.only(left: 20),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      hintText: 'Введите имя'),
                ),
                const SizedBox(
                  height: 20,
                ),
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
                  obscureText: isFirstPasswordHidden,
                  autocorrect: false,
                  controller: passwordTextInputController,
                  validator: (value) => value != null && value.length < 6
                      ? 'Минимум 6 символов'
                      : null,
                  decoration: InputDecoration(
                      suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              isFirstPasswordHidden = !isFirstPasswordHidden;
                            });
                          },
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
                          onTap: () {
                            setState(() {
                              isSecondPasswordHidden = !isSecondPasswordHidden;
                            });
                          },
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
                    child: BlocConsumer<AuthCubit, AuthState>(
                      listener: (context, state) {
                        if (state is RegisterSuccess) {
                          context.router.maybePop();
                        } else if (state is RegisterError) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Регистрация не удалась'),
                              backgroundColor: Colors.red,
                            ),
                          );
                        }
                      },
                      builder: (context, state) {
                        return ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue),
                            onPressed: () {
                              if (formkey.currentState!.validate()) {
                                context.read<AuthCubit>().register(
                                      UserModel(
                                        email: emailTextInputController.text
                                            .trim(),
                                        password: passwordTextInputController
                                            .text
                                            .trim(),
                                        name: UserNameModel(
                                            firstname:
                                                userNameTextInputController.text
                                                    .trim()),
                                      ),
                                    );
                              }
                            },
                            child: state is RegisterLoading
                                ? const CircularProgressIndicator(
                                    color: Colors.white)
                                : const Text(
                                    'Регистрация',
                                    style: TextStyle(color: Colors.white),
                                  ));
                      },
                    )),
                const SizedBox(height: 20),
                TextButton(
                  onPressed: () => context.maybePop(),
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
}
