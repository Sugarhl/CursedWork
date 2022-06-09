import 'package:auto_route/auto_route.dart';
import 'package:cursed_work/controllers/feed_controller.dart';
import 'package:cursed_work/navigation/router.gr.dart';
import 'package:cursed_work/repositories/credentials_repository.dart';
import 'package:cursed_work/utils/assets.dart';
import 'package:cursed_work/utils/models/recommendation_model.dart';
import 'package:cursed_work/utils/sizes.dart';
import 'package:cursed_work/utils/ui_kit.dart';
import 'package:cursed_work/utils/util_functions.dart';
import 'package:cursed_work/widgets/previews/recommendation_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:rxdart/rxdart.dart' as reactive;

class FeedPage extends StatefulWidget {
  const FeedPage({Key? key}) : super(key: key);

  @override
  FeedPageState createState() => FeedPageState();
}

class FeedPageState extends State<FeedPage> {
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
                    const SizedBox(width: 5),
                    GestureDetector(
                      onTap: () {
                        context.router.pop();
                      },
                      child: SvgPicture.asset(
                        Assets.backward_mark,
                        color: AppColors.light,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      'Новости',
                      style: AppTextStyles.heading2(),
                    ),
                    // const Spacer(),
                    // GestureDetector(
                    //   onTap: () {
                    //     context
                    //         .navigateTo(CreatePostRouter(channel: 'channel'));
                    //   },
                    //   child: SvgPicture.asset(
                    //     Assets.recommendations,
                    //     height: 20,
                    //     width: 20,
                    //     color: AppColors.light,
                    //   ),
                    // ),
                    // const SizedBox(width: 20),
                    // GestureDetector(
                    //   onTap: () {
                    //     context.navigateTo(const SettingsRouter());
                    //   },
                    //   child: SvgPicture.asset(
                    //     Assets.user,
                    //     height: 20,
                    //     width: 20,
                    //     color: AppColors.light,
                    //   ),
                    // ),
                    // const SizedBox(width: 20),
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
        child: CustomScrollView(
          key: const PageStorageKey<String>('feed'),
          slivers: <Widget>[
            SliverSafeArea(
              sliver: SliverPadding(
                padding: const EdgeInsets.only(
                  left: AppSizes.pageInset,
                  right: AppSizes.pageInset,
                  top: 10,
                  bottom: 8,
                ),
                sliver: PagedSliverList.separated(
                  pagingController: _pagingController,
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 8),
                  builderDelegate:
                      PagedChildBuilderDelegate<RecommendationModel>(
                    itemBuilder: (context, model, index) =>
                        RecommendationPreview(
                      data: model,
                      onTap: () {
                        context.navigateTo(
                          RecommendationRouter(recommendation: model),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
