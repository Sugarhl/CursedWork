import 'package:auto_route/auto_route.dart';
import 'package:cursed_work/repositories/credentials_repository.dart';
import 'package:cursed_work/utils/assets.dart';
import 'package:cursed_work/utils/models/recommendation_model.dart';
import 'package:cursed_work/utils/ui_kit.dart';
import 'package:cursed_work/widgets/photo_tag.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class RecommendationPage extends StatefulWidget {
  const RecommendationPage({Key? key, required this.recommendation})
      : super(key: key);
  final RecommendationModel recommendation;

  @override
  RecommendationPageState createState() => RecommendationPageState();
}

class RecommendationPageState extends State<RecommendationPage> {
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
                const SizedBox(height: 30),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: PhotoViewGallery(
                    height: 300,
                    images: [
                      'https://gipertonium.com/wp-content/uploads/d/e/1/de1b6cbe597bb5c30652e0b7e49671d0.jpg',
                      // 'https://i.gifer.com/origin/50/50b91baac686f99cbb660ab3bf0dcee0.gif',
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
