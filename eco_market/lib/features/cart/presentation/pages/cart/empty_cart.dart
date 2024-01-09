import 'package:auto_route/annotations.dart';
import 'package:eco_market/config/theme/app_colors.dart';
import 'package:eco_market/features/main/presentation/widgets/custom_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:svg_flutter/svg_flutter.dart';

@RoutePage()
class EmptyCartPage extends StatelessWidget {
  const EmptyCartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Корзина',
          style: TextStyle(color: AppColors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: SvgPicture.asset('assets/svg/cart/emptyBag.svg'),
            ),
            const Text('У вас нет заказа'),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CustomButtomWidget(
                  onPressed: () {},
                  text: 'Перейти в магазин',
                  height: 54,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
