// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i8;
import 'package:flutter/material.dart' as _i9;

import '../pages/init_page.dart' as _i1;
import '../pages/login_page.dart' as _i7;
import '../pages/registration/account_page.dart' as _i2;
import '../pages/registration/avatar_page.dart' as _i6;
import '../pages/registration/biometrics_page.dart' as _i5;
import '../pages/registration/password_page.dart' as _i3;
import '../pages/registration/personal_data_page.dart' as _i4;

class AppRouter extends _i8.RootStackRouter {
  AppRouter([_i9.GlobalKey<_i9.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i8.PageFactory> pagesMap = {
    InitRouter.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: _i1.InitPage());
    },
    AccountRouter.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.AccountPage());
    },
    PasswordRouter.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.PasswordPage());
    },
    PersonalDataRouter.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.PersonalDataPage());
    },
    BiometricsRouter.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.BiometricsPage());
    },
    AvatarRouter.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i6.AvatarPage());
    },
    LoginRouter.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i7.LoginPage());
    }
  };

  @override
  List<_i8.RouteConfig> get routes => [
        _i8.RouteConfig('/#redirect',
            path: '/', redirectTo: 'init', fullMatch: true),
        _i8.RouteConfig(InitRouter.name, path: 'init', children: [
          _i8.RouteConfig(AccountRouter.name,
              path: 'AccountPage', parent: InitRouter.name),
          _i8.RouteConfig(PasswordRouter.name,
              path: 'PasswordPage', parent: InitRouter.name),
          _i8.RouteConfig(PersonalDataRouter.name,
              path: 'PersonalDataPage', parent: InitRouter.name),
          _i8.RouteConfig(BiometricsRouter.name,
              path: 'BiometricsPage', parent: InitRouter.name),
          _i8.RouteConfig(AvatarRouter.name,
              path: 'AvatarPage', parent: InitRouter.name),
          _i8.RouteConfig(LoginRouter.name,
              path: 'LoginPage', parent: InitRouter.name)
        ])
      ];
}

/// generated route for [_i1.InitPage]
class InitRouter extends _i8.PageRouteInfo<void> {
  const InitRouter({List<_i8.PageRouteInfo>? children})
      : super(name, path: 'init', initialChildren: children);

  static const String name = 'InitRouter';
}

/// generated route for [_i2.AccountPage]
class AccountRouter extends _i8.PageRouteInfo<void> {
  const AccountRouter() : super(name, path: 'AccountPage');

  static const String name = 'AccountRouter';
}

/// generated route for [_i3.PasswordPage]
class PasswordRouter extends _i8.PageRouteInfo<void> {
  const PasswordRouter() : super(name, path: 'PasswordPage');

  static const String name = 'PasswordRouter';
}

/// generated route for [_i4.PersonalDataPage]
class PersonalDataRouter extends _i8.PageRouteInfo<void> {
  const PersonalDataRouter() : super(name, path: 'PersonalDataPage');

  static const String name = 'PersonalDataRouter';
}

/// generated route for [_i5.BiometricsPage]
class BiometricsRouter extends _i8.PageRouteInfo<void> {
  const BiometricsRouter() : super(name, path: 'BiometricsPage');

  static const String name = 'BiometricsRouter';
}

/// generated route for [_i6.AvatarPage]
class AvatarRouter extends _i8.PageRouteInfo<void> {
  const AvatarRouter() : super(name, path: 'AvatarPage');

  static const String name = 'AvatarRouter';
}

/// generated route for [_i7.LoginPage]
class LoginRouter extends _i8.PageRouteInfo<void> {
  const LoginRouter() : super(name, path: 'LoginPage');

  static const String name = 'LoginRouter';
}
