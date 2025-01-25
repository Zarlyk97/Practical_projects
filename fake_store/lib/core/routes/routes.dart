import 'package:auto_route/auto_route.dart';
import 'package:fakestore/core/constants/constants.dart';
import 'package:fakestore/core/routes/routes.gr.dart';
import 'package:fakestore/service_locator.dart';
import 'package:shared_preferences/shared_preferences.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: SignInRoute.page,
          initial: true,
        ),
        AutoRoute(page: SignUpRoute.page),
        AutoRoute(page: CategoriesRoute.page, guards: [AuthGuard()]),
        AutoRoute(page: DetailRoute.page, guards: [AuthGuard()]),
        AutoRoute(page: CartRoute.page, guards: [AuthGuard()]),
        AutoRoute(page: ProfileRoute.page, guards: [AuthGuard()]),
        AutoRoute(page: MainRoute.page, guards: [AuthGuard()]),
      ];
}

class AuthGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    final prefs = sl<SharedPreferences>();
    bool isAuth = prefs.getString(ApiConsts.token) != null;
    if (isAuth) {
      resolver.next(true);
    } else {
      router.push(const SignInRoute());
      resolver.next(false);
    }
  }
}
