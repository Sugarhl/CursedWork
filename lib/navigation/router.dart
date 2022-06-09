import 'package:auto_route/auto_route.dart';
import 'package:cursed_work/pages/init_page.dart';
import 'package:cursed_work/pages/loading_page.dart';
import 'package:cursed_work/pages/profile/settings_page.dart';
import 'package:cursed_work/pages/recomendations/channels_page.dart';
import 'package:cursed_work/pages/recomendations/create_post_page.dart';
import 'package:cursed_work/pages/recomendations/feed_page.dart';
import 'package:cursed_work/pages/recomendations/post_page.dart';
import 'package:cursed_work/pages/registration/email_page.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: [
    AutoRoute(
      path: 'init',
      name: 'InitRouter',
      page: InitPage,
      children: [
        AutoRoute(
          path: 'email',
          name: 'EmailRouter',
          page: EmailPage,
        ),
        AutoRoute(
          path: 'recommendation',
          name: 'RecommendationRouter',
          page: PostPage,
        ),
        AutoRoute(
          initial: true,
          path: 'feed',
          name: 'FeedRouter',
          page: FeedPage,
        ),
        AutoRoute(
          initial: true,
          path: 'channels',
          name: 'ChannelsRouter',
          page: ChannelsPage,
        ),
        CustomRoute(
          path: 'settings',
          name: 'SettingsRouter',
          page: SettingsPage,
          transitionsBuilder: TransitionsBuilders.fadeIn,
        ),
        AutoRoute(
          path: 'loading',
          name: 'LoadingRouter',
          page: LoadingPage,
        ),
        AutoRoute(
          path: 'create',
          name: 'CreatePostRouter',
          page: CreatePostPage,
        ),
      ],
      initial: true,
    ),
  ],
)
class $AppRouter {}
