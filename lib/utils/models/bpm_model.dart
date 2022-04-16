class BpmStatisticsModel {
  BpmStatisticsModel({
    required this.bpmLast,
    required this.bpmAverage,
    this.lastMeasuringTime = 'Сегодня в 19:39',
  });

  final int bpmLast;
  final int bpmAverage;
  final String lastMeasuringTime;
}
