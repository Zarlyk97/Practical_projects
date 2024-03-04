import 'package:firebase_auth_cubit/features/auth/presentation/pages/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth_cubit/constant/image_constant.dart';

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
                    key: _fromKey,
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
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please enter your email or password.";
                            }
                            return null;
                          },
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
                          validator: _validateEmail,
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          controller: _confirmPasswordController,
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
                            hintText: 'Confirm Password',
                          ),
                          validator: _validatePassword,
                        ),
                        const SizedBox(height: 20),
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () {
                              if (_fromKey.currentState!.validate()) {
                                // Validate value
                              }
                            },
                            child: const Text(
                              "Sign Up",
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
                              "Add your account to access.",
                              style: TextStyle(color: Colors.white),
                            ),
                            TextButton(
                              child: const Text(
                                "Sign In",
                                style: TextStyle(color: Colors.white),
                              ),
                              onPressed: () {
                                // ToDo: Sign Up Navigation
                                Navigator.push(
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

  // ສຳຫຼັບ TextFormFile password and confirm password
  String? _validatePassword(String? value) {
    //ຖ້າວ່າຂໍ້ມູນວ່າງກໍຈະໃຫ້ສະແດງຂໍ້ຄວາມ ກະລຸນາປ້ອນ email ຫຼື password
    if (value == null || value.isEmpty) {
      return "Please enter your email or password.";

      //ຖ້າວ່າຂໍ້ມູນໜ້ອຍກວ່າ 6 ຕົວ ກໍຈະໃຫ້ສະແດງຂໍ້ຄວາມ ໃຫ້ປ້ອນຂໍ້ມູນຫຼາຍກວ່າ 6 ຕົວຂື້ນໄປ
    } else if (value.length < 6) {
      return "Password must be at least 6 characters long.";

      //ຖ້າວ່າລະຫັດຢັ້ງຢືນບໍ່ຕົງກັບລະຫັດຕັ້ງຕົ້ນກໍໃຫ້ສະແດງຂໍ້ຄວາມວ່າ ລະຫັດບໍ່ຕົງກັນ
    } else if (value != _passwordController.text.trim()) {
      return "Password doesn't match.";
    }
    return null;
  }
}
