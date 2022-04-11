import 'package:cursed_work/utils/models/steps_model.dart';
import 'package:cursed_work/utils/ui_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
                    maximum: data.stepsGoal,
                    ranges: <GaugeRange>[
                      GaugeRange(
                        startValue: 0,
                        endValue: data.stepsGoal,
                        color: AppColors.red,
                      ),
                      // GaugeRange(
                      //   startValue: data.stepsGoal / 3,
                      //   endValue: data.stepsGoal / 3 * 2,
                      //   color: Colors.orange,
                      // ),
                      // GaugeRange(
                      //   startValue: data.stepsGoal / 3 * 2,
                      //   endValue: data.stepsGoal,
                      //   color: Colors.red,
                      // )
                    ],
                    pointers: <GaugePointer>[
                      RangePointer(
                        value: data.stepsCount,
                        color: AppColors.orange,
                      )
                    ],
                    annotations: <GaugeAnnotation>[
                      GaugeAnnotation(
                        widget: Text(
                          data.stepsGoal.toInt().toString(),
                          style: AppTextStyles.smallText()
                              .copyWith(color: AppColors.dark),
                        ),
                        angle: 90,
                        positionFactor: 1,
                      )
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(width: 15),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Text(
                      'Шагов сегодня:  ',
                      style: AppTextStyles.mainText().copyWith(
                        color: AppColors.black,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      data.stepsCount.toInt().toString(),
                      style: AppTextStyles.mainText().copyWith(
                        color: AppColors.red,
                        fontWeight: FontWeight.w700,
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
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      data.stepsGoal.toInt().toString(),
                      style: AppTextStyles.mainText().copyWith(
                        color: AppColors.red,
                        fontWeight: FontWeight.w700,
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
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      '${data.distance.toString()} км',
                      style: AppTextStyles.mainText().copyWith(
                        color: AppColors.red,
                        fontWeight: FontWeight.w700,
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
