import 'package:auto_route/auto_route.dart';
import 'package:cursed_work/controllers/settings_controller.dart';
import 'package:cursed_work/navigation/router.gr.dart';
import 'package:cursed_work/utils/enums.dart';
import 'package:cursed_work/utils/sizes.dart';
import 'package:cursed_work/utils/ui_kit.dart';
import 'package:cursed_work/validation/fields.dart';
import 'package:cursed_work/validation/forms.dart';
import 'package:cursed_work/widgets/gender_button.dart';
import 'package:cursed_work/widgets/input_field.dart';
import 'package:cursed_work/widgets/main_button.dart';
import 'package:cursed_work/widgets/top_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:formz/formz.dart';
import 'package:get/get.dart';

class BiometricsPage extends StatefulWidget {
  const BiometricsPage({Key? key}) : super(key: key);

  @override
  BiometricsPageState createState() => BiometricsPageState();
}

class BiometricsPageState extends State<BiometricsPage> {
  final SettingsController _settingsController = Get.find();
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  final heightError = ''.obs;
  final weightError = ''.obs;

  @override
  void initState() {
    super.initState();

    _heightController.addListener(() {
      heightError.value = getHeightErrorMessage(
        Height.dirty(value: _heightController.text).error,
      );
      setActive();
    });
    _weightController.addListener(() {
      heightError.value = getHeightErrorMessage(
        Weight.dirty(value: _weightController.text).error,
      );
      setActive();
    });
  }

  void setActive() {
    activeButton.value = BiometicsForm(
          height: _heightController.text,
          weight: _weightController.text,
        ).status ==
        FormzStatus.valid;
  }

  final activeButton = false.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.dark,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSizes.pageInset),
          child: NotificationListener<OverscrollIndicatorNotification>(
            onNotification: (overscroll) {
              overscroll.disallowIndicator();
              return false;
            },
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TopBar(
                    leftAction: () {
                      context.router.pop();
                    },
                  ),
                  const SizedBox(height: 113),
                  Text('Биометрия', style: AppTextStyles.heading2()),
                  const SizedBox(height: 34),
                  InputField(
                    label: 'Рост',
                    hintText: 'Введите рост',
                    controller: _heightController,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    focus: true,
                    onChanged: (s) {
                      setState(() {});
                    },
                  ),
                  const SizedBox(height: 47),
                  InputField(
                    label: 'Вес',
                    hintText: 'Введите вес',
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    controller: _weightController,
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
                          active:
                              _settingsController.gender.value == Gender.male,
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
                  Obx(
                    () => AppButton(
                      onTap: () {
                        _settingsController.updateSettings(
                          height: int.parse(_heightController.text),
                          weight: int.parse(_weightController.text),
                        );
                        context.navigateTo(const AvatarRouter());
                      },
                      unlocked: activeButton.value,
                    ),
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
