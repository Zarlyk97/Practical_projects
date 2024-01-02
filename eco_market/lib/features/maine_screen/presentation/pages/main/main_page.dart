import 'package:auto_route/auto_route.dart';
import 'package:eco_market/config/theme/app_colors.dart';
import 'package:eco_market/features/maine_screen/presentation/pages/home/home.dart';
import 'package:flutter/material.dart';
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
      body: SafeArea(
        child: PageView(
          controller: pageController,
          physics: const NeverScrollableScrollPhysics(),
          onPageChanged: (value) {
            _currentIndex = value;
            setState(() {});
          },
          children: const [
            HomePage(),
            Scaffold(),
            Scaffold(),
            Scaffold(),
          ],
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
                color: _currentIndex == 0 ? AppColors.green : Colors.grey,
              ),
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "assets/svg/main/bag.svg",
                width: 28,
                height: 28,
                color: _currentIndex == 1 ? AppColors.green : Colors.grey,
              ),
              label: "Корзина",
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "assets/svg/main/clock.svg",
                width: 28,
                height: 28,
                color: _currentIndex == 2 ? AppColors.green : Colors.grey,
              ),
              label: "История",
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "assets/svg/main/info.svg",
                width: 28,
                height: 28,
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
