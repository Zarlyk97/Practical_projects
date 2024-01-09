import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:eco_market/config/theme/app_colors.dart';
import 'package:eco_market/features/cart/presentation/widgets/widgets.dart';
import 'package:eco_market/features/main/presentation/widgets/custom_button_widget.dart';
import 'package:flutter/material.dart';

@RoutePage()
class PlacingAnOrderPage extends StatelessWidget {
  const PlacingAnOrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: AppColors.black),
        title: const Text(
          'Оформление заказа',
          style: TextStyle(color: AppColors.black),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const CustomInputWidget(
              hintText: 'Номер телефона',
            ),
            const SizedBox(
              height: 20,
            ),
            const CustomInputWidget(
              hintText: 'Адрес',
            ),
            const SizedBox(
              height: 20,
            ),
            const CustomInputWidget(
              hintText: 'Ориентир',
            ),
            const SizedBox(
              height: 20,
            ),
            const CustomInputWidget(
              hintText: 'Комментарии',
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 3,
            ),
            const Text(
              'Сумма Заказа 340 с',
              style: TextStyle(
                color: Color(0xFF1E1E1E),
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            CustomButtomWidget(
              onPressed: () => dialogBuilderplacingAnOrder(context),
              height: 54,
              text: 'Заказать доставку',
            )
          ],
        ),
      ),
    );
  }
}
