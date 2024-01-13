import 'package:auto_route/auto_route.dart';
import 'package:eco_market/config/router/router.dart';
import 'package:eco_market/config/theme/app_colors.dart';
import 'package:eco_market/features/main/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';

Future<void> dialogBuilderplacingAnOrder(BuildContext context) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        contentPadding: const EdgeInsets.all(16),
        backgroundColor: AppColors.white,
        content: SizedBox(
          height: 430,
          child: Column(
            children: [
              SvgPicture.asset(
                'assets/svg/cart/bag3.svg',
                fit: BoxFit.cover,
              ),
              const SizedBox(
                height: 28,
              ),
              const Text(
                'Заказ №343565657 оформлен',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              const Text(
                'Дата и время 07.07.2023 12:46',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFFABABAD),
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              CustomButtomWidget(
                onPressed: () => context.navigateTo(const SeachRoute()),
                text: 'Перейти в магазин',
                height: 54,
              )
            ],
          ),
        ),
      );
    },
  );
}
