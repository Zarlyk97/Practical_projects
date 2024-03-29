import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasbix/bloc/theme_cubit/theme_cubit.dart';
import 'package:tasbix/feature/tasbix/presentation/cubit/tasbix_cubit.dart';
import 'package:tasbix/feature/tasbix/presentation/pages/pages.dart';
import 'package:tasbix/generated/l10n.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final isdarkTheme = context.watch<ThemeCubit>().state.isdark;

    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      appBar: AppBar(
        title: Text(S.of(context).Tasbih,
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  fontSize: (22),
                  fontWeight: FontWeight.w600,
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
        elevation: 1,
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
                            Text('${state.count} ',
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 25,
                                    fontWeight: FontWeight.w600)),
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
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: isdarkTheme
                            ? MaterialStateProperty.all(Colors.black)
                            : MaterialStateProperty.all(Colors.white)),
                    onPressed: () {},
                    child: Text(
                      S.of(context).restore,
                      style: TextStyle(
                        color: isdarkTheme ? Colors.white : Colors.black,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      S.of(context).save,
                      style: TextStyle(
                        color: isdarkTheme ? Colors.white : Colors.black,
                      ),
                    ),
                  ),
                ],
              )
            ],
          );
        },
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/image.png'),
                ),
              ),
              child: Text(''),
            ),
            ListTile(
              title: Text(S.of(context).generalDhikrs),
              selected: _selectedIndex == 0,
              onTap: () {
                _onItemTapped(0);
              },
              trailing: const Icon(Icons.navigate_next),
            ),
            ListTile(
              title: Text(S.of(context).eveningDhikrs),
              selected: _selectedIndex == 1,
              onTap: () {
                _onItemTapped(1);
              },
              trailing: const Icon(Icons.navigate_next),
            ),
            ListTile(
              title: Text(S.of(context).morningDhikrs),
              selected: _selectedIndex == 2,
              onTap: () {
                _onItemTapped(2);
              },
              trailing: const Icon(Icons.navigate_next),
            ),
            ListTile(
              title: Text(S.of(context).selectedDhikrs),
              selected: _selectedIndex == 3,
              onTap: () {
                _onItemTapped(3);
              },
              trailing: const Icon(Icons.navigate_next),
            ),
            ListTile(
              title: Text(S.of(context).salavat),
              selected: _selectedIndex == 4,
              onTap: () {
                _onItemTapped(4);
              },
              trailing: const Icon(Icons.navigate_next),
            ),
            ListTile(
              title: Text(S.of(context).istighfar),
              selected: _selectedIndex == 5,
              onTap: () {
                _onItemTapped(5);
              },
              trailing: const Icon(Icons.navigate_next),
            ),
          ],
        ),
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
