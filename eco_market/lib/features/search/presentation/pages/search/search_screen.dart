import 'package:auto_route/auto_route.dart';
import 'package:eco_market/features/search/presentation/widgets/show_bottom_add_product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:svg_flutter/svg_flutter.dart';
import 'package:eco_market/config/config.dart';
import 'package:eco_market/features/cart/presentation/widgets/widgets.dart';
import 'package:eco_market/features/main/presentation/widgets/widgets.dart';
import 'package:eco_market/features/search/domain/entities/products_entity.dart';
import 'package:eco_market/features/search/presentation/cubit/search_screen_cubit.dart';

@RoutePage()
class SeachScreen extends StatefulWidget {
  final int id;
  final List<String> fruits;
  const SeachScreen({super.key, required this.id, required this.fruits});

  @override
  State<SeachScreen> createState() => _SeachScreenState();
}

class _SeachScreenState extends State<SeachScreen> {
  List<Item> items = List.generate(10, (index) => Item());
  List<String> fruits = [];
  bool isAdded = false;

  int _currentIndex = 0;

  @override
  void initState() {
    _currentIndex = widget.id;
    fruits = ['Все', ...widget.fruits];
    context
        .read<SearchScreenCubit>()
        .getProducts(productType: fruits[_currentIndex]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: AppColors.black),
          title: const Text(
            'Продукты',
            style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 18,
                color: AppColors.black),
          ),
        ),
        body: Padding(
          padding:
              const EdgeInsets.only(top: 12, left: 16, right: 16, bottom: 16),
          child: SafeArea(
            child: Column(
              children: [
                ///////// Поиск товаров
                TextFormField(
                  onChanged: (value) {
                    if (_currentIndex != 0) {
                      context.read<SearchScreenCubit>().getProducts(
                          search: value, productType: fruits[_currentIndex]);
                    } else {
                      context
                          .read<SearchScreenCubit>()
                          .getProducts(search: value);
                    }
                  },
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(10),
                    constraints: const BoxConstraints(
                      maxHeight: 46,
                    ),
                    filled: true,
                    fillColor: const Color(0xffF8F8F8),
                    hintText: 'Быстрый поиск',
                    hintStyle: const TextStyle(color: AppColors.grey),
                    prefixIcon: const Icon(Icons.search, color: AppColors.grey),
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(16)),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                SizedBox(
                  height: 38,

                  ////////  Выбрать ассортимент
                  child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            _onTabTapped(index);
                            if (index == 0) {
                              context.read<SearchScreenCubit>().getProducts();
                            } else {
                              context
                                  .read<SearchScreenCubit>()
                                  .getProducts(productType: fruits[index]);
                            }
                          },
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: _currentIndex == index
                                    ? AppColors.green
                                    : AppColors.white,
                                border: Border.all(
                                    color: _currentIndex == index
                                        ? AppColors.white
                                        : AppColors.grey)),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
                              child: Text(
                                fruits[index],
                                style: TextStyle(
                                  color: _currentIndex == index
                                      ? AppColors.white
                                      : AppColors.grey,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) =>
                          const SizedBox(width: 8),
                      itemCount: fruits.length),
                ),
                const SizedBox(
                  height: 20,
                ),

                ///////////  Выбрать товар
                BlocBuilder<SearchScreenCubit, SearchScreenState>(
                  builder: (context, state) {
                    List<ProductEntity> data = [];
                    if (state is SearchScreenLoading) {
                      return const Expanded(
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    } else if (state is SearchScreenLoaded) {
                      data = state.products;
                    }

                    return data.isEmpty
                        ? Column(
                            children: [
                              SvgPicture.asset('assets/svg/cart/emptyBag.svg'),
                              const Text("Ничего не нашли"),
                            ],
                          )
                        : Expanded(
                            child: GridView.builder(
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                mainAxisExtent: 230,
                                crossAxisCount: 2,
                                mainAxisSpacing: 11.0,
                                crossAxisSpacing: 11.0,
                              ),
                              itemCount: data.length,
                              itemBuilder: (context, index) {
                                String image = data[index].image.toString();

                                return GestureDetector(
                                  onTap: () {},
                                  child: DecoratedBox(
                                    decoration: BoxDecoration(
                                      color: const Color(0xffF8F8F8),
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(6.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                            child: Image.network(
                                              image,
                                              fit: BoxFit.cover,
                                              height: 96,
                                              width: 158,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 4,
                                          ),
                                          Text(
                                            data[index].title.toString(),
                                            style: const TextStyle(
                                              color: AppColors.black,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          Text(
                                            '${data[index].price} с',
                                            style: const TextStyle(
                                              color: AppColors.green,
                                              fontSize: 20,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 14,
                                          ),
                                          CustomButtomWidget(
                                            height: 32,
                                            text: 'Добавить',
                                            onPressed: () {
                                              showBottomAddProduct(context,
                                                  isAdded, Item(), data[index]);
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          );
                  },
                ),
              ],
            ),
          ),
        ),
///////////////////////    Карзина

        floatingActionButton: GestureDetector(
          onTap: () => showRuleCart(
            context,
            Item(),
          ),
          child: SizedBox(
            width: 168,
            height: 48,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: AppColors.green,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SvgPicture.asset(
                      'assets/svg/main/bag.svg',
                      // ignore: deprecated_member_use
                      color: AppColors.white,
                    ),
                    const Text(
                      'Корзина 396 с',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
