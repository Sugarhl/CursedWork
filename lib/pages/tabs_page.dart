import 'package:auto_route/auto_route.dart';
import 'package:cursed_work/navigation/router.gr.dart';
import 'package:cursed_work/repositories/credentials_repository.dart';
import 'package:cursed_work/utils/ui_kit.dart';
import 'package:cursed_work/widgets/bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class TabPage extends StatefulWidget {
  const TabPage({Key? key, @QueryParam('first_time') this.firstTime = false})
      : super(key: key);

  final bool firstTime;

  @override
  State<TabPage> createState() => _TabPageState();
}

class _TabPageState extends State<TabPage> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addObserver(this);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // if (!widget._initialized && !_initialized) {
    //   widget._initialized = true;
    //   _initialized = true;
    //   if (widget.firstTime) {
    //     context.router.pushNamed('tutorial');
    //   }
    //   Get.put(MessengerController()).load();
    // }
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance?.removeObserver(this);
  }

  final CredentialsRepository credentialsRepository = Get.find();

  // @override
  // void didChangeAppLifecycleState(AppLifecycleState state) {
  //   if (credentialsRepository.myId != null) {
  //     switch (state) {
  //       case AppLifecycleState.resumed:
  //         credentialsRepository.client<SocialClient>().updateActivityStatus(
  //               UpdateActivityStatusRequest(
  //                 activityStatus: ActivityStatus.ONLINE,
  //               ),
  //             );
  //         break;
  //       case AppLifecycleState.inactive:
  //         credentialsRepository.client<SocialClient>().updateActivityStatus(
  //               UpdateActivityStatusRequest(
  //                 activityStatus: ActivityStatus.OFFLINE,
  //               ),
  //             );
  //         break;
  //       case AppLifecycleState.paused:
  //         credentialsRepository.client<SocialClient>().updateActivityStatus(
  //               UpdateActivityStatusRequest(
  //                 activityStatus: ActivityStatus.OFFLINE,
  //               ),
  //             );
  //         break;
  //       case AppLifecycleState.detached:
  //         credentialsRepository.client<SocialClient>().updateActivityStatus(
  //               UpdateActivityStatusRequest(
  //                 activityStatus: ActivityStatus.OFFLINE,
  //               ),
  //             );
  //         break;
  //     }
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: const SystemUiOverlayStyle(
          systemNavigationBarColor: Colors.transparent,
        ),
        child: AutoTabsRouter(
          routes: const [
            FeedRouter(),
            StatisticsRouter(),
            ProfileRouter(),
          ],
          builder: (context, child, animation) {
            final tabsRouter = AutoTabsRouter.of(context);
            return Scaffold(
              backgroundColor: AppColors.dark,
              body: Column(
                children: [
                  Expanded(child: child),
                  BottomBar(onTap: tabsRouter.setActiveIndex)
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
