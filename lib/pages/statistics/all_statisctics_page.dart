import 'package:cursed_work/repositories/credentials_repository.dart';
import 'package:cursed_work/utils/models/bpm_model.dart';
import 'package:cursed_work/utils/models/steps_model.dart';
import 'package:cursed_work/utils/sizes.dart';
import 'package:cursed_work/utils/ui_kit.dart';
import 'package:cursed_work/widgets/previews/heartbeat_card.dart';
import 'package:cursed_work/widgets/previews/steps_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StatisticsPage extends StatefulWidget {
  const StatisticsPage({Key? key}) : super(key: key);

  @override
  StatisticsPageState createState() => StatisticsPageState();
}

class StatisticsPageState extends State<StatisticsPage> {
  @override
  void initState() {
    super.initState();
  }

  final CredentialsRepository credentialsRepository = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.dark,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding:
                  const EdgeInsets.only(left: AppSizes.pageInset, bottom: 3),
              child: Text(
                'Статистика',
                style: AppTextStyles.heading2(),
              ),
            ),
            const SizedBox(height: 20),
            StepsCard(
              data: StepsStatisticsModel(
                stepsGoal: 12000,
                stepsCount: 5000,
                distance: 1.5,
              ),
              onTap: () {},
            ),
            const SizedBox(height: 10),
            BpmCard(
              data: BpmStatisticsModel(bpmAverage: 78, bpmLast: 85),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
