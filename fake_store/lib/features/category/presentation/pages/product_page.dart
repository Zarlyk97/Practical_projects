import 'package:auto_route/auto_route.dart';
import 'package:fakestore/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:fakestore/features/cart/presentation/pages/cart_screen.dart';
import 'package:fakestore/features/category/domain/models/product_model.dart';
import 'package:fakestore/features/category/presentation/cubit/category_cubit.dart';
import 'package:fakestore/features/category/presentation/pages/product_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class ProductPage extends StatefulWidget {
  final String category;
  const ProductPage({
    super.key,
    required this.category,
  });

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  bool isAdded = false;
  List<ProductModel> products = [];
  @override
  void initState() {
    context.read<CategoryCubit>().getProductsByCategory(widget.category);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        title: Text(
          widget.category,
          style: const TextStyle(
              fontWeight: FontWeight.w500, fontSize: 18, color: Colors.black),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return const CartPage();
                  },
                ),
              );
            },
            icon: const Icon(
              Icons.shopping_cart,
              color: Colors.green,
            ),
          )
        ],
      ),
      body: Padding(
        padding:
            const EdgeInsets.only(top: 12, left: 16, right: 16, bottom: 16),
        child: BlocBuilder<CategoryCubit, CategoryState>(
          builder: (context, state) {
            if (state is GetProductsByCategoryLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is GetProductsByCategoryError) {
              return Text('Ката чыкты ${state.message}');
            } else if (state is GetProductsByCategoryLoaded) {
              products = state.products;
            }

            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisExtent: 325,
                crossAxisCount: 2,
                mainAxisSpacing: 11.0,
                crossAxisSpacing: 11.0,
              ),
              itemCount: products.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                DetailScreen(id: products[index].id!)));
                  },
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.network(
                              products[index].image.toString(),
                              fit: BoxFit.cover,
                              height: 96,
                              width: 158,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            products[index].title.toString(),
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const Spacer(),
                          Text(
                            "\$ ${products[index].price}",
                            style: const TextStyle(
                              color: Colors.green,
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          BlocListener<CartCubit, CartState>(
                            listener: (context, state) {
                              if (state is CartLoaded) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text("Продукт корзинага кошулду!"),
                                    backgroundColor: Colors.green,
                                    duration: Duration(seconds: 2),
                                  ),
                                );
                                setState(() {
                                  isAdded = true;
                                });
                              } else if (state is CartError) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content:
                                        Text("Ката чыкты: ${state.message}"),
                                    backgroundColor: Colors.red,
                                    duration: const Duration(seconds: 2),
                                  ),
                                );
                              }
                            },
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                fixedSize: const Size(300, 40),
                                backgroundColor: Colors.green,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                              child: isAdded == false
                                  ? const Text(
                                      'В корзину',
                                      style: TextStyle(color: Colors.white),
                                    )
                                  : const Text(' В  Корзине'),
                              onPressed: () {
                                context
                                    .read<CartCubit>()
                                    .addToCart(index, products[index]);
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
