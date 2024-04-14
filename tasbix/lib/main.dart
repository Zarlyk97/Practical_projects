import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:tasbix/bloc/theme_cubit/theme_cubit.dart';
import 'package:tasbix/feature/tasbix/domain/repositories/repositories.dart';
import 'package:tasbix/feature/tasbix/presentation/cubit/tasbix_cubit.dart';
import 'package:tasbix/core/ui/ui.dart';
import 'package:tasbix/feature/tasbix/presentation/pages/splash_screen.dart';
import 'package:tasbix/generated/l10n.dart';

import 'bloc/language_cubit/language_cubit.dart';

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
        BlocProvider(
          create: (context) => LanguageCubit()..getsavedLanguageCode(),
        )
      ],
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, themeState) {
          return BlocBuilder<LanguageCubit, LanguageState>(
            builder: (context, state) {
              return MaterialApp(
                localizationsDelegates: const [
                  S.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                localeResolutionCallback: (deviceLocale, supportedLocales) {
                  for (var locale in supportedLocales) {
                    if (locale.languageCode == deviceLocale!.languageCode) {
                      return deviceLocale;
                    }
                  }
                  return supportedLocales.first;
                },
                locale: state is ChangeLanguageState
                    ? state.locale
                    : const Locale('ru'),
                supportedLocales: const [
                  Locale('en'),
                  Locale('ru'),
                  Locale('ky'),
                ],
                debugShowCheckedModeBanner: false,
                theme: themeState.isdark ? darkTheme : lightTheme,
                title: 'Tasbix',
                home: BlocBuilder<LanguageCubit, LanguageState>(
                  builder: (context, state) {
                    return const SplashScreen();
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
