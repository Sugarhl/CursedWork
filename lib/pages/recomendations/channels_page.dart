import 'package:auto_route/auto_route.dart';
import 'package:cursed_work/controllers/feed_controller.dart';
import 'package:cursed_work/navigation/router.gr.dart';
import 'package:cursed_work/repositories/credentials_repository.dart';
import 'package:cursed_work/utils/assets.dart';
import 'package:cursed_work/utils/models/recommendation_model.dart';
import 'package:cursed_work/utils/sizes.dart';
import 'package:cursed_work/utils/ui_kit.dart';
import 'package:cursed_work/utils/util_functions.dart';
import 'package:cursed_work/widgets/previews/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:rxdart/rxdart.dart' as reactive;

class ChannelsPage extends StatefulWidget {
  const ChannelsPage({Key? key}) : super(key: key);

  @override
  ChannelsPageState createState() => ChannelsPageState();
}

class ChannelsPageState extends State<ChannelsPage> {
  @override
  void initState() {
    super.initState();
  }

  final FeedController feedController = Get.find();
  bool _initialized = false;
  final _sub = reactive.CompositeSubscription();

  Future<void> _fetch(int pageKey) async {
    await feedController.fetch();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_initialized) {
      _initialized = true;
      pagingInit<RecommendationModel>(
        controller: _pagingController,
        list: feedController.recommendations,
        mainScrolledToBottom: feedController.scrolledToBottom,
        listUpd: feedController.listUpdated,
        fetch: _fetch,
        sub: _sub,
      );
    }
  }

  @override
  void dispose() {
    _sub.dispose();
    super.dispose();
  }

  final _pagingController = PagingController<int, RecommendationModel>(
    firstPageKey: 0,
  );

  final CredentialsRepository credentialsRepository = Get.find();
  final channels = <String>['Канал 1', 'Канал 2', 'Канал 3'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(40),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.only(left: AppSizes.pageInset, bottom: 8),
                child: Row(
                  children: [
                    Text(
                      'Каналы',
                      style: AppTextStyles.heading2(),
                    ),
                    const Spacer(),
                    const SizedBox(width: 20),
                    GestureDetector(
                      onTap: () {
                        context.navigateTo(const SettingsRouter());
                      },
                      child: SvgPicture.asset(
                        Assets.user,
                        height: 20,
                        width: 20,
                        color: AppColors.light,
                      ),
                    ),
                    const SizedBox(width: 20),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: AppColors.dark,
      body: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (overscroll) {
          overscroll.disallowIndicator();
          return false;
        },
        child: Padding(
          padding: const EdgeInsets.only(right: 20, left: 20, top: 40),
          child: ListView.separated(
            itemBuilder: (context, index) => DevicePreview(
              channel: channels[index],
              subscribe: false,
            ),
            separatorBuilder: (context, index) => const SizedBox(height: 10),
            itemCount: channels.length,
          ),
        ),
      ),
    );
  }
}
