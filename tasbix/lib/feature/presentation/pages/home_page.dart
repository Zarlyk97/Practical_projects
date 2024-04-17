import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tasbix/bloc/theme_cubit/theme_cubit.dart';
import 'package:tasbix/feature/domain/model/model.dart';
import 'package:tasbix/feature/presentation/cubit/tasbix_cubit.dart';
import 'package:tasbix/feature/presentation/pages/pages.dart';
import 'package:tasbix/generated/l10n.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> zikri = [];

  int _counter = 0;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    loadCountersFromCache();
  }

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final isdarkTheme = context.watch<ThemeCubit>().state.isdark;

    return Scaffold(
      backgroundColor: isdarkTheme ? const Color(0xFFFFFFFF) : Colors.white,
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
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: 90,
                      width: double.infinity,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20)),
                          color: isdarkTheme
                              ? Colors.black87
                              : Colors.grey.shade200,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              tasbihList[_currentIndex].arabic,
                              style: TextStyle(
                                  color:
                                      isdarkTheme ? Colors.white : Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600),
                            ),
                            Text(
                              tasbihList[_currentIndex].cyrillic,
                              style: TextStyle(
                                  color:
                                      isdarkTheme ? Colors.white : Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600),
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 60,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                _changeTasbihCard(index);
                              },
                              child: Container(
                                  height: 70,
                                  width: 100,
                                  margin:
                                      const EdgeInsets.symmetric(horizontal: 8),
                                  decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(20)),
                                      color: isdarkTheme
                                          ? Colors.black87
                                          : _currentIndex == index
                                              ? Colors.blue
                                              : Colors.grey.shade200),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        tasbihList[index].arabic,
                                      ),
                                      Text(
                                        tasbihList[index].count.toString(),
                                      ),
                                    ],
                                  )),
                            );
                          },
                          itemCount: tasbihList.length),
                    ),
                  ],
                ),
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
                              Text('$_counter ',
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
                      left: 240,
                      top: 130,
                      child: SizedBox(
                        height: 30,
                        width: 30,
                        child: FloatingActionButton(
                          heroTag: 'reset_button',
                          backgroundColor: Colors.white,
                          shape: const CircleBorder(),
                          onPressed: () {
                            _resetTasbihCounters();
                          },
                        ),
                      ),
                    ),
                    Positioned(
                      left: 142,
                      top: 159,
                      child: SizedBox(
                        height: 95,
                        width: 95,
                        child: FloatingActionButton(
                            heroTag: 'increment_button',
                            backgroundColor: Colors.white,
                            shape: const CircleBorder(),
                            onPressed: () {
                              _incrementCounter();
                            }),
                      ),
                    ),
                  ],
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
                      onPressed: () {
                        saveCountersToCache();
                      },
                      child: Text(
                        S.of(context).save,
                        style: TextStyle(
                          color: isdarkTheme ? Colors.white : Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          );
        },
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/image.png'),
                      fit: BoxFit.fitHeight),
                ),
                child: SizedBox()),
            ListView.separated(
              scrollDirection: Axis.vertical,
              itemBuilder: (BuildContext context, int index) {
                final AboutZikrModel model = aboutZikr[index];
                return ListTile(
                  title: Text(getDhikrsList()[index]),
                  selected: _selectedIndex == index,
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AboutZikrPage(
                                  name: model.name,
                                  description: model.description,
                                )));
                    _onItemTapped(index);
                  },
                  trailing: const Icon(Icons.navigate_next),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(height: 5);
              },
              itemCount: 6,
              shrinkWrap: true,
            ),
          ],
        ),
      ),
    );
  }

  _incrementCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('count', _counter);
    setState(() {
      _counter++;
      tasbihList[_currentIndex].count = _counter;
    });
  }

  _changeTasbihCard(int index) {
    setState(() {
      _currentIndex = index;
      _counter = tasbihList[index].count;
    });
  }

  _resetTasbihCounters() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      for (var tasbih in tasbihList) {
        tasbih.count = 0;
        prefs.remove(tasbih.arabic);
      }
    });
    await saveCountersToCache();
  }

  Future<void> loadCountersFromCache() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _counter = prefs.getInt('count') ?? 0;
    for (var tasbih in tasbihList) {
      setState(() {
        tasbih.count = prefs.getInt(tasbih.arabic) ?? 0;
      });
    }
  }

  Future<void> saveCountersToCache() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    for (var tasbih in tasbihList) {
      prefs.setInt(tasbih.arabic, tasbih.count);
    }
  }

  List<String> getDhikrsList() {
    return [
      S.of(context).generalDhikrs,
      S.of(context).eveningDhikrs,
      S.of(context).morningDhikrs,
      S.of(context).selectedDhikrs,
      S.of(context).salavat,
      S.of(context).istighfar
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
