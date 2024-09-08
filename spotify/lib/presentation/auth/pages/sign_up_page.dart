import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify/core/configs/assets/app_images.dart';
import 'package:spotify/core/configs/assets/app_vectors.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Icon(Icons.arrow_back),
        ),
        // SizedBox(
        //     height: 30,
        //     width: 30,
        //     child: DecoratedBox(
        //         decoration: BoxDecoration(
        //       borderRadius: BorderRadius.circular(15),
        //       color: Colors.black,
        //     ))),
        title: SvgPicture.asset(
          AppVectors.logo,
          height: 40,
          width: 40,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _registerText(),
            _fullNameField(),
          ],
        ),
      ),
    );
  }

  Widget _registerText() {
    return const Text(
      "Register",
      style: TextStyle(
          fontWeight: FontWeight.bold, fontSize: 25, color: Colors.white),
      textAlign: TextAlign.center,
    );
  }

  Widget _fullNameField() {
    return TextField();
  }
}
