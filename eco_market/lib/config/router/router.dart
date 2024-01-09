import 'package:auto_route/auto_route.dart';
import 'package:eco_market/features/about/presentation/pages/about/about.dart';
import 'package:eco_market/features/cart/presentation/pages/pages.dart';
import 'package:eco_market/features/main/presentation/pages/pages.dart';
import 'package:eco_market/features/search/presentation/pages/pages.dart';
part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: MainRoute.page, initial: true),
        AutoRoute(page: HomeRoute.page),
        AutoRoute(page: SeachRoute.page),
        AutoRoute(page: AboutRoute.page),
        AutoRoute(page: CartRoute.page),
        AutoRoute(page: PlacingAnOrderRoute.page),
        AutoRoute(page: EmptyCartRoute.page),
      ];
}
