import 'package:auto_route/auto_route.dart';
import 'package:eco_market/config/config.dart';
import 'package:eco_market/features/maine_screen/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

@RoutePage()
class SeachScreen extends StatefulWidget {
  const SeachScreen({super.key});

  @override
  State<SeachScreen> createState() => _SeachScreenState();
}

class _SeachScreenState extends State<SeachScreen> {
  List<Item> items = List.generate(8, (index) => Item());
  List<FruitsName> fruits = List.generate(7, (index) => FruitsName());

  int _currentIndex = 0;

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
              TextFormField(
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
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      FruitsName fruit = fruits[index];
                      return GestureDetector(
                        onTap: () => _onTabTapped(index),
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
                              fruit.fruitsName[index],
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
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisExtent: 248,
                    crossAxisCount: 2,
                    mainAxisSpacing: 11.0,
                    crossAxisSpacing: 11.0,
                  ),
                  itemCount: 8,
                  itemBuilder: (context, index) {
                    Item item = items[index];
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(
                                child: Image.asset(
                                  index % 2 == 0
                                      ? 'assets/images/search/apples.png'
                                      : 'assets/images/search/orange.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              Text(
                                index % 2 == 0
                                    ? 'Яблоко красная радуга сладкая'
                                    : 'Апельсины сладкий пакистанский',
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
                                index % 2 == 0 ? '56 с' : '86 с',
                                style: const TextStyle(
                                  color: AppColors.green,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              const SizedBox(
                                height: 14,
                              ),
                              index % 2 == 0
                                  ? Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        IconButtonWidget(
                                            icon: Icons.remove,
                                            onTap: () {
                                              setState(() {
                                                item.decrementCounter();
                                              });
                                            }),
                                        Text(
                                          item.getCounter().toString(),
                                          style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        IconButtonWidget(
                                            icon: Icons.add,
                                            onTap: () {
                                              setState(() {
                                                item.incrementCounter();
                                              });
                                            })
                                      ],
                                    )
                                  : CustomButtomWidget(
                                      height: 32,
                                      text: 'Добавить',
                                      onPressed: () => showRule(context),
                                    ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  showRule(BuildContext context) => showModalBottomSheet<void>(
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
        builder: (BuildContext context) => Padding(
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
                  text(
                    'Cочный плод яблони, который употребляется в пищу в свежем и запеченном виде, служит сырьём в кулинарии и для приготовления напитков.',
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  CustomButtomWidget(
                    text: 'Добавить',
                    onPressed: () {},
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
      );

  Widget text(
    String text,
  ) {
    return Text(
      text,
      style: const TextStyle(
        color: Color(0xFFABABAD),
        fontSize: 16,
      ),
    );
  }
}
