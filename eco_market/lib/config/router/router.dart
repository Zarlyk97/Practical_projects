import 'package:auto_route/auto_route.dart';
import 'package:eco_market/features/maine_screen/presentation/pages/pages.dart';
part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: MainRoute.page, initial: true),
        AutoRoute(page: HomeRoute.page),
        AutoRoute(page: SeachRoute.page),
      ];
}
