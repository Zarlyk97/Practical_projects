import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/feature/presentation/bloc/bloc/search_bloc.dart';
import 'package:rick_and_morty/feature/presentation/bloc/cubit/search_cubit.dart';
import 'package:rick_and_morty/feature/presentation/pages/home_page.dart';
import 'package:rick_and_morty/locator_service.dart' as di;
import 'package:rick_and_morty/locator_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<PersonsListcubit>(
              create: (context) => sl<PersonsListcubit>()),
          BlocProvider<PersonSearchBloc>(
              create: (context) => sl<PersonSearchBloc>()),
        ],
        child: MaterialApp(
          darkTheme:
              ThemeData.dark().copyWith(scaffoldBackgroundColor: Colors.grey),
          home: const HomePage(),
        ));
  }
}
