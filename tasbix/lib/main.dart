import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasbix/bloc/cubit/theme_cubit.dart';
import 'package:tasbix/features/tasbix/presentation/cubit/tasbix_cubit.dart';
import 'package:tasbix/ui/ui.dart';

import 'features/tasbix/presentation/pages/pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => TasbixCubit(),
        ),
        BlocProvider(
          create: (context) => ThemeCubit(),
        ),
      ],
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: state.brightness == Brightness.dark ? darkTheme : lightTheme,
            home: const HomePage(),
          );
        },
      ),
    );
  }
}
