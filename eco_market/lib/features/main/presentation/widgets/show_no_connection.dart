import 'package:auto_route/auto_route.dart';
import 'package:eco_market/config/config.dart';
import 'package:eco_market/features/main/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

Future<void> showNoConnection(BuildContext context) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        contentPadding: const EdgeInsets.all(16),
        backgroundColor: AppColors.white,
        content: SizedBox(
          height: 458,
          child: Column(
            children: [
              const Image(
                image: AssetImage('assets/images/network/no_connection.png'),
                fit: BoxFit.cover,
              ),
              const SizedBox(
                height: 16,
              ),
              const Text(
                'Отсутствует интернет  соединение',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              const Text(
                'Попробуйте подключить мобильный интернет',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFFABABAD),
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              CustomButtomWidget(
                onPressed: () => context.popRoute(),
                text: 'Ok',
                height: 54,
              )
            ],
          ),
        ),
      );
    },
  );
}
