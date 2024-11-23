import 'package:firebase_auth_cubit/constant/image_constant.dart';
import 'package:firebase_auth_cubit/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:firebase_auth_cubit/features/home_page/presentation/pages/home_screen.dart';
import 'package:firebase_auth_cubit/features/auth/presentation/pages/register_screen.dart';
import 'package:firebase_auth_cubit/features/auth/presentation/widgets/custom_password_textfield.dart';
import 'package:firebase_auth_cubit/features/reset_password/pages/reset_password_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();

  final _passwordController = TextEditingController();

  bool hintText = true;

  void _onHintText() {
    setState(() {
      hintText = !hintText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthLoading) {
            const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is AuthSuccess) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const HomeScreen()));
          } else if (state is AuthFailure) {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text("Предупреждение"),
                  content: const Text("Неправильный логин или пароль"),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text("Повторить"),
                    ),
                  ],
                );
              },
            );
          }
        },
        builder: (context, state) {
          return Stack(
            children: [
              Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(ImageConstant.backgroundImage),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Center(
                    child: SingleChildScrollView(
                      child: Form(
                        key: _formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Image(
                              image: NetworkImage(
                                  'https://static.vecteezy.com/system/resources/thumbnails/023/492/712/small_2x/3d-notes-icon-png.png'),
                              height: 150,
                            ),
                            const SizedBox(height: 30),
                            TextFormField(
                              controller: _emailController,
                              keyboardType: TextInputType.emailAddress,
                              style: const TextStyle(color: Colors.black),
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                errorBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.red),
                                ),
                                hintText: 'Электронная почта',
                              ),
                              validator: _validateEmail,
                            ),
                            const SizedBox(height: 10),
                            CustomPasswordFormField(
                                controller: _passwordController,
                                keyboardType: TextInputType.text,
                                hintText: 'Пароль',
                                obscureText: hintText,
                                iconButton: IconButton(
                                  onPressed: _onHintText,
                                  icon: Icon(
                                    hintText
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                  ),
                                ),
                                validator: _validatePassword),
                            const SizedBox(height: 20),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ResetPasswordScreen(),
                                  ),
                                );
                              },
                              child: const Text(
                                "Забыли пароль?",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            const SizedBox(height: 25),
                            SizedBox(
                              width: MediaQuery.of(context).size.width,
                              height: 50,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                  ),
                                ),
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    final email = _emailController.text.trim();
                                    final password =
                                        _passwordController.text.trim();

                                    context
                                        .read<AuthCubit>()
                                        .login(email, password);
                                  }
                                },
                                child: const Text(
                                  "Войти",
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                            ),
                            const SizedBox(height: 30),
                            const Text(
                              "ИЛИ",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 10),
                            TextButton(
                              onPressed: () {
                                // ToDo: Login with facebook future.
                                BlocProvider.of<AuthCubit>(context)
                                    .signInWithGoogle();
                              },
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image(
                                    image: AssetImage(ImageConstant.googleIcon),
                                    height: 20,
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    "Через Google",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 20),
                            const Divider(
                              height: 10,
                              color: Colors.grey,
                            ),
                            const SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  "У вас нет аккаунта?",
                                  style: TextStyle(color: Colors.white),
                                ),
                                TextButton(
                                  child: const Text(
                                    "Зарегистрироваться",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  onPressed: () {
                                    // ToDo: Sign Up Navigation
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const RegisterScreen(),
                                      ),
                                    );
                                  },
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return "Пожалуйста введите вашу почту или пароль.";
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return "Пожалуйста введите вашу почту или пароль.";
    } else if (value.length < 6) {
      return "Пароль должен быть не менее 6 символов.";
    }
    return null;
  }
}
