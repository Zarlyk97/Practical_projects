import 'package:auto_route/auto_route.dart';
import 'package:eco_market/config/router/router.dart';
import 'package:eco_market/config/theme/app_colors.dart';
import 'package:eco_market/features/cart/presentation/widgets/widgets.dart';
import 'package:eco_market/features/main/presentation/widgets/widgets.dart';
import 'package:eco_market/features/search/presentation/cubit/search_screen_cubit.dart';
import 'package:eco_market/features/search/presentation/widgets/text_price_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  List<Item> items = List.generate(20, (index) => Item());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            TextButton(
              onPressed: () => context.pushRoute(const EmptyCartRoute()),
              child: const Text(
                'Очистить',
                style: TextStyle(
                  color: AppColors.red,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(
              width: 50,
            ),
            const Text(
              'Корзина',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: AppColors.black),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: BlocBuilder<SearchScreenCubit, SearchScreenState>(
        builder: (context, state) {
          Item item = items[4];

          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 24, 16, 16),
              child: Column(
                children: [
                  for (int i = 1; i < 5; i++)
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 5),
                      height: 94,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: const Color(0xffF8F8F8),
                          borderRadius: BorderRadius.circular(12)),
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Row(
                          children: [
                            Stack(
                              children: [
                                Image.asset(
                                  'assets/images/search/apples_small.png',
                                  height: 86,
                                  width: 86,
                                  fit: BoxFit.cover,
                                ),
                                Positioned(
                                  top: 50,
                                  child: GestureDetector(
                                    onTap: () {},
                                    child: SizedBox(
                                      height: 32,
                                      width: 32,
                                      child: DecoratedBox(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                            color: AppColors.white),
                                        child: const Icon(
                                          Icons.delete,
                                          color: AppColors.red,
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    'Драконий фрукт',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  const Text(
                                    'цена 340 с за шт',
                                    style: TextStyle(
                                        color: AppColors.grey,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  const SizedBox(
                                    height: 14,
                                  ),
                                  Row(
                                    children: [
                                      const Text(
                                        '56 с',
                                        style: TextStyle(
                                          color: AppColors.green,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.21,
                                      ),
                                      Row(
                                        children: [
                                          IconButtonWidget(
                                            icon: Icons.remove,
                                            onTap: () {
                                              setState(
                                                () {
                                                  item.decrementCounter();
                                                },
                                              );
                                            },
                                          ),
                                          const SizedBox(
                                            width: 24,
                                          ),
                                          Text(
                                            item.getCounter().toString(),
                                            style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 24,
                                          ),
                                          IconButtonWidget(
                                            icon: Icons.add,
                                            onTap: () {
                                              setState(
                                                () {
                                                  item.incrementCounter();
                                                },
                                              );
                                            },
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  const SizedBox(
                    height: 20,
                  ),
                  texts('Сумму', '396 c'),
                  const SizedBox(
                    height: 8,
                  ),
                  texts('Доставка', '150 c'),
                  const SizedBox(
                    height: 8,
                  ),
                  texts('Итого', '546 c'),
                  const SizedBox(
                    height: 50,
                  ),
                  CustomButtomWidget(
                    onPressed: () => dialogBuilder(context),
                    text: 'Оформить заказ',
                    height: 54,
                  ),
                  const SizedBox(
                    height: 16,
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
