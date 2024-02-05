import 'package:auto_route/auto_route.dart';
import 'package:eco_market/features/search/domain/entities/products_entity.dart';
import 'package:eco_market/features/search/presentation/cubit/search_screen_cubit.dart';
import 'package:flutter/material.dart';

import 'package:eco_market/config/theme/app_colors.dart';
import 'package:eco_market/features/cart/data/models/cart_model.dart';
import 'package:eco_market/features/cart/presentation/widgets/widgets.dart';
import 'package:eco_market/features/main/presentation/widgets/widgets.dart';
import 'package:eco_market/features/search/presentation/widgets/text_price_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:svg_flutter/svg.dart';

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
  List<Items> items = List.generate(30, (index) => Items());
  List<ProductEntity> data = [];
  @override
  void initState() {
    super.initState();
    context.read<SearchScreenCubit>().getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: BlocBuilder<SearchScreenCubit, SearchScreenState>(
        builder: (context, state) {
      if (state is SearchScreenLoading) {
        return const Center(child: CircularProgressIndicator());
      } else if (state is SearchScreenLoaded) {
        data = state.products;
      }
      return data.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset('assets/svg/cart/emptyBag.svg'),
                  const Text(
                    "Карзина пустая",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            )
          : CustomScrollView(
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
                      ProductEntity product = data[index];
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Stack(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.network(
                                        product.image.toString(),
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
                                            removeCart(product);
                                          });
                                        },
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
                                  padding: const EdgeInsets.only(left: 5),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        product.title.toString(),
                                        style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      const SizedBox(
                                        height: 4,
                                      ),
                                      Text(
                                        'цена ${product.price} с за шт',
                                        style: const TextStyle(
                                            color: AppColors.grey,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      const SizedBox(
                                        height: 13,
                                      ),
                                      Text(
                                        '${product.price} с',
                                        style: const TextStyle(
                                          color: AppColors.green,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ],
                                  ),
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
            );
    }));
  }

  void removeCart(ProductEntity productEntity) {
    data.remove(productEntity);
  }

  void clearCart(ProductEntity product) {
    data.clear();
  }
}

class CartItem {
  List<CartModel> items = [];
  String get totalPrice =>
      items.fold('0', (total, item) => total + item.price!);
}
