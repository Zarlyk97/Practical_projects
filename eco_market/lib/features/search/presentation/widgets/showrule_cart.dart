import 'package:eco_market/config/theme/app_colors.dart';
import 'package:eco_market/features/cart/presentation/widgets/widgets.dart';
import 'package:eco_market/features/main/presentation/widgets/widgets.dart';
import 'package:eco_market/features/search/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

showRuleCart(
  BuildContext context,
  Item addAndRemove,
) =>
    showModalBottomSheet<void>(
      // isScrollControlled: true,
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
        builder: (context, StateSetter setState) => CustomScrollView(
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              sliver: SliverList.separated(
                itemBuilder: (context, index) {
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
                                                  addAndRemove
                                                      .decrementCounter();
                                                },
                                              );
                                            },
                                          ),
                                          const SizedBox(
                                            width: 24,
                                          ),
                                          Text(
                                            addAndRemove
                                                .getCounter()
                                                .toString(),
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
                                                  addAndRemove
                                                      .incrementCounter();
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
                itemCount: 3,
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
        ),
      ),
    );
