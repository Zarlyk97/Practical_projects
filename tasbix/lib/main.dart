import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:tasbix/bloc/cubit/theme_cubit.dart';
import 'package:tasbix/feature/tasbix/domain/repositories/repositories.dart';
import 'package:tasbix/feature/tasbix/presentation/cubit/tasbix_cubit.dart';
import 'package:tasbix/core/ui/ui.dart';

import 'feature/tasbix/presentation/pages/pages.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  runApp(MyApp(
    preferences: prefs,
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({
    super.key,
    required this.preferences,
  });
  final SharedPreferences preferences;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    final SettingRepository settingRepository = SettingRepository(
      preferences: widget.preferences,
    );
    final CountRepository countRepository = CountRepository(
      preferences: widget.preferences,
    );
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => TasbixCubit(countRepository: countRepository),
        ),
        BlocProvider(
          create: (context) => ThemeCubit(settingRepository: settingRepository),
        ),
      ],
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: state.isdark ? darkTheme : lightTheme,
            home: const HomePage(),
          );
        },
      ),
    );
  }
}
