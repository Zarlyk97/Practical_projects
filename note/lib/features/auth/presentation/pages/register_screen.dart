import 'package:firebase_auth_cubit/constant/image_constant.dart';
import 'package:firebase_auth_cubit/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:firebase_auth_cubit/features/auth/presentation/pages/login_screen.dart';
import 'package:firebase_auth_cubit/features/auth/presentation/widgets/custom_password_textfield.dart';
import 'package:firebase_auth_cubit/features/home_page/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _fromKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  bool hintText = true;
  bool hintText2 = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state.isLoading) {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) => const Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else if (state.user != null) {
            // Loading диалогду жабуу
            Navigator.of(context).pop();

            // HomeScreen'ге өтүү
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const HomePage(),
              ),
            );
          } else if (state.error != null) {
            // Loading диалогду жабуу
            Navigator.of(context).pop();

            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.error!),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        child: Stack(
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
                      key: _fromKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Image(
                              image: NetworkImage(
                                  'https://static.vecteezy.com/system/resources/thumbnails/023/492/712/small_2x/3d-notes-icon-png.png'),
                              height: 150),
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
                            hintText: 'Пароль',
                            obscureText: hintText,
                            keyboardType: TextInputType.text,
                            controller: _passwordController,
                            iconButton: IconButton(
                              onPressed: _onHintText,
                              icon: Icon(
                                hintText
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                            ),
                            validator: _validatePassword,
                          ),
                          const SizedBox(height: 10),
                          CustomPasswordFormField(
                            hintText: 'Подтвердите пароль',
                            obscureText: hintText2,
                            keyboardType: TextInputType.text,
                            controller: _confirmPasswordController,
                            iconButton: IconButton(
                              onPressed: _onHintText2,
                              icon: Icon(
                                hintText2
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                            ),
                            validator: _validateConfirmPassword,
                          ),
                          const SizedBox(height: 20),
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
                                if (_fromKey.currentState!.validate()) {
                                  final email = _emailController.text.trim();
                                  final password =
                                      _passwordController.text.trim();

                                  context
                                      .read<AuthCubit>()
                                      .register(email, password);
                                }
                              },
                              child: const Text(
                                "Регистрация",
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                          ),
                          const SizedBox(height: 30),
                          const Divider(
                            height: 20,
                            color: Colors.grey,
                          ),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "Уже есть аккаунт?",
                                style: TextStyle(color: Colors.white),
                              ),
                              TextButton(
                                child: const Text(
                                  "Войти",
                                  style: TextStyle(color: Colors.white),
                                ),
                                onPressed: () {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const LoginScreen(),
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
        ),
      ),
    );
  }

  void _onHintText2() {
    setState(() {
      hintText2 = !hintText2;
    });
  }

  void _onHintText() {
    setState(() {
      hintText = !hintText;
    });
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return "Пожалуйста введите почту.";
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return "Пожалуйста введите пароль.";
    } else if (value.length < 6) {
      return "Пароль должен быть не менее 6 символов.";
    }
    return null;
  }

  String? _validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) {
      return "Пожалуйста подтвердите пароль.";
    } else if (value != _passwordController.text.trim()) {
      return "Пароли не совпадают.";
    }
    return null;
  }
}
