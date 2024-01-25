import 'package:auto_route/auto_route.dart';
import 'package:eco_market/config/theme/app_colors.dart';
import 'package:eco_market/features/cart/domain/entities/order_entity.dart';
import 'package:eco_market/features/cart/presentation/cubit/cart_screen_cubit.dart';
import 'package:eco_market/features/cart/presentation/pages/cart/cart.dart';
import 'package:eco_market/features/cart/presentation/widgets/widgets.dart';
import 'package:eco_market/features/main/presentation/widgets/widgets.dart';
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
  List<OrderEntity> data = [];
  List<Item> items = List.generate(20, (index) => Item());
  @override
  void initState() {
    super.initState();
    context.read<CartScreenCubit>().getOrders();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<CartScreenCubit, CartScreenState>(
        builder: (context, state) {
          if (state is CartScreenLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is CartScreenLoaded) {
            data = state.orders;
          }
          return CustomScrollView(
            slivers: [
              SliverAppBar(
                title: Row(
                  children: [
                    TextButton(
                      onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const EmptyCartPage())),
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
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: 20,
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                sliver: SliverList.separated(
                  itemBuilder: (context, index) {
                    Item item = items[index];

                    return SizedBox(
                      height: 94,
                      width: double.infinity,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: const Color(0xffF8F8F8),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Row(
                            children: [
                              Stack(
                                children: [
                                  Image.asset(
                                    'assets/images/cart/apple_small.png',
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
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
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
                    );
                  },
                  itemCount: 4,
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 10,
                  ),
                ),
              ),
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: 20,
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                sliver: SliverList.list(children: [
                  texts('Сумму', '23355 c'),
                  const SizedBox(
                    height: 8,
                  ),
                  texts('Доставка', '150 c'),
                  const SizedBox(
                    height: 8,
                  ),
                  texts('Итого', '173228 c'),
                  const SizedBox(
                    height: 40,
                  ),
                  CustomButtomWidget(
                    onPressed: () => dialogBuilder(context),
                    text: 'Оформить заказ',
                    height: 54,
                  ),
                ]),
              ),
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: 16,
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
