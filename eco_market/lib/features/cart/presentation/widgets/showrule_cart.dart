import 'package:eco_market/config/theme/app_colors.dart';
import 'package:eco_market/features/cart/presentation/pages/pages.dart';
import 'package:eco_market/features/main/presentation/widgets/widgets.dart';
import 'package:eco_market/features/search/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

showRuleCart(BuildContext context, Item added) => showModalBottomSheet<void>(
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
        builder: (context, StateSetter setState) => Padding(
          padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
          child: Column(
            children: [
              Expanded(
                child: ListView.separated(
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: Stack(
                          children: [
                            Image.asset(
                              'assets/images/search/apples_small.png',
                              height: 86,
                              width: 86,
                              fit: BoxFit.cover,
                            ),
                            Positioned(
                              top: 25,
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
                                      )),
                                ),
                              ),
                            )
                          ],
                        ),
                        title: const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Драконий фрукт',
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w500),
                            ),
                            Text(
                              'цена 340 с за шт',
                              style: TextStyle(
                                  color: AppColors.grey,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        subtitle: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              '56 с',
                              style: TextStyle(
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
                                    setState(
                                      () {
                                        added.decrementCounter();
                                      },
                                    );
                                  },
                                ),
                                const SizedBox(
                                  width: 24,
                                ),
                                Text(
                                  added.getCounter().toString(),
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
                                        added.incrementCounter();
                                      },
                                    );
                                  },
                                )
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (context, index) => const SizedBox(
                          height: 10,
                        ),
                    itemCount: 15),
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
      ),
    );
