import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasbix/features/tasbix/presentation/cubit/tasbix_cubit.dart';
import 'package:tasbix/features/tasbix/presentation/pages/pages.dart';
import 'package:tasbix/ui/ui.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      appBar: AppBar(
        backgroundColor: Colors.grey.shade200,
        title: Text('Тасбих',
            style: themeData.textTheme.headlineSmall!.copyWith(
              fontSize: (25),
              fontWeight: FontWeight.bold,
            )),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SettingPage(),
                  ),
                );
              },
              icon: const Icon(Icons.settings))
        ],
      ),
      body: BlocBuilder<TasbixCubit, TasbixState>(
        builder: (context, state) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                children: [
                  Center(
                    child: Image.asset(
                      'assets/Tasbix.png',
                    ),
                  ),
                  Positioned(
                    top: 47,
                    left: 126,
                    child: SizedBox(
                      height: 68,
                      width: 143,
                      child: DecoratedBox(
                        decoration: const BoxDecoration(color: Colors.white),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '${state.count} ',
                              style: themeData.textTheme.titleMedium!.copyWith(
                                fontSize: 25,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 245,
                    top: 130,
                    child: SizedBox(
                      height: 30,
                      width: 30,
                      child: FloatingActionButton(
                        heroTag: 'reset_button', // уникалдуу белги

                        backgroundColor: Colors.white,
                        shape: const CircleBorder(),
                        onPressed: () {
                          final cubit = context.read<TasbixCubit>();
                          cubit.reset();
                        },
                      ),
                    ),
                  ),
                  Positioned(
                    left: 151,
                    top: 159,
                    child: SizedBox(
                      height: 95,
                      width: 95,
                      child: FloatingActionButton(
                        heroTag: 'increment_button', // уникалдуу белги

                        backgroundColor: Colors.white,
                        shape: const CircleBorder(),
                        onPressed: () {
                          final cubit = context.read<TasbixCubit>();
                          cubit.increment();
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
