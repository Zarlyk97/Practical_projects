// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    AboutRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AboutPage(),
      );
    },
    CartRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CartPage(),
      );
    },
    EmptyCartRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const EmptyCartPage(),
      );
    },
    HistoryRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HistoryPage(),
      );
    },
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomePage(),
      );
    },
    MainRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MainPage(),
      );
    },
    OrderRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const OrderPage(),
      );
    },
    PinnedSearchBarAppRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const PinnedSearchBarAppPage(),
      );
    },
    PlacingAnOrderRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const PlacingAnOrderPage(),
      );
    },
    SeachRoute.name: (routeData) {
      final args = routeData.argsAs<SeachRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: SeachScreen(
          key: args.key,
          id: args.id,
          fruits: args.fruits,
        ),
      );
    },
  };
}

/// generated route for
/// [AboutPage]
class AboutRoute extends PageRouteInfo<void> {
  const AboutRoute({List<PageRouteInfo>? children})
      : super(
          AboutRoute.name,
          initialChildren: children,
        );

  static const String name = 'AboutRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [CartPage]
class CartRoute extends PageRouteInfo<void> {
  const CartRoute({List<PageRouteInfo>? children})
      : super(
          CartRoute.name,
          initialChildren: children,
        );

  static const String name = 'CartRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [EmptyCartPage]
class EmptyCartRoute extends PageRouteInfo<void> {
  const EmptyCartRoute({List<PageRouteInfo>? children})
      : super(
          EmptyCartRoute.name,
          initialChildren: children,
        );

  static const String name = 'EmptyCartRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [HistoryPage]
class HistoryRoute extends PageRouteInfo<void> {
  const HistoryRoute({List<PageRouteInfo>? children})
      : super(
          HistoryRoute.name,
          initialChildren: children,
        );

  static const String name = 'HistoryRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [HomePage]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MainPage]
class MainRoute extends PageRouteInfo<void> {
  const MainRoute({List<PageRouteInfo>? children})
      : super(
          MainRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [OrderPage]
class OrderRoute extends PageRouteInfo<void> {
  const OrderRoute({List<PageRouteInfo>? children})
      : super(
          OrderRoute.name,
          initialChildren: children,
        );

  static const String name = 'OrderRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [PinnedSearchBarAppPage]
class PinnedSearchBarAppRoute extends PageRouteInfo<void> {
  const PinnedSearchBarAppRoute({List<PageRouteInfo>? children})
      : super(
          PinnedSearchBarAppRoute.name,
          initialChildren: children,
        );

  static const String name = 'PinnedSearchBarAppRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [PlacingAnOrderPage]
class PlacingAnOrderRoute extends PageRouteInfo<void> {
  const PlacingAnOrderRoute({List<PageRouteInfo>? children})
      : super(
          PlacingAnOrderRoute.name,
          initialChildren: children,
        );

  static const String name = 'PlacingAnOrderRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SeachScreen]
class SeachRoute extends PageRouteInfo<SeachRouteArgs> {
  SeachRoute({
    Key? key,
    required int id,
    required List<String> fruits,
    List<PageRouteInfo>? children,
  }) : super(
          SeachRoute.name,
          args: SeachRouteArgs(
            key: key,
            id: id,
            fruits: fruits,
          ),
          initialChildren: children,
        );

  static const String name = 'SeachRoute';

  static const PageInfo<SeachRouteArgs> page = PageInfo<SeachRouteArgs>(name);
}

class SeachRouteArgs {
  const SeachRouteArgs({
    this.key,
    required this.id,
    required this.fruits,
  });

  final Key? key;

  final int id;

  final List<String> fruits;

  @override
  String toString() {
    return 'SeachRouteArgs{key: $key, id: $id, fruits: $fruits}';
  }
}
