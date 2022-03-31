// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

part of 'router.dart';

class AppRouter extends RootStackRouter {
  AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    InitRouter.name: (routeData) {
      return MaterialPageX<dynamic>(routeData: routeData, child: InitPage());
    },
    AccountRouter.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const AccountPage());
    },
    PasswordRouter.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const PasswordPage());
    },
    PersonalDataRouter.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const PersonalDataPage());
    },
    BiometricsRouter.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const BiometricsPage());
    },
    LoginRouter.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const LoginPage());
    }
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig('/#redirect',
            path: '/', redirectTo: 'init', fullMatch: true),
        RouteConfig(InitRouter.name, path: 'init', children: [
          RouteConfig(AccountRouter.name,
              path: 'AccountPage', parent: InitRouter.name),
          RouteConfig(PasswordRouter.name,
              path: 'PasswordPage', parent: InitRouter.name),
          RouteConfig(PersonalDataRouter.name,
              path: 'PersonalDataPage', parent: InitRouter.name),
          RouteConfig(BiometricsRouter.name,
              path: 'BiometricsPage', parent: InitRouter.name),
          RouteConfig(LoginRouter.name,
              path: 'LoginPage', parent: InitRouter.name)
        ])
      ];
}

/// generated route for [InitPage]
class InitRouter extends PageRouteInfo<void> {
  const InitRouter({List<PageRouteInfo>? children})
      : super(name, path: 'init', initialChildren: children);

  static const String name = 'InitRouter';
}

/// generated route for [AccountPage]
class AccountRouter extends PageRouteInfo<void> {
  const AccountRouter() : super(name, path: 'AccountPage');

  static const String name = 'AccountRouter';
}

/// generated route for [PasswordPage]
class PasswordRouter extends PageRouteInfo<void> {
  const PasswordRouter() : super(name, path: 'PasswordPage');

  static const String name = 'PasswordRouter';
}

/// generated route for [PersonalDataPage]
class PersonalDataRouter extends PageRouteInfo<void> {
  const PersonalDataRouter() : super(name, path: 'PersonalDataPage');

  static const String name = 'PersonalDataRouter';
}

/// generated route for [BiometricsPage]
class BiometricsRouter extends PageRouteInfo<void> {
  const BiometricsRouter() : super(name, path: 'BiometricsPage');

  static const String name = 'BiometricsRouter';
}

/// generated route for [LoginPage]
class LoginRouter extends PageRouteInfo<void> {
  const LoginRouter() : super(name, path: 'LoginPage');

  static const String name = 'LoginRouter';
}
