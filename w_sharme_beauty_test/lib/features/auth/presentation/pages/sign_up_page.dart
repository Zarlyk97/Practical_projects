import 'package:flutter/material.dart';
import 'package:w_sharme_beauty_test/config/theme/theme.dart';
import 'package:w_sharme_beauty_test/features/auth/presentation/widgets/text_form_input_widget.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Авторизироваться",
              style: theme.textTheme.titleLarge,
            ),
            Text("Что-бы пользоваться сервисом на любом устройстве.",
                style: theme.textTheme.bodySmall),
            Column(
              //mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const SizedBox(height: 30),
                TextFormInputWidget(
                  labelText: "Эл.адрес или номер телефона",
                  obscureText: false,
                ),
                const SizedBox(height: 10),
                TextFormInputWidget(
                  labelText: "Введите пароль",
                  suffixIcon: IconButton(
                    onPressed: () {
                      _toggle();
                    },
                    icon: _obscureText
                        ? Icon(
                            Icons.visibility_off_outlined,
                          )
                        : Icon(
                            Icons.remove_red_eye_outlined,
                          ),
                  ),
                  obscureText: _obscureText,
                ),
                Text("Забыли пароль?",
                    style: theme.textTheme.bodySmall!.copyWith(
                      color: theme.colorScheme.primary,
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }
}
