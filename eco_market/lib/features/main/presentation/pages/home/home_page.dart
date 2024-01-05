import 'package:auto_route/auto_route.dart';
import 'package:eco_market/config/config.dart';
import 'package:eco_market/config/router/router.dart';
import 'package:eco_market/features/main/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<GridMenuItem> gridMenuItem = [];

  @override
  void initState() {
    super.initState();
    gridMenuItem = [
      GridMenuItem(
          title: 'Фрукты',
          image: 'assets/images/home/fruits.png',
          onTap: () => context.pushRoute(const SeachRoute())),
      GridMenuItem(
          title: 'Сухофрукты',
          image: 'assets/images/home/dried_fruits.png',
          onTap: () {}),
      GridMenuItem(
          title: 'Овощи',
          image: 'assets/images/home/vegetables.png',
          onTap: () {}),
      GridMenuItem(
          title: 'Зелень',
          image: 'assets/images/home/greenery.png',
          onTap: () {}),
      GridMenuItem(
          title: 'Чай кофе',
          image: 'assets/images/home/tea_coffee.png',
          onTap: () {}),
      GridMenuItem(
        title: 'Молочные продукты',
        image: 'assets/images/home/dairy.png',
        onTap: () {},
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Эко Маркет',
          style: TextStyle(
            // fontFamily: 'Anton-Regular',
            color: Color.fromARGB(255, 4, 2, 2),
            fontSize: 24,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 18,
          left: 16,
          right: 16,
        ),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisExtent: 185,
            crossAxisCount: 2,
            mainAxisSpacing: 11.0,
            crossAxisSpacing: 11.0,
          ),
          itemCount: gridMenuItem.length,
          itemBuilder: (context, index) {
            String svgPath = gridMenuItem[index].image;
            return GestureDetector(
              onTap: gridMenuItem[index].onTap,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  image: DecorationImage(
                    image: AssetImage(svgPath),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Stack(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: double.infinity,
                      child: DecoratedBox(
                          decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        gradient: LinearGradient(
                          begin: const Alignment(0.00, -1.00),
                          end: const Alignment(0, 1.8),
                          colors: [Colors.black.withOpacity(0), Colors.black],
                        ),
                      )),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            gridMenuItem[index].title,
                            style: const TextStyle(
                                color: AppColors.white,
                                fontSize: 23,
                                fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
