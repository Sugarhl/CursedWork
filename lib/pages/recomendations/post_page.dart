import 'package:auto_route/auto_route.dart';
import 'package:cursed_work/repositories/credentials_repository.dart';
import 'package:cursed_work/utils/assets.dart';
import 'package:cursed_work/utils/models/recommendation_model.dart';
import 'package:cursed_work/utils/ui_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class PostPage extends StatefulWidget {
  const PostPage({Key? key, required this.recommendation}) : super(key: key);
  final RecommendationModel recommendation;

  @override
  PostPageState createState() => PostPageState();
}

class PostPageState extends State<PostPage> {
  @override
  void initState() {
    super.initState();
  }

  final CredentialsRepository credentialsRepository = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.dark,
      body: SafeArea(
        child: NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (overscroll) {
            overscroll.disallowIndicator();
            return false;
          },
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    const SizedBox(width: 14),
                    GestureDetector(
                      onTap: () {
                        context.router.pop();
                      },
                      child: SvgPicture.asset(
                        Assets.backward_mark,
                        color: AppColors.light,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      widget.recommendation.title,
                      style: AppTextStyles.heading2(),
                    ),
                  ],
                ),
                const SizedBox(height: 35),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  child: Text(
                    widget.recommendation.mainText,
                    style: AppTextStyles.mainText().copyWith(
                      color: AppColors.light,
                    ),
                    softWrap: true,
                  ),
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
