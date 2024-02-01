// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'package:eco_market/config/theme/app_colors.dart';
import 'package:eco_market/features/cart/data/models/cart_model.dart';
import 'package:eco_market/features/cart/presentation/widgets/widgets.dart';
import 'package:eco_market/features/main/presentation/widgets/widgets.dart';
import 'package:eco_market/features/search/presentation/widgets/text_price_widget.dart';

@RoutePage()
class CartPage extends StatefulWidget {
  final CartItem cart;

  const CartPage({
    Key? key,
    required this.cart,
  }) : super(key: key);
  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  List<Items> items = List.generate(20, (index) => Items());
  List<CartItem> data = [];
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverAppBar(
          title: Row(
            children: [
              TextButton(
                onPressed: () {
                  setState(() {
                    clearCart(data[0]);
                  });
                },
                // => Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (_) => const EmptyCartPage())),
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
              Items item = items[index];
              CartItem cartItem = data[index];

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
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(
                                cartItem.items[index].image.toString(),
                                height: 86,
                                width: 86,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Positioned(
                              top: 50,
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    removeCart(cartItem);
                                  });
                                },
                                child: SizedBox(
                                  height: 32,
                                  width: 32,
                                  child: DecoratedBox(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
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
                            children: [
                              Text(
                                cartItem.items[index].title.toString(),
                                style: const TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w500),
                              ),
                              const SizedBox(
                                height: 2,
                              ),
                              Text(
                                'цена ${cartItem.items[index].price} с за шт',
                                style: const TextStyle(
                                    color: AppColors.grey,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500),
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              Row(
                                children: [
                                  Text(
                                    '${cartItem.items[index].price} с',
                                    style: const TextStyle(
                                      color: AppColors.green,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 50,
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
            itemCount: data.length,
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
            texts('Сумму', '2336 c'),
            const SizedBox(
              height: 8,
            ),
            texts('Доставка', '150 c'),
            const SizedBox(
              height: 8,
            ),
            texts('Итого', '1732 c'),
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
    ));
  }

  void removeCart(CartItem cartItem) {
    items.remove(cartItem);
  }

  void clearCart(CartItem entity) {
    items.clear();
  }
}

class CartItem {
  List<CartModel> items = [];
  String get totalPrice =>
      items.fold('0', (total, item) => total + item.price!);
}
