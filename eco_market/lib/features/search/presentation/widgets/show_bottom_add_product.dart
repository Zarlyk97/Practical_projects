import 'package:eco_market/config/theme/app_colors.dart';
import 'package:eco_market/features/main/presentation/widgets/custom_button_widget.dart';
import 'package:eco_market/features/main/presentation/widgets/icon_button_widget.dart';
import 'package:eco_market/features/main/presentation/widgets/item_class.dart';
import 'package:eco_market/features/search/domain/entities/products_entity.dart';

import 'package:flutter/material.dart';

showBottomAddProduct(
    BuildContext context, bool isAdded, Items item, ProductEntity product) {
  showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    showDragHandle: true,
    backgroundColor: Colors.white,
    constraints: BoxConstraints(
      maxHeight: MediaQuery.of(context).size.height - 150,
      minHeight: MediaQuery.of(context).size.height - 200,
    ),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
    ),
    builder: (BuildContext context) => StatefulBuilder(
      builder: (context, StateSetter setState) => Padding(
        padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  '${product.image}',
                  height: 208,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Text(
                '${product.title}',
                style: const TextStyle(
                  color: AppColors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                '${product.price}',
                style: const TextStyle(
                  color: Color(0xFF75DB1B),
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                '${product.description}',
                style: const TextStyle(
                  color: Color(0xFFABABAD),
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 24),
              isAdded
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${product.price}',
                          style: const TextStyle(
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
                              item.counter.toString(),
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
        ),
      ),
    ),
  );
}
