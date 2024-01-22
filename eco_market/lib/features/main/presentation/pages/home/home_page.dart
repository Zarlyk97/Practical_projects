import 'package:auto_route/auto_route.dart';
import 'package:eco_market/config/config.dart';
import 'package:eco_market/features/main/domain/entities/category_entity.dart';
import 'package:eco_market/features/main/presentation/cubit/main_screen_cubit.dart';
import 'package:eco_market/features/search/presentation/pages/search/search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<CategoryEntity> data = [];
  List<String> fruits = [];
  @override
  void initState() {
    super.initState();
    context.read<MainScreenCubit>().getCategory();
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
      body: BlocBuilder<MainScreenCubit, MainScreenState>(
        builder: (context, state) {
          if (state is MainScreenLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is MainScreenLoaded) {
            data = state.category;
            for (var item in data) {
              fruits.add(item.name!);
            }
          }
          return Padding(
            padding: const EdgeInsets.only(
              top: 16,
              left: 16,
              right: 16,
            ),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisExtent: 190,
                crossAxisCount: 2,
                mainAxisSpacing: 11.0,
                crossAxisSpacing: 11.0,
              ),
              itemCount: data.length,
              itemBuilder: (context, index) {
                String svgPath = data[index].image.toString();
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SeachScreen(
                          id: index + 1,
                          fruits: fruits,
                        ),
                      ),
                    );
                  },
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      image: DecorationImage(
                        image: NetworkImage(svgPath),
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
                              colors: [
                                Colors.black.withOpacity(0),
                                Colors.black
                              ],
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
                                data[index].name.toString(),
                                style: const TextStyle(
                                    height: 0,
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
          );
        },
      ),
    );
  }
}
