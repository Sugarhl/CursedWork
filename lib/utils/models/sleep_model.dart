class SleepStatisticsModel {
  SleepStatisticsModel({
    required this.currentMark,
    required this.averageMark,
    this.hours = 7.6,
    this.lastSleepTime = '22:30',
  });

  final int currentMark;
  final double hours;
  final String lastSleepTime;
  final int averageMark;
}
