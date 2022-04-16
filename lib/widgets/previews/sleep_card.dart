import 'package:cursed_work/utils/assets.dart';
import 'package:cursed_work/utils/models/sleep_model.dart';
import 'package:cursed_work/utils/ui_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class SleepCard extends StatelessWidget {
  const SleepCard({Key? key, required this.data, required this.onTap})
      : super(key: key);

  final SleepStatisticsModel data;
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const SizedBox(width: 5),
                SizedBox(
                  width: 70,
                  height: 70,
                  child: SfRadialGauge(
                    axes: <RadialAxis>[
                      RadialAxis(
                        showTicks: false,
                        showLabels: false,
                        showAxisLine: false,
                        interval: 30,
                        ranges: <GaugeRange>[
                          GaugeRange(
                            startValue: 0,
                            endValue: 100,
                            gradient: const SweepGradient(
                              colors: [
                                Color(0xffC05B55),
                                Color(0xffBE8A4E),
                                Color(0xff5C89AA),
                                Color(0xff7AAA5C),
                              ],
                              stops: [0.1, 0.3, 0.6, 0.8],
                            ),
                            startWidth: 10,
                            endWidth: 10,
                          ),
                        ],
                        pointers: <GaugePointer>[
                          MarkerPointer(
                            value: data.currentMark.toDouble(),
                            color: AppColors.white,
                            borderWidth: 1,
                            borderColor: AppColors.black,
                          )
                        ],
                        annotations: <GaugeAnnotation>[
                          GaugeAnnotation(
                            widget: SvgPicture.asset(
                              Assets.moon,
                              height: 17,
                              color: AppColors.dark,
                            ),
                            angle: 90,
                            positionFactor: 1,
                          ),
                          GaugeAnnotation(
                            widget: Text(
                              data.currentMark.toString(),
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
                const SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Text(
                          'Вы уснули в ',
                          style: AppTextStyles.bigText().copyWith(
                            color: AppColors.black,
                          ),
                        ),
                        Text(
                          data.lastSleepTime,
                          style: AppTextStyles.bigText().copyWith(
                            color: AppColors.red,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Text(
                          'Время сна: ',
                          style: AppTextStyles.bigText().copyWith(
                            color: AppColors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          '${data.hours.toStringAsFixed(1)} ч',
                          style: AppTextStyles.bigText().copyWith(
                            color: AppColors.red,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Text(
                'Средние показатели за неделю',
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
                  edgeStyle: LinearEdgeStyle.bothCurve,
                  shaderCallback: (rect) {
                    return const LinearGradient(
                      colors: [
                        Color(0xffC05B55),
                        Color(0xffBE8A4E),
                        Color(0xff5C89AA),
                        Color(0xff7AAA5C),
                      ],
                      stops: [0.2, 0.4, 0.6, 0.8],
                    ).createShader(rect);
                  },
                )
              ],
              markerPointers: [
                LinearWidgetPointer(
                  value: data.averageMark.toDouble(),
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
