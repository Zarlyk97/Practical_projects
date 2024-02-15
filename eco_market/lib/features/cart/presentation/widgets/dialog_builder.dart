import 'package:eco_market/config/config.dart';
import 'package:eco_market/features/cart/presentation/pages/cart/placing_an_order_page.dart';
import 'package:eco_market/features/main/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';

Future<void> dialogBuilder(BuildContext context) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        contentPadding: const EdgeInsets.all(16),
        backgroundColor: AppColors.white,
        content: SizedBox(
          height: 400,
          child: Column(
            children: [
              SvgPicture.asset(
                'assets/svg/cart/bag.svg',
                fit: BoxFit.cover,
              ),
              const SizedBox(
                height: 28,
              ),
              const Text(
                'Заказ может быть при покупке свыше 300 с',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              CustomButtonWidget(
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => const PlacingAnOrderPage())),
                text: 'Закрыть',
                height: 54,
              )
            ],
          ),
        ),
      );
    },
  );
}
