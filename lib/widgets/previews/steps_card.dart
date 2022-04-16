import 'package:cursed_work/utils/assets.dart';
import 'package:cursed_work/utils/models/steps_model.dart';
import 'package:cursed_work/utils/ui_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class StepsCard extends StatelessWidget {
  const StepsCard({Key? key, required this.data, required this.onTap})
      : super(key: key);

  final StepsStatisticsModel data;
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
        child: Row(
          children: [
            Container(
              width: 100,
              height: 100,
              child: SfRadialGauge(
                axes: <RadialAxis>[
                  RadialAxis(
                    // showTicks: false,
                    showLabels: false,
                    // showAxisLine: false,
                    interval: data.stepsGoal / 10,
                    tickOffset: 2,
                    maximum: data.stepsGoal,
                    ranges: <GaugeRange>[
                      GaugeRange(
                        startValue: 0,
                        endValue: data.stepsGoal,
                        color: AppColors.red,
                        startWidth: 15,
                        endWidth: 15,
                      ),
                    ],
                    pointers: <GaugePointer>[
                      RangePointer(
                        cornerStyle: CornerStyle.endCurve,
                        value: data.stepsCount + 2000,
                        color: AppColors.orange,
                        width: 15,
                      )
                    ],
                    annotations: <GaugeAnnotation>[
                      GaugeAnnotation(
                        widget: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            // Text(
                            //   data.stepsGoal.toInt().toString(),
                            //   style: AppTextStyles.smallText()
                            //       .copyWith(color: AppColors.dark),
                            // ),
                            // const SizedBox(width: 4),
                            SvgPicture.asset(
                              Assets.steps,
                              height: 24,
                            ),
                          ],
                        ),
                        angle: 90,
                        positionFactor: 1,
                      ),
                      GaugeAnnotation(
                        widget: Text(
                          data.stepsCount.toInt().toString(),
                          style: AppTextStyles.mainText()
                              .copyWith(fontWeight: FontWeight.w700)
                              .copyWith(color: AppColors.dark),
                        ),
                        angle: 90,
                        positionFactor: 0.1,
                      )
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(width: 15),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Text(
                      'Шагов сегодня:  ',
                      style: AppTextStyles.mainText().copyWith(
                        color: AppColors.black,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      data.stepsCount.toInt().toString(),
                      style: AppTextStyles.mainText().copyWith(
                        color: AppColors.red,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                Row(
                  children: [
                    Text(
                      'Цель на сегодня:  ',
                      style: AppTextStyles.mainText().copyWith(
                        color: AppColors.black,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      data.stepsGoal.toInt().toString(),
                      style: AppTextStyles.mainText().copyWith(
                        color: AppColors.red,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                Row(
                  children: [
                    Text(
                      'Расстояние по шагам:  ',
                      style: AppTextStyles.mainText().copyWith(
                        color: AppColors.black,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      '${data.distance.toString()} км',
                      style: AppTextStyles.mainText().copyWith(
                        color: AppColors.red,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
