import 'package:eco_market/config/theme/app_colors.dart';
import 'package:eco_market/features/cart/presentation/cubit/cart_screen_cubit.dart';
import 'package:eco_market/features/main/presentation/widgets/custom_button_widget.dart';
import 'package:eco_market/features/search/data/models/product_model.dart';
import 'package:eco_market/features/search/domain/entities/products_entity.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

showBottomAddProduct(BuildContext context, ProductEntity product) {
  showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    showDragHandle: true,
    backgroundColor: Colors.white,
    constraints: BoxConstraints(
      maxHeight: MediaQuery.of(context).size.height - 100,
      minHeight: MediaQuery.of(context).size.height - 300,
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
              CustomButtonWidget(
                text: 'Добавить',
                onPressed: () {
                  setState(
                    () {
                      context.read<CartScreenCubit>().addToCart(
                            ProductModel.fromEntity(
                              product,
                            ),
                          );
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
