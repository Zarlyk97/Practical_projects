import 'package:fakestore/features/cart/presentation/pages/cart_screen.dart';
import 'package:fakestore/features/category/domain/models/product_model.dart';
import 'package:fakestore/features/category/presentation/cubit/category_cubit.dart';
import 'package:fakestore/features/category/presentation/pages/product_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryPage extends StatefulWidget {
  final String category;
  const CategoryPage({
    super.key,
    required this.category,
  });

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
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
        title: const Text(
          'Товар',
          style: TextStyle(
              fontWeight: FontWeight.w500, fontSize: 18, color: Colors.black),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return const CartPage();
              }));
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
                mainAxisExtent: 330,
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
                      color: const Color(0xffF8F8F8),
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
                            height: 4,
                          ),
                          Text(
                            products[index].title.toString(),
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            "\$ ${products[index].price}",
                            style: const TextStyle(
                              color: Colors.green,
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const Spacer(),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                              child: const Text(
                                'В корзину',
                                style: TextStyle(color: Colors.white),
                              ),
                              onPressed: () {})
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
