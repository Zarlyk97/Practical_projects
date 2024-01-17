import 'package:auto_route/auto_route.dart';
import 'package:eco_market/config/config.dart';
import 'package:eco_market/features/search/presentation/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// Flutter code sample for pinned [SearchAnchor] while scrolling.
@RoutePage()
class PinnedSearchBarAppPage extends StatefulWidget {
  const PinnedSearchBarAppPage({super.key});

  @override
  State<PinnedSearchBarAppPage> createState() => _PinnedSearchBarAppPageState();
}

class _PinnedSearchBarAppPageState extends State<PinnedSearchBarAppPage> {
  List<FruitsName> fruits = List.generate(7, (index) => FruitsName());
  int _currentIndex = 0;
  late TextEditingController textController;

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: AppColors.black),
        title: const Text(
          'Продукты',
          style: TextStyle(color: AppColors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(right: 16, left: 16),
        child: Column(
          children: [
            CupertinoSearchTextField(
              padding: const EdgeInsets.symmetric(vertical: 13),
              suffixInsets:
                  const EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
              prefixInsets:
                  const EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
              backgroundColor: const Color(0xffF8F8F8),
              borderRadius: BorderRadius.circular(16),
              controller: textController,
              placeholder: 'Быстрый поиск',
              placeholderStyle: const TextStyle(color: AppColors.grey),
              prefixIcon: const Icon(
                CupertinoIcons.search,
                color: AppColors.grey,
              ),
              suffixIcon: const Icon(
                CupertinoIcons.xmark_circle,
                color: AppColors.grey,
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
          ],
        ),
      ),
    );
  }

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
