import 'package:cursed_work/utils/assets.dart';
import 'package:cursed_work/utils/models/bpm_model.dart';
import 'package:cursed_work/utils/ui_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class BpmCard extends StatelessWidget {
  const BpmCard({Key? key, required this.data, required this.onTap})
      : super(key: key);

  final BpmStatisticsModel data;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        decoration: BoxDecoration(
          color: AppColors.light,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(width: 6),
                  SvgPicture.asset(
                    Assets.bpm,
                    color: AppColors.heart,
                    height: 40,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    data.bpmLast.toString(),
                    style: AppTextStyles.button2().copyWith(
                      fontSize: 27,
                      color: AppColors.black,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 3),
                    child: Text(
                      ' BPM',
                      style: AppTextStyles.button1().copyWith(
                        fontSize: 18,
                        color: AppColors.black,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15, bottom: 3),
                    child: Text(
                      'Сегодня в 19:30',
                      style: AppTextStyles.mainText().copyWith(
                        color: AppColors.black.withOpacity(0.7),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Text(
                'Средние показатели за день',
                style: AppTextStyles.bigText().copyWith(
                  color: AppColors.black,
                ),
              ),
            ),
            const SizedBox(height: 10),
            SfLinearGauge(
              axisTrackStyle: const LinearAxisTrackStyle(
                thickness: 18,
              ),
              interval: 15,
              axisTrackExtent: 5,
              labelOffset: 5,
              axisLabelStyle:
                  AppTextStyles.smallText().copyWith(color: AppColors.black),
              showAxisTrack: false,
              showTicks: false,
              ranges: <LinearGaugeRange>[
                LinearGaugeRange(
                  endWidth: 18,
                  startWidth: 18,
                  startValue: 60,
                  endValue: 120,
                  edgeStyle: LinearEdgeStyle.bothCurve,
                  shaderCallback: (rect) {
                    return const LinearGradient(
                      colors: [
                        Color(0xff5C89AA),
                        Color(0xff7AAA5C),
                        Color(0xffBE8A4E),
                        Color(0xffC05B55),
                      ],
                      stops: [0.2, 0.4, 0.6, 0.8],
                    ).createShader(rect);
                  },
                )
              ],
              minimum: 60,
              maximum: 120,
              markerPointers: [
                LinearWidgetPointer(
                  value: data.bpmAverage.toDouble(),
                  position: LinearElementPosition.outside,
                  child: Container(
                    height: 18,
                    width: 18,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.light.withOpacity(0.9),
                      border: Border.all(color: AppColors.dark, width: 2),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
