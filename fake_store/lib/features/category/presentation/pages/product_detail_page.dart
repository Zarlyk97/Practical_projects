import 'package:auto_route/auto_route.dart';
import 'package:fakestore/features/category/domain/models/product_model.dart';
import 'package:fakestore/features/category/presentation/cubit/category_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class DetailScreen extends StatefulWidget {
  final int id;
  const DetailScreen({super.key, required this.id});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  ProductModel? products;
  @override
  void initState() {
    context.read<CategoryCubit>().getProductById(widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Детали'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocBuilder<CategoryCubit, CategoryState>(
          builder: (context, state) {
            if (state is GetProductByIdLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is GetProductByIdError) {
              return Text('Ката чыкты ${state.message}');
            } else if (state is GetProductByIdLoaded) {
              products = state.product;
            }
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      products!.image.toString(),
                      height: 208,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Text(
                    products!.title.toString(),
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    '\$ ${products!.price}',
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
                    products!.description.toString(),
                    style: const TextStyle(
                      color: Color(0xFFABABAD),
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        minimumSize: const Size(double.infinity, 50),
                      ),
                      onPressed: () {
                        setState(
                          () {},
                        );
                      },
                      child: const Text(
                        'Добавить в корзину',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
