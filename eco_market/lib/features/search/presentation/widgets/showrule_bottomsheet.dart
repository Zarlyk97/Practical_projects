import 'package:eco_market/config/theme/app_colors.dart';
import 'package:eco_market/features/main/presentation/widgets/custom_button_widget.dart';
import 'package:eco_market/features/main/presentation/widgets/icon_button_widget.dart';
import 'package:eco_market/features/main/presentation/widgets/item_class.dart';
import 'package:flutter/material.dart';
//////////////////  Добавить товар

showRule(BuildContext context, Item item, bool isAdded) =>
    showModalBottomSheet<void>(
      isScrollControlled: true,
      context: context,
      // showDragHandle: true,
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
          child: Wrap(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    'assets/images/search/orange2.png',
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  const Text(
                    'Апельсины сладкий пакистанский',
                    style: TextStyle(
                      color: AppColors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const Text(
                    '56 c шт',
                    style: TextStyle(
                      color: Color(0xFF75DB1B),
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const Text(
                    'Cочный плод яблони, который употребляется в пищу в свежем и запеченном виде, служит сырьём в кулинарии и для приготовления напитков.',
                    style: TextStyle(
                      color: Color(0xFFABABAD),
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 24),
                  isAdded
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              '112 с',
                              style: TextStyle(
                                color: Color(0xFF1E1E1E),
                                fontSize: 24,
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
                                        item.decrementCounter();
                                      },
                                    );
                                  },
                                ),
                                const SizedBox(
                                  width: 44,
                                ),
                                Text(
                                  item.getCounter().toString(),
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const SizedBox(
                                  width: 44,
                                ),
                                IconButtonWidget(
                                    icon: Icons.add,
                                    onTap: () {
                                      setState(() {
                                        item.incrementCounter();
                                      });
                                    })
                              ],
                            ),
                          ],
                        )
                      : CustomButtomWidget(
                          text: 'Добавить',
                          onPressed: () {
                            setState(
                              () {
                                isAdded = true;
                              },
                            );
                          },
                          height: 54,
                        ),
                  const SizedBox(
                    height: 24,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
