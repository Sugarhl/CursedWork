import 'package:cursed_work/utils/assets.dart';
import 'package:cursed_work/utils/enums.dart';

String metricsTypeToAsset(MetricsType type) {
  switch (type) {
    case MetricsType.bpm:
      return Assets.bpm;
    case MetricsType.steps:
      return Assets.steps;
  }
}

String metricToLabel(MetricsType type, int value) {
  switch (type) {
    case MetricsType.bpm:
      return '$value bpm';
    case MetricsType.steps:
      return '${(value.toDouble() / 1000).toStringAsFixed(1)}k steps';
  }
}
