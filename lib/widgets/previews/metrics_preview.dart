import 'package:cursed_work/utils/util_functions.dart';
import 'package:cursed_work/utils/enums.dart';
import 'package:cursed_work/utils/ui_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MetricsPreview extends StatelessWidget {
  const MetricsPreview({Key? key, required this.type, required this.value})
      : super(key: key);

  final MetricsType type;
  final int value;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: AppColors.light,
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 27, bottom: 18),
        child: Column(
          children: [
            SvgPicture.asset(
              metricsTypeToAsset(type),
            ),
            const SizedBox(height: 10),
            Text(
              metricToLabel(type, value),
              style: AppTextStyles.heading2().copyWith(
                color: AppColors.dark,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
