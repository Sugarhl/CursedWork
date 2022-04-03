// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i15;
import 'package:flutter/material.dart' as _i16;

import '../pages/init_page.dart' as _i1;
import '../pages/login_page.dart' as _i7;
import '../pages/profile/profile_page.dart' as _i14;
import '../pages/profile/settings_page.dart' as _i8;
import '../pages/recomendations/feed_page.dart' as _i12;
import '../pages/recomendations/recomendation_page.dart' as _i10;
import '../pages/registration/account_page.dart' as _i2;
import '../pages/registration/avatar_page.dart' as _i6;
import '../pages/registration/biometrics_page.dart' as _i5;
import '../pages/registration/password_page.dart' as _i3;
import '../pages/registration/personal_data_page.dart' as _i4;
import '../pages/statistics/all_statisctics_page.dart' as _i13;
import '../pages/tabs_page.dart' as _i11;
import '../pages/welcome_page.dart' as _i9;
import '../utils/models/recommendation_model.dart' as _i17;

class AppRouter extends _i15.RootStackRouter {
  AppRouter([_i16.GlobalKey<_i16.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i15.PageFactory> pagesMap = {
    InitRouter.name: (routeData) {
      return _i15.MaterialPageX<dynamic>(
          routeData: routeData, child: _i1.InitPage());
    },
    AccountRouter.name: (routeData) {
      return _i15.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.AccountPage());
    },
    PasswordRouter.name: (routeData) {
      return _i15.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.PasswordPage());
    },
    PersonalDataRouter.name: (routeData) {
      return _i15.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.PersonalDataPage());
    },
    BiometricsRouter.name: (routeData) {
      return _i15.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.BiometricsPage());
    },
    AvatarRouter.name: (routeData) {
      return _i15.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i6.AvatarPage());
    },
    LoginRouter.name: (routeData) {
      return _i15.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i7.LoginPage());
    },
    SettingsRouter.name: (routeData) {
      return _i15.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i8.SettingsPage(),
          transitionsBuilder: _i15.TransitionsBuilders.fadeIn,
          opaque: true,
          barrierDismissible: false);
    },
    WelcomeRouter.name: (routeData) {
      return _i15.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i9.WelcomePage());
    },
    RecommendationRouter.name: (routeData) {
      final args = routeData.argsAs<RecommendationRouterArgs>();
      return _i15.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i10.RecommendationPage(
              key: args.key, recommendation: args.recommendation));
    },
    MainRouter.name: (routeData) {
      final queryParams = routeData.queryParams;
      final args = routeData.argsAs<MainRouterArgs>(
          orElse: () => MainRouterArgs(
              firstTime: queryParams.getBool('first_time', false)));
      return _i15.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i11.TabPage(key: args.key, firstTime: args.firstTime));
    },
    FeedRouter.name: (routeData) {
      return _i15.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i12.FeedPage());
    },
    StatisticsRouter.name: (routeData) {
      return _i15.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i13.StatisticsPage());
    },
    ProfileRouter.name: (routeData) {
      return _i15.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i14.ProfilePage());
    }
  };

  @override
  List<_i15.RouteConfig> get routes => [
        _i15.RouteConfig('/#redirect',
            path: '/', redirectTo: 'init', fullMatch: true),
        _i15.RouteConfig(InitRouter.name, path: 'init', children: [
          _i15.RouteConfig(AccountRouter.name,
              path: 'account', parent: InitRouter.name),
          _i15.RouteConfig(PasswordRouter.name,
              path: 'password', parent: InitRouter.name),
          _i15.RouteConfig(PersonalDataRouter.name,
              path: 'personalData', parent: InitRouter.name),
          _i15.RouteConfig(BiometricsRouter.name,
              path: 'biometrics', parent: InitRouter.name),
          _i15.RouteConfig(AvatarRouter.name,
              path: 'avatar', parent: InitRouter.name),
          _i15.RouteConfig(LoginRouter.name,
              path: 'login', parent: InitRouter.name),
          _i15.RouteConfig(SettingsRouter.name,
              path: 'settings', parent: InitRouter.name),
          _i15.RouteConfig(WelcomeRouter.name,
              path: 'welcome', parent: InitRouter.name),
          _i15.RouteConfig(RecommendationRouter.name,
              path: 'recommendation', parent: InitRouter.name),
          _i15.RouteConfig(MainRouter.name,
              path: 'tabs',
              parent: InitRouter.name,
              children: [
                _i15.RouteConfig('#redirect',
                    path: '',
                    parent: MainRouter.name,
                    redirectTo: 'feed',
                    fullMatch: true),
                _i15.RouteConfig(FeedRouter.name,
                    path: 'feed', parent: MainRouter.name),
                _i15.RouteConfig(StatisticsRouter.name,
                    path: 'statistics', parent: MainRouter.name),
                _i15.RouteConfig(ProfileRouter.name,
                    path: 'profile', parent: MainRouter.name)
              ])
        ])
      ];
}

