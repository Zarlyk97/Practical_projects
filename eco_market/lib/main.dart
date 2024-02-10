import 'package:eco_market/config/config.dart';
import 'package:eco_market/features/cart/presentation/cubit/cart_screen_cubit.dart';
import 'package:eco_market/features/main/presentation/cubit/connection/connection_cubit.dart';
import 'package:eco_market/features/main/presentation/cubit/main_screen_cubit.dart';
import 'package:eco_market/features/main/presentation/pages/main/main.dart';
import 'package:eco_market/features/main/presentation/pages/network/no_connection_page.dart';
import 'package:eco_market/features/search/presentation/cubit/search_screen_cubit.dart';
import 'package:eco_market/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'service_locator.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(statusBarColor: AppColors.primary),
  );
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await di.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<MainScreenCubit>(
          create: (context) => di.sl<MainScreenCubit>()..getCategory(),
        ),
        BlocProvider<SearchScreenCubit>(
            create: (context) => di.sl<SearchScreenCubit>()..getProducts()),
        BlocProvider<CartScreenCubit>(
            create: (context) => di.sl<CartScreenCubit>()),
        BlocProvider<ConnectionCubit>(
            create: (context) => di.sl<ConnectionCubit>()),
      ],
      child: MaterialApp(
        theme: theme,
        debugShowCheckedModeBanner: false,
        home: BlocBuilder<ConnectionCubit, ConnectionStatus>(
          builder: (context, state) {
            if (state == ConnectionStatus.connected) {
              return const MainPage();
            } else {
              return const NoConnectionPage();
            }
          },
        ),
      ),
    );
  }
}
