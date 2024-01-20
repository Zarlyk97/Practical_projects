import 'package:auto_route/auto_route.dart';
import 'package:eco_market/config/router/router.dart';
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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(child: SvgPicture.asset('assets/svg/cart/emptyBag.svg')),
            const Text(
              'У вас нет заказа',
              style: TextStyle(
                color: Color(0xFFABABAD),
                fontSize: 17.60,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 2.7,
            ),
            CustomButtomWidget(
              onPressed: () => context.router.pushAndPopUntil(
                const MainRoute(),
                predicate: (fu) => false,
              ),
              text: 'Перейти в магазин',
              height: 54,
            ),
          ],
        ),
      ),
    );
  }
}
