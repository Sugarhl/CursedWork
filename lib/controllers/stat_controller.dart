import 'package:cursed_work/repositories/credentials_repository.dart';
import 'package:cursed_work/utils/models/bpm_model.dart';
import 'package:cursed_work/utils/models/sleep_model.dart';
import 'package:cursed_work/utils/models/steps_model.dart';
import 'package:get/get.dart';

class StatisticsController extends GetxController {
  final loaded = true.obs;

  final stepsModel = StepsStatisticsModel(
    stepsGoal: 12000,
    stepsCount: 5000,
    distance: 1.5,
  ).obs;
  final bpmModel = BpmStatisticsModel(bpmAverage: 78, bpmLast: 85).obs;
  final sleepModel = SleepStatisticsModel(currentMark: 96, averageMark: 60).obs;

  final CredentialsRepository credentialsRepository = Get.find();

  Future<void> load() async {
    loaded.value = false;
    print('load');
    loaded.value = true;
  }
}
