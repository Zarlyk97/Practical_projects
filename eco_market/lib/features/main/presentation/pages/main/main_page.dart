import 'package:auto_route/auto_route.dart';
import 'package:eco_market/config/theme/app_colors.dart';
import 'package:eco_market/features/about/presentation/pages/about/about.dart';
import 'package:eco_market/features/cart/presentation/pages/pages.dart';
import 'package:eco_market/features/history/presentation/pages/history/history_page.dart';
import 'package:eco_market/features/main/presentation/cubit/main_screen_cubit.dart';
import 'package:eco_market/features/main/presentation/pages/home/home.dart';
import 'package:eco_market/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:svg_flutter/svg_flutter.dart';

@RoutePage()
class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;
  PageController pageController = PageController();

  @override
  void initState() {
    super.initState();
    pageController = PageController(
      initialPage: _currentIndex,
      keepPage: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiBlocProvider(
        providers: [BlocProvider(create: (_) => sl<MainScreenCubit>())],
        child: SafeArea(
          child: PageView(
            controller: pageController,
            physics: const NeverScrollableScrollPhysics(),
            onPageChanged: (value) {
              _currentIndex = value;
              setState(() {});
            },
            children: const [
              HomePage(),
              CartPage(),
              HistoryPage(),
              AboutPage(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: _onTabTapped,
          type: BottomNavigationBarType.fixed,
          selectedLabelStyle: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w400,
            height: 1.6,
          ),
          unselectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 13,
            height: 1.6,
          ),
          selectedItemColor: AppColors.green,
          items: [
            BottomNavigationBarItem(
              label: "Главная",
              icon: SvgPicture.asset(
                "assets/svg/main/home.svg",
                width: 28,
                height: 28,
                // ignore: deprecated_member_use
                color: _currentIndex == 0 ? AppColors.green : Colors.grey,
              ),
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "assets/svg/main/bag.svg",
                width: 28,
                height: 28,
                // ignore: deprecated_member_use
                color: _currentIndex == 1 ? AppColors.green : Colors.grey,
              ),
              label: "Корзина",
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "assets/svg/main/clock.svg",
                width: 28,
                height: 28,

                // ignore: deprecated_member_use
                color: _currentIndex == 2 ? AppColors.green : Colors.grey,
              ),
              label: "История",
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "assets/svg/main/info.svg",
                width: 28,
                height: 28,
                // ignore: deprecated_member_use
                color: _currentIndex == 3 ? AppColors.green : Colors.grey,
              ),
              label: "Инфо",
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
    pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 10),
      curve: Curves.bounceIn,
    );
  }
}
