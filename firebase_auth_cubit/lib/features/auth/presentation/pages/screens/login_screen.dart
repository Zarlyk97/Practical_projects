import 'package:firebase_auth_cubit/features/auth/presentation/pages/screens/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth_cubit/constant/image_constant.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
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
              padding: const EdgeInsets.all(10.0),
              child: Center(
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Image(
                          image: AssetImage(ImageConstant.instagramIcon),
                          height: 100,
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
                            hintText: 'Email address',
                          ),
                          validator: _validateEmail,
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          controller: _passwordController,
                          obscureText: true,
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
                            hintText: 'Password',
                          ),
                          validator: _validatePassword,
                        ),
                        const SizedBox(height: 20),
                        TextButton(
                          onPressed: () {
                            // ToDo: Forget password Future.
                          },
                          child: const Text(
                            "Forget your password?",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        const SizedBox(height: 25),
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                //Validate value
                              }
                            },
                            child: const Text(
                              "Log In",
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                        ),
                        const SizedBox(height: 30),
                        const Text(
                          "OR",
                          style: TextStyle(
                              color: Colors.grey, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 10),
                        TextButton(
                          onPressed: () {
                            // ToDo: Login with facebook future.
                          },
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image(
                                image: NetworkImage(
                                    'https://upload.wikimedia.org/wikipedia/commons/thumb/c/cd/Facebook_logo_%28square%29.png/640px-Facebook_logo_%28square%29.png'),
                                height: 20,
                              ),
                              SizedBox(width: 10),
                              Text(
                                "Continue as Facebook",
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
                              "Don't have an account?",
                              style: TextStyle(color: Colors.white),
                            ),
                            TextButton(
                              child: const Text(
                                "Sign Up",
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
      ),
    );
  }

  // ສຳຫຼັບ TextFormFile email
  String? _validateEmail(String? value) {
    //ຖ້າວ່າຂໍ້ມູນວ່າງກໍຈະໃຫ້ສະແດງຂໍ້ຄວາມ ກະລຸນາປ້ອນ email ຫຼື password
    if (value == null || value.isEmpty) {
      return "Please enter your email or password.";
    }
    return null;
  }

  // ສຳຫຼັບ TextFormFile password
  String? _validatePassword(String? value) {
    //ຖ້າວ່າຂໍ້ມູນວ່າກໍຈະໃຫ້ສະແດງຂໍ້ຄວາມ ກະລຸນາປ້ອນ email ຫຼື password
    if (value == null || value.isEmpty) {
      return "Please enter your email or password.";
      //ຖ້າວ່າຂໍ້ມູນໜ້ອຍກວ່າ 6 ຕົວ ກໍຈະໃຫ້ສະແດງຂໍ້ຄວາມ ໃຫ້ປ້ອນຂໍ້ມູນຫຼາຍກວ່າ 6 ຕົວຂື້ນໄປ
    } else if (value.length < 6) {
      return "Password must be at least 6 characters long.";
    }
    return null;
  }
}