/// generated route for [_i1.InitPage]
class InitRouter extends _i15.PageRouteInfo<void> {
  const InitRouter({List<_i15.PageRouteInfo>? children})
      : super(name, path: 'init', initialChildren: children);

  static const String name = 'InitRouter';
}

/// generated route for [_i2.AccountPage]
class AccountRouter extends _i15.PageRouteInfo<void> {
  const AccountRouter() : super(name, path: 'account');

  static const String name = 'AccountRouter';
}

/// generated route for [_i3.PasswordPage]
class PasswordRouter extends _i15.PageRouteInfo<void> {
  const PasswordRouter() : super(name, path: 'password');

  static const String name = 'PasswordRouter';
}

/// generated route for [_i4.PersonalDataPage]
class PersonalDataRouter extends _i15.PageRouteInfo<void> {
  const PersonalDataRouter() : super(name, path: 'personalData');

  static const String name = 'PersonalDataRouter';
}

/// generated route for [_i5.BiometricsPage]
class BiometricsRouter extends _i15.PageRouteInfo<void> {
  const BiometricsRouter() : super(name, path: 'biometrics');

  static const String name = 'BiometricsRouter';
}

/// generated route for [_i6.AvatarPage]
class AvatarRouter extends _i15.PageRouteInfo<void> {
  const AvatarRouter() : super(name, path: 'avatar');

  static const String name = 'AvatarRouter';
}

/// generated route for [_i7.LoginPage]
class LoginRouter extends _i15.PageRouteInfo<void> {
  const LoginRouter() : super(name, path: 'login');

  static const String name = 'LoginRouter';
}

/// generated route for [_i8.SettingsPage]
class SettingsRouter extends _i15.PageRouteInfo<void> {
  const SettingsRouter() : super(name, path: 'settings');

  static const String name = 'SettingsRouter';
}

/// generated route for [_i9.WelcomePage]
class WelcomeRouter extends _i15.PageRouteInfo<void> {
  const WelcomeRouter() : super(name, path: 'welcome');

  static const String name = 'WelcomeRouter';
}

/// generated route for [_i10.RecommendationPage]
class RecommendationRouter
    extends _i15.PageRouteInfo<RecommendationRouterArgs> {
  RecommendationRouter(
      {_i16.Key? key, required _i17.RecommendationModel recommendation})
      : super(name,
            path: 'recommendation',
            args: RecommendationRouterArgs(
                key: key, recommendation: recommendation));

  static const String name = 'RecommendationRouter';
}

class RecommendationRouterArgs {
  const RecommendationRouterArgs({this.key, required this.recommendation});

  final _i16.Key? key;

  final _i17.RecommendationModel recommendation;

  @override
  String toString() {
    return 'RecommendationRouterArgs{key: $key, recommendation: $recommendation}';
  }
}

/// generated route for [_i11.TabPage]
class MainRouter extends _i15.PageRouteInfo<MainRouterArgs> {
  MainRouter(
      {_i16.Key? key,
      bool firstTime = false,
      List<_i15.PageRouteInfo>? children})
      : super(name,
            path: 'tabs',
            args: MainRouterArgs(key: key, firstTime: firstTime),
            rawQueryParams: {'first_time': firstTime},
            initialChildren: children);

  static const String name = 'MainRouter';
}

class MainRouterArgs {
  const MainRouterArgs({this.key, this.firstTime = false});

  final _i16.Key? key;

  final bool firstTime;

  @override
  String toString() {
    return 'MainRouterArgs{key: $key, firstTime: $firstTime}';
  }
}

/// generated route for [_i12.FeedPage]
class FeedRouter extends _i15.PageRouteInfo<void> {
  const FeedRouter() : super(name, path: 'feed');

  static const String name = 'FeedRouter';
}

/// generated route for [_i13.StatisticsPage]
class StatisticsRouter extends _i15.PageRouteInfo<void> {
  const StatisticsRouter() : super(name, path: 'statistics');

  static const String name = 'StatisticsRouter';
}

/// generated route for [_i14.ProfilePage]
class ProfileRouter extends _i15.PageRouteInfo<void> {
  const ProfileRouter() : super(name, path: 'profile');

  static const String name = 'ProfileRouter';
}
