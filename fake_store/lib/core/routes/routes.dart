import 'package:auto_route/auto_route.dart';
import 'package:fakestore/core/routes/routes.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: SignInRoute.page, initial: true),
        AutoRoute(page: SignUpRoute.page),
        AutoRoute(page: CategoriesRoute.page),
        AutoRoute(page: CategoryRoute.page),
        AutoRoute(page: DetailRoute.page),
        AutoRoute(page: CartRoute.page),
        AutoRoute(page: ProfileRoute.page),
        AutoRoute(page: MainRoute.page),
      ];
}
