import 'package:auto_route/auto_route.dart';
import 'package:fakestore/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  void initState() {
    super.initState();
    context.read<CartCubit>().getCart(1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        const SliverAppBar(
          iconTheme: IconThemeData(color: Colors.black),
          title: Text(
            'Корзина',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
          centerTitle: true,
        ),
        const SliverToBoxAdapter(
          child: SizedBox(height: 20),
        ),
        BlocBuilder<CartCubit, CartState>(
          builder: (context, state) {
            if (state is CartLoading) {
              return const SliverFillRemaining(
                child: Center(child: CircularProgressIndicator()),
              );
            } else if (state is CartLoaded) {
              final cartItems = state.cartItems;
              final totalPrice = cartItems.fold<double>(
                  0,
                  (previousValue, item) =>
                      previousValue + (item.product.price! * item.quantity));

              return SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                sliver: SliverList.separated(
                  itemBuilder: (context, index) {
                    final item = cartItems[index];
                    return SizedBox(
                      width: double.infinity,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: const Color(0xffF8F8F8),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Stack(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.network(
                                      item.product.image.toString(),
                                      height: 86,
                                      width: 86,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Positioned(
                                    top: 50,
                                    child: GestureDetector(
                                      onTap: () {
                                        // Продуктту өчүрүү
                                        context
                                            .read<CartCubit>()
                                            .deleteProductFromCart(
                                                item.product.id!,
                                                item.quantity);
                                      },
                                      child: SizedBox(
                                        height: 32,
                                        width: 32,
                                        child: DecoratedBox(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              color: Colors.white),
                                          child: const Icon(
                                            Icons.delete,
                                            color: Colors.red,
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      item.product.title.toString(),
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    const SizedBox(height: 4),
                                    const Text(
                                      'Цена за шт.',
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    const SizedBox(height: 13),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "\$${item.product.price}",
                                          style: const TextStyle(
                                            color: Colors.green,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            const SizedBox(width: 24),
                                            Text(
                                              'Количество: ${item.quantity}',
                                              style: const TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            const SizedBox(width: 24),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  itemCount: cartItems.length,
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 10),
                ),
              );
            } else {
              return const SliverFillRemaining(
                child: Center(child: Text('Корзина пуста')),
              );
            }
          },
        ),
        const SliverToBoxAdapter(
          child: SizedBox(height: 20),
        ),
        BlocBuilder<CartCubit, CartState>(
          builder: (context, state) {
            if (state is CartLoaded) {
              final totalPrice = state.cartItems.fold<double>(
                  0,
                  (previousValue, item) =>
                      previousValue + (item.product.price! * item.quantity));
              return SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                sliver: SliverList.list(children: [
                  texts('Сумма', '\$${totalPrice.toStringAsFixed(2)}'),
                  const SizedBox(height: 8),
                  texts('Доставка', '\$5.00'),
                  const SizedBox(height: 8),
                  texts('Итого', '\$${(totalPrice + 5).toStringAsFixed(2)}'),
                  const SizedBox(height: 40),
                  ElevatedButton(
                    onPressed: () {
                      // Заказды толуктоо логикасы
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: const EdgeInsets.symmetric(
                          vertical: 16, horizontal: 16),
                    ),
                    child: const Text(
                      'Оформить заказ',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ]),
              );
            }
            return const SliverToBoxAdapter();
          },
        ),
        const SliverToBoxAdapter(
          child: SizedBox(height: 16),
        )
      ],
    ));
  }
}

Widget texts(String text, String price) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        text,
        style: const TextStyle(
          color: Color(0xFFABABAD),
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
      Text(
        price,
        style: const TextStyle(
          color: Color(0xFF1E1E1E),
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      )
    ],
  );
}
