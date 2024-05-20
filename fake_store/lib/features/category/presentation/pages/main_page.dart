import 'package:auto_route/auto_route.dart';
import 'package:fakestore/features/cart/presentation/pages/cart_screen.dart';
import 'package:fakestore/features/category/presentation/pages/categories_page.dart';
import 'package:fakestore/features/profile/presentation/pages/profile.dart';
import 'package:flutter/material.dart';

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
            setState(() => _currentIndex = value);
          },
          children: const [
            CategoriesPage(),
            CartPage(),
            ProfilePage(),
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
          selectedItemColor: Colors.blue,
          items: [
            BottomNavigationBarItem(
              label: "Главная",
              icon: Icon(
                Icons.home,

                // ignore: deprecated_member_use
                color: _currentIndex == 0 ? Colors.blue : Colors.grey,
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.shopping_cart,
                color: _currentIndex == 1 ? Colors.blue : Colors.grey,
              ),
              label: "Корзина",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person,

                // ignore: deprecated_member_use
                color: _currentIndex == 2 ? Colors.blue : Colors.grey,
              ),
              label: "Профиль",
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
