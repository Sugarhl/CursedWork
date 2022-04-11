import 'package:auto_route/auto_route.dart';
import 'package:cursed_work/controllers/feed_controller.dart';
import 'package:cursed_work/controllers/profile_controller.dart';
import 'package:cursed_work/controllers/settings_controller.dart';
import 'package:cursed_work/navigation/router.gr.dart';
import 'package:cursed_work/repositories/credentials_repository.dart';
import 'package:cursed_work/utils/ui_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_keyboard_size/flutter_keyboard_size.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final AppRouter _appRouter = AppRouter();
  final CredentialsRepository credentialsRepository =
      Get.put(CredentialsRepository());
  final SettingsController settings = Get.put(SettingsController());
  final ProfileController profile = Get.put(ProfileController());
  final FeedController feed = Get.put(FeedController());

  @override
  Widget build(BuildContext context) {
    return KeyboardDismissOnTap(
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        color: Colors.white,
        routeInformationParser: _appRouter.defaultRouteParser(),
        routerDelegate: AutoRouterDelegate(
          _appRouter,
          navigatorObservers: () => [
            AutoRouteObserver(),
            HeroController(),
          ],
        ),
        theme: ThemeData(
          indicatorColor: const Color(0xff222330),
          textTheme: TextTheme(button: AppTextStyles.button1()),
        ),
        builder: (context, child) {
          SystemChrome.setSystemUIOverlayStyle(
            const SystemUiOverlayStyle(
              statusBarColor: AppColors.dark,
              systemNavigationBarIconBrightness: Brightness.light,
              statusBarIconBrightness: Brightness.light,
            ),
          );
          return KeyboardSizeProvider(
            child: Scaffold(
              body: child,
            ),
          );
        },
      ),
    );
  }
}
