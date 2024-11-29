import 'package:auto_route/auto_route.dart';
import 'package:eco_market/features/about/presentation/pages/about/about.dart';
import 'package:eco_market/features/cart/presentation/pages/pages.dart';
import 'package:eco_market/features/history/presentation/pages/history/history.dart';
import 'package:eco_market/features/main/presentation/pages/pages.dart';
import 'package:eco_market/features/search/presentation/pages/pages.dart';
import 'package:flutter/material.dart';
part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter {
  List<AutoRoute> get routes => [
        AutoRoute(page: MainRoute.page, initial: true),
        AutoRoute(page: HomeRoute.page),
        AutoRoute(page: AboutRoute.page),
        AutoRoute(page: CartRoute.page),
        AutoRoute(page: PlacingAnOrderRoute.page),
        AutoRoute(page: HistoryRoute.page),
        AutoRoute(page: OrderRoute.page),
        AutoRoute(page: SearchRoute.page),
      ];
}
