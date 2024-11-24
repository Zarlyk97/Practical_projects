import 'package:firebase_auth_cubit/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:firebase_auth_cubit/features/auth/presentation/pages/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> customConfirmDialog(BuildContext context) async {
  Widget cancelButton = TextButton(
    child: const Text("Оменить"),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );
  Widget continueButton = TextButton(
    child: const Text("Продолжить"),
    onPressed: () {
      BlocProvider.of<AuthCubit>(context).signOut();
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        ),
      );
    },
  );
  AlertDialog alert = AlertDialog(
    title: const Text("Предупреждение"),
    content: const Text(
      "Вы действительно хотите выйти?",
    ),
    actions: [
      cancelButton,
      continueButton,
    ],
  );
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
