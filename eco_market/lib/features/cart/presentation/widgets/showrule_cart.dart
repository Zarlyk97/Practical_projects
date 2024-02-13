import 'package:eco_market/config/theme/app_colors.dart';
import 'package:eco_market/features/cart/presentation/cubit/cart_screen_cubit.dart';
import 'package:eco_market/features/cart/presentation/widgets/widgets.dart';
import 'package:eco_market/features/main/presentation/widgets/widgets.dart';
import 'package:eco_market/features/search/domain/entities/products_entity.dart';
import 'package:eco_market/features/search/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:svg_flutter/svg_flutter.dart';

showRuleCart(BuildContext context, List<ProductEntity> data) =>
    showModalBottomSheet<void>(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height - 250,
      ),
      isScrollControlled: true,
      context: context,
      showDragHandle: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      builder: (BuildContext context) => StatefulBuilder(
          builder: (context, StateSetter setState) =>
              //  StreamBuilder(
              //     stream: context.read<CartScreenCubit>().cart,
              //     builder: (context, snapshot) {
              //       double total = 0;
              //       if (snapshot.connectionState == ConnectionState.waiting) {
              //         return const Center(child: CircularProgressIndicator());
              //       } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              //         return
              // Center(
              //           child: Column(
              //             mainAxisAlignment: MainAxisAlignment.center,
              //             children: [
              //               SvgPicture.asset('assets/svg/cart/emptyBag.svg'),
              //               const Text(
              //                 "Кoрзина пустая",
              //                 style: TextStyle(
              //                   fontSize: 25,
              //                   fontWeight: FontWeight.w500,
              //                 ),
              //               ),
              //             ],
              //           ),
              //         );
              //       } else if (snapshot.hasData) {
              //         data = snapshot.data!;
              //         total = data.fold(
              //           total,
              //           (total, element) =>
              //               total +
              //               ((element.quantity ?? 1) *
              //                   (double.parse(element.price ?? '1'))),
              //         );
              //       }

              data.isEmpty
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset('assets/svg/cart/emptyBag.svg'),
                          const Text(
                            "Кoрзина пустая",
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    )
                  : CustomScrollView(slivers: [
                      SliverPadding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        sliver: SliverList.separated(
                          itemBuilder: (context, index) {
                            var product = data[index];

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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Stack(
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10),
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
                                                context
                                                    .read<CartScreenCubit>()
                                                    .removeFromCart(
                                                        data[index].id!);
                                              },
                                              child: SizedBox(
                                                height: 32,
                                                width: 32,
                                                child: DecoratedBox(
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12),
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
                                      const SizedBox(width: 8),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              product.title.toString(),
                                              style: const TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                              ),
                                              overflow: TextOverflow.clip,
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
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  '${product.price} с',
                                                  style: const TextStyle(
                                                    color: AppColors.green,
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                ),
                                                Row(
                                                  children: [
                                                    IconButtonWidget(
                                                      icon: Icons.remove,
                                                      onTap: () {
                                                        context
                                                            .read<
                                                                CartScreenCubit>()
                                                            .decrementCart(
                                                                data[index]
                                                                    .id!);
                                                      },
                                                    ),
                                                    const SizedBox(
                                                      width: 24,
                                                    ),
                                                    Text(
                                                      product.quantity
                                                          .toString(),
                                                      style: const TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      width: 24,
                                                    ),
                                                    IconButtonWidget(
                                                      icon: Icons.add,
                                                      onTap: () {
                                                        context
                                                            .read<
                                                                CartScreenCubit>()
                                                            .incrementCart(
                                                                data[index]
                                                                    .id!);
                                                      },
                                                    ),
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
                          texts('Сумму', 'total'),
                          const SizedBox(
                            height: 8,
                          ),
                          texts('Доставка', '150 c'),
                          const SizedBox(
                            height: 8,
                          ),
                          texts('Итого', '{total + 150} c'),
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
                    ])),
    );
