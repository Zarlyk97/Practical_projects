import 'package:fakestore/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:fakestore/features/category/presentation/cubit/category_cubit.dart';
import 'package:fakestore/features/category/presentation/pages/main_page.dart';
import 'package:fakestore/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => sl<AuthCubit>()),
        BlocProvider(create: (context) => sl<CategoryCubit>()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          appBarTheme: const AppBarTheme(elevation: 0, centerTitle: true),
          primarySwatch: Colors.blue,
        ),
        title: 'FakeStore',
        home: const MainPage(),
      ),
    );
  }
}
