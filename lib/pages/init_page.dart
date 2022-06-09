import 'package:auto_route/auto_route.dart';
import 'package:auto_route/src/router/auto_router_x.dart';
import 'package:cursed_work/navigation/router.gr.dart';
import 'package:cursed_work/repositories/credentials_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:rxdart/rxdart.dart';

class InitPage extends StatefulWidget {
  @override
  InitPageState createState() => InitPageState();
}

class InitPageState extends State<InitPage> {
  final _sub = CompositeSubscription();

  @override
  void initState() {
    _sub.add(
      Get.find<CredentialsRepository>().state.listen((state) {
        if (Get.find<CredentialsRepository>().state.value ==
            CredentialsState.loggedIn) {
          context.router.replaceAll([FeedRouter()]);
        } else if (Get.find<CredentialsRepository>().state.value ==
            CredentialsState.loggedOut) {
          context.router.replaceAll([const EmailRouter()]);
        }
      }),
    );
    Get.find<CredentialsRepository>().restoreCredentials();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  final routerKey = UniqueKey();

  @override
  Widget build(BuildContext context) {
    return AutoRouter(
      key: routerKey,
    );
  }
}
