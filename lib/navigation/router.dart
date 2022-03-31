import 'package:auto_route/auto_route.dart';
import 'package:cursed_work/pages/init_page.dart';
import 'package:cursed_work/pages/login_page.dart';
import 'package:cursed_work/pages/registration/account_page.dart';
import 'package:cursed_work/pages/registration/biometrics_page.dart';
import 'package:cursed_work/pages/registration/password_page.dart';
import 'package:cursed_work/pages/registration/personal_data_page.dart';
import 'package:flutter/cupertino.dart';

part 'router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: [
    AutoRoute(
      path: 'init',
      name: 'InitRouter',
      page: InitPage,
      children: [
        AutoRoute(
          path: 'AccountPage',
          name: 'AccountRouter',
          page: AccountPage,
        ),
        AutoRoute(
          path: 'PasswordPage',
          name: 'PasswordRouter',
          page: PasswordPage,
        ),
        AutoRoute(
          path: 'PersonalDataPage',
          name: 'PersonalDataRouter',
          page: PersonalDataPage,
        ),
        AutoRoute(
          path: 'BiometricsPage',
          name: 'BiometricsRouter',
          page: BiometricsPage,
        ),
        AutoRoute(
          path: 'LoginPage',
          name: 'LoginRouter',
          page: LoginPage,
        ),
        // AutoRoute(
        //   path: 'main',
        //   name: 'MainRouter',
        //   page: MainScreen,
        //   children: [
        //     AutoRoute(
        //       initial: true,
        //       path: 'maneken_view',
        //       name: 'ManekenViewRouter',
        //       page: ManekenViewScreen,
        //     ),
        //     AutoRoute(
        //         path: 'catalog', name: 'CatalogRouter', page: CatalogScreen),
        //     AutoRoute(
        //       path: 'feed',
        //       name: 'FeedRouter',
        //       page: FeedScreen,
        //     ),
        //     AutoRoute(
        //       path: 'profile',
        //       name: 'ProfileRouter',
        //       page: ProfileScreen,
        //     ),
        //   ],
        // ),
        // CustomRoute(
        //   path: 'setting',
        //   name: 'SettingsRouter',
        //   page: SettingsScreen,
        //   transitionsBuilder: TransitionsBuilders.fadeIn,
        // ),
      ],
      initial: true,
    ),
  ],
)
class $AppRouter {}
