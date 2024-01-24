import 'package:auto_route/auto_route.dart';
import 'package:eco_market/config/config.dart';
import 'package:eco_market/config/router/router.dart';
import 'package:eco_market/features/cart/presentation/cubit/cart_screen_cubit.dart';
import 'package:eco_market/features/main/presentation/cubit/connection/connection_cubit.dart';
import 'package:eco_market/features/main/presentation/cubit/main_screen_cubit.dart';
import 'package:eco_market/features/main/presentation/pages/main/main.dart';
import 'package:eco_market/features/main/presentation/pages/network/no_connection_page.dart';
import 'package:eco_market/features/main/presentation/widgets/show_no_connection.dart';
import 'package:eco_market/features/search/presentation/cubit/search_screen_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'service_locator.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(statusBarColor: AppColors.primary),
  );
  await di.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = AppRouter();

    return MultiBlocProvider(
      providers: [
        BlocProvider<MainScreenCubit>(
          create: (context) => di.sl<MainScreenCubit>()..getCategory(),
        ),
        BlocProvider<SearchScreenCubit>(
            create: (context) => di.sl<SearchScreenCubit>()..getProducts()),
        BlocProvider<CartScreenCubit>(
            create: (context) => di.sl<CartScreenCubit>()..getOrders()),
        BlocProvider<ConnectionCubit>(
            create: (context) => di.sl<ConnectionCubit>())
      ],
      child: MaterialApp.router(
        theme: theme,
        debugShowCheckedModeBanner: false,
        // routerDelegate: appRouter.delegate(),
        routerConfig: appRouter.config(),
        builder: (context, child) {
          return BlocBuilder<ConnectionCubit, ConnectionStatus>(
            builder: (context, state) {
              if (state == ConnectionStatus.connected) {
                return const NoConnectionPage();
              }
              return const MainPage();
            },
          );
        },
      ),
    );
  }
}
