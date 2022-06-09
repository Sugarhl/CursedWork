// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i9;
import 'package:flutter/material.dart' as _i10;

import '../pages/init_page.dart' as _i1;
import '../pages/loading_page.dart' as _i7;
import '../pages/profile/settings_page.dart' as _i6;
import '../pages/recomendations/channels_page.dart' as _i5;
import '../pages/recomendations/create_post_page.dart' as _i8;
import '../pages/recomendations/feed_page.dart' as _i4;
import '../pages/recomendations/post_page.dart' as _i3;
import '../pages/registration/email_page.dart' as _i2;
import '../utils/models/recommendation_model.dart' as _i11;

class AppRouter extends _i9.RootStackRouter {
  AppRouter([_i10.GlobalKey<_i10.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i9.PageFactory> pagesMap = {
    InitRouter.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
          routeData: routeData, child: _i1.InitPage());
    },
    EmailRouter.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.EmailPage());
    },
    RecommendationRouter.name: (routeData) {
      final args = routeData.argsAs<RecommendationRouterArgs>();
      return _i9.MaterialPageX<dynamic>(
          routeData: routeData,
          child:
              _i3.PostPage(key: args.key, recommendation: args.recommendation));
    },
    FeedRouter.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.FeedPage());
    },
    ChannelsRouter.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.ChannelsPage());
    },
    SettingsRouter.name: (routeData) {
      return _i9.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i6.SettingsPage(),
          transitionsBuilder: _i9.TransitionsBuilders.fadeIn,
          opaque: true,
          barrierDismissible: false);
    },
    LoadingRouter.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i7.LoadingPage());
    },
    CreatePostRouter.name: (routeData) {
      final args = routeData.argsAs<CreatePostRouterArgs>();
      return _i9.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i8.CreatePostPage(key: args.key, channel: args.channel));
    }
  };

  @override
  List<_i9.RouteConfig> get routes => [
        _i9.RouteConfig('/#redirect',
            path: '/', redirectTo: 'init', fullMatch: true),
        _i9.RouteConfig(InitRouter.name, path: 'init', children: [
          _i9.RouteConfig('#redirect',
              path: '',
              parent: InitRouter.name,
              redirectTo: 'feed',
              fullMatch: true),
          _i9.RouteConfig(EmailRouter.name,
              path: 'email', parent: InitRouter.name),
          _i9.RouteConfig(RecommendationRouter.name,
              path: 'recommendation', parent: InitRouter.name),
          _i9.RouteConfig(FeedRouter.name,
              path: 'feed', parent: InitRouter.name),
          _i9.RouteConfig(ChannelsRouter.name,
              path: 'channels', parent: InitRouter.name),
          _i9.RouteConfig(SettingsRouter.name,
              path: 'settings', parent: InitRouter.name),
          _i9.RouteConfig(LoadingRouter.name,
              path: 'loading', parent: InitRouter.name),
          _i9.RouteConfig(CreatePostRouter.name,
              path: 'create', parent: InitRouter.name)
        ])
      ];
}

/// generated route for [_i1.InitPage]
class InitRouter extends _i9.PageRouteInfo<void> {
  const InitRouter({List<_i9.PageRouteInfo>? children})
      : super(name, path: 'init', initialChildren: children);

  static const String name = 'InitRouter';
}

/// generated route for [_i2.EmailPage]
class EmailRouter extends _i9.PageRouteInfo<void> {
  const EmailRouter() : super(name, path: 'email');

  static const String name = 'EmailRouter';
}

/// generated route for [_i3.PostPage]
class RecommendationRouter extends _i9.PageRouteInfo<RecommendationRouterArgs> {
  RecommendationRouter(
      {_i10.Key? key, required _i11.RecommendationModel recommendation})
      : super(name,
            path: 'recommendation',
            args: RecommendationRouterArgs(
                key: key, recommendation: recommendation));

  static const String name = 'RecommendationRouter';
}

class RecommendationRouterArgs {
  const RecommendationRouterArgs({this.key, required this.recommendation});

  final _i10.Key? key;

  final _i11.RecommendationModel recommendation;

  @override
  String toString() {
    return 'RecommendationRouterArgs{key: $key, recommendation: $recommendation}';
  }
}

/// generated route for [_i4.FeedPage]
class FeedRouter extends _i9.PageRouteInfo<void> {
  const FeedRouter() : super(name, path: 'feed');

  static const String name = 'FeedRouter';
}

/// generated route for [_i5.ChannelsPage]
class ChannelsRouter extends _i9.PageRouteInfo<void> {
  const ChannelsRouter() : super(name, path: 'channels');

  static const String name = 'ChannelsRouter';
}

/// generated route for [_i6.SettingsPage]
class SettingsRouter extends _i9.PageRouteInfo<void> {
  const SettingsRouter() : super(name, path: 'settings');

  static const String name = 'SettingsRouter';
}

/// generated route for [_i7.LoadingPage]
class LoadingRouter extends _i9.PageRouteInfo<void> {
  const LoadingRouter() : super(name, path: 'loading');

  static const String name = 'LoadingRouter';
}

/// generated route for [_i8.CreatePostPage]
class CreatePostRouter extends _i9.PageRouteInfo<CreatePostRouterArgs> {
  CreatePostRouter({_i10.Key? key, required String channel})
      : super(name,
            path: 'create',
            args: CreatePostRouterArgs(key: key, channel: channel));

  static const String name = 'CreatePostRouter';
}

class CreatePostRouterArgs {
  const CreatePostRouterArgs({this.key, required this.channel});

  final _i10.Key? key;

  final String channel;

  @override
  String toString() {
    return 'CreatePostRouterArgs{key: $key, channel: $channel}';
  }
}
