import 'package:cursed_work/controllers/settings_controller.dart';
import 'package:cursed_work/utils/enums.dart';
import 'package:cursed_work/utils/ui_kit.dart';
import 'package:cursed_work/widgets/gender_button.dart';
import 'package:cursed_work/widgets/input_field.dart';
import 'package:cursed_work/widgets/main_button.dart';
import 'package:cursed_work/widgets/top_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BiometricsPage extends StatefulWidget {
  const BiometricsPage({Key? key}) : super(key: key);

  @override
  BiometricsPageState createState() => BiometricsPageState();
}

class BiometricsPageState extends State<BiometricsPage> {
  final SettingsController _settingsController = Get.find();
  final TextEditingController heightController = TextEditingController();
  final TextEditingController weightController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.dark,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: NotificationListener<OverscrollIndicatorNotification>(
            onNotification: (overscroll) {
              overscroll.disallowIndicator();
              return false;
            },
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TopBar(leftAction: () {}),
                  const SizedBox(height: 113),
                  Text('Биометрия', style: AppTextStyles.heading2()),
                  const SizedBox(height: 34),
                  InputField(
                    label: 'Рост',
                    hintText: 'Введите рост',
                    controller: heightController,
                    focus: true,
                    onChanged: (s) {
                      setState(() {});
                    },
                  ),
                  const SizedBox(height: 47),
                  InputField(
                    label: 'Вес',
                    hintText: 'Введите вес',
                    controller: weightController,
                    focus: true,
                  ),
                  const SizedBox(height: 47),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 7),
                    child: Text('Пол', style: AppTextStyles.button1()),
                  ),
                  Row(
                    children: [
                      Obx(
                        () => GenderButton(
                          gender: Gender.male,
                          onTap: _settingsController.changeGender,
                          active: _settingsController.gender.value == Gender.male,
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Obx(
                        () => GenderButton(
                          gender: Gender.female,
                          onTap: _settingsController.changeGender,
                          active:
                              _settingsController.gender.value == Gender.female,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 111),
                  AppButton(
                    onTap: () async {},
                    unlocked: heightController.text.isNotEmpty &&
                        weightController.text.isNotEmpty,
                  ),
                  const SizedBox(height: 50),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
