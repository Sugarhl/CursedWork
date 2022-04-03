import 'package:cursed_work/utils/assets.dart';
import 'package:cursed_work/utils/models/recommendation_model.dart';
import 'package:cursed_work/utils/ui_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RecommendationPreview extends StatelessWidget {
  const RecommendationPreview(
      {Key? key, required this.data, required this.onTap})
      : super(key: key);

  final RecommendationModel data;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(30),
      highlightColor: AppColors.red.withOpacity(0.5),
      splashColor: AppColors.red.withOpacity(0.5),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: AppColors.light,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: SvgPicture.asset(
                      Assets.recommendations,
                      height: 16,
                      width: 16,
                      color: AppColors.dark,
                    ),
                  ),
                  Text(
                    data.title,
                    style: AppTextStyles.button1().copyWith(
                      color: AppColors.dark,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              Text(
                data.date,
                style: AppTextStyles.mainText().copyWith(color: AppColors.dark),
              ),
              const SizedBox(height: 10),
              ConstrainedBox(
                constraints: const BoxConstraints(maxHeight: 130),
                child: Text(
                  data.mainText,
                  softWrap: true,
                  maxLines: 6,
                  style: AppTextStyles.smallText().copyWith(
                    color: AppColors.dark,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
