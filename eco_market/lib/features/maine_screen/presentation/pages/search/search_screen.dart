import 'package:auto_route/auto_route.dart';
import 'package:eco_market/config/config.dart';
import 'package:flutter/material.dart';

@RoutePage()
class SeachScreen extends StatefulWidget {
  const SeachScreen({super.key});

  @override
  State<SeachScreen> createState() => _SeachScreenState();
}

class _SeachScreenState extends State<SeachScreen> {
  List<String> fruitsNames = [
    'Все',
    'Фрукты',
    'Сухофрукты',
    'Овощи',
    'Зелень',
    'Чай кофе',
    'Молочные продукты',
  ];
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
        padding: const EdgeInsets.only(top: 12, left: 16, right: 16),
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
                  hintStyle: const TextStyle(color: Color(0xffD2D1D5)),
                  prefixIcon:
                      const Icon(Icons.search, color: Color(0xffD2D1D5)),
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
                    itemBuilder: (context, index) => GestureDetector(
                          onTap: () {},
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: AppColors.white,
                                border:
                                    Border.all(color: const Color(0xffD2D1D5))),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
                              child: Text(
                                fruitsNames[index],
                                style: const TextStyle(
                                  color: Color(0xffD2D1D5),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ),
                    separatorBuilder: (context, index) =>
                        const SizedBox(width: 8),
                    itemCount: fruitsNames.length),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
