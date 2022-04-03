import 'package:auto_route/auto_route.dart';
import 'package:cursed_work/pages/init_page.dart';
import 'package:cursed_work/pages/login_page.dart';
import 'package:cursed_work/pages/profile/profile_page.dart';
import 'package:cursed_work/pages/profile/settings_page.dart';
import 'package:cursed_work/pages/recomendations/feed_page.dart';
import 'package:cursed_work/pages/recomendations/recomendation_page.dart';
import 'package:cursed_work/pages/registration/account_page.dart';
import 'package:cursed_work/pages/registration/avatar_page.dart';
import 'package:cursed_work/pages/registration/biometrics_page.dart';
import 'package:cursed_work/pages/registration/password_page.dart';
import 'package:cursed_work/pages/registration/personal_data_page.dart';
import 'package:cursed_work/pages/statistics/all_statisctics_page.dart';
import 'package:cursed_work/pages/tabs_page.dart';
import 'package:cursed_work/pages/welcome_page.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: [
    AutoRoute(
      path: 'init',
      name: 'InitRouter',
      page: InitPage,
      children: [
        AutoRoute(
          path: 'account',
          name: 'AccountRouter',
          page: AccountPage,
        ),
        AutoRoute(
          path: 'password',
          name: 'PasswordRouter',
          page: PasswordPage,
        ),
        AutoRoute(
          path: 'personalData',
          name: 'PersonalDataRouter',
          page: PersonalDataPage,
        ),
        AutoRoute(
          path: 'biometrics',
          name: 'BiometricsRouter',
          page: BiometricsPage,
        ),
        AutoRoute(
          path: 'avatar',
          name: 'AvatarRouter',
          page: AvatarPage,
        ),
        AutoRoute(
          path: 'login',
          name: 'LoginRouter',
          page: LoginPage,
        ),
        CustomRoute(
          path: 'settings',
          name: 'SettingsRouter',
          page: SettingsPage,
          transitionsBuilder: TransitionsBuilders.fadeIn,
        ),
        AutoRoute(
          path: 'welcome',
          name: 'WelcomeRouter',
          page: WelcomePage,
        ),
        AutoRoute(
          path: 'recommendation',
          name: 'RecommendationRouter',
          page: RecommendationPage,
        ),
        AutoRoute(
          path: 'tabs',
          name: 'MainRouter',
          page: TabPage,
          children: [
            AutoRoute(
              initial: true,
              path: 'feed',
              name: 'FeedRouter',
              page: FeedPage,
            ),
            AutoRoute(
              path: 'statistics',
              name: 'StatisticsRouter',
              page: StatisticsPage,
            ),
            AutoRoute(
              path: 'profile',
              name: 'ProfileRouter',
              page: ProfilePage,
            ),
          ],
        ),
      ],
      initial: true,
    ),
  ],
)
class $AppRouter {}
