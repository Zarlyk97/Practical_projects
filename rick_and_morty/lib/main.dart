import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/common/app_colors.dart';
import 'package:rick_and_morty/feature/presentation/bloc/bloc/search_bloc.dart';
import 'package:rick_and_morty/feature/presentation/bloc/cubit/person_cubit.dart';

import 'package:rick_and_morty/feature/presentation/pages/home_page.dart';
import 'package:rick_and_morty/locator_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initlocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PersonListCubit>(
          create: (context) => sl<PersonListCubit>()..loadPerson(),
        ),
        BlocProvider<PersonSearchBloc>(
          create: (context) => sl<PersonSearchBloc>(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          // ignore: deprecated_member_use
          backgroundColor: AppColors.mainBackgraund,
          scaffoldBackgroundColor: AppColors.mainBackgraund,
        ),
        home: const HomePage(),
      ),
    );
  }
}
