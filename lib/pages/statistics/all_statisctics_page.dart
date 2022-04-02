import 'package:cursed_work/repositories/credentials_repository.dart';
import 'package:cursed_work/utils/ui_kit.dart';
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
        child: Center(
          child: Container(
            width: 100,
            height: 100,
            color: AppColors.light,
            child: Text(
              'Empty state',
              style: AppTextStyles.heading1(),
            ),
          ),
        ),
      ),
    );
  }
}
