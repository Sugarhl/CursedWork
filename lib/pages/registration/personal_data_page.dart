import 'package:auto_route/auto_route.dart';
import 'package:cursed_work/navigation/router.dart';
import 'package:cursed_work/utils/ui_kit.dart';
import 'package:cursed_work/widgets/input_field.dart';
import 'package:cursed_work/widgets/main_button.dart';
import 'package:cursed_work/widgets/top_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PersonalDataPage extends StatefulWidget {
  const PersonalDataPage({Key? key}) : super(key: key);

  @override
  PersonalDataPageState createState() => PersonalDataPageState();
}

class PersonalDataPageState extends State<PersonalDataPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController surnameController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  final activeButton = false.obs;

  @override
  void initState() {
    super.initState();

    nameController.addListener(setActive);
    surnameController.addListener(setActive);
    dateController.addListener(setActive);
  }

  void setActive() {
    activeButton.value = nameController.text.isNotEmpty &&
        surnameController.text.isNotEmpty &&
        dateController.text.isNotEmpty;
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
                  TopBar(
                    leftAction: () {
                      context.navigateBack();
                    },
                  ),
                  const SizedBox(height: 113),
                  Text('Персональные данные', style: AppTextStyles.heading2()),
                  const SizedBox(height: 34),
                  InputField(
                    label: 'Имя',
                    hintText: 'Введите имя',
                    controller: nameController,
                    keyboardType: TextInputType.text,
                    capitalization: TextCapitalization.sentences,
                    focus: true,
                  ),
                  const SizedBox(height: 47),
                  InputField(
                    label: 'Фамилия',
                    hintText: 'Введите пароль еще раз',
                    keyboardType: TextInputType.text,
                    controller: surnameController,
                    focus: true,
                  ),
                  const SizedBox(height: 47),
                  InputField(
                    label: 'Дата рождения',
                    hintText: 'ДД.ММ.ГГГГ',
                    keyboardType: TextInputType.datetime,
                    controller: dateController,
                    focus: true,
                    datePicker: true,
                  ),
                  const SizedBox(height: 111),
                  Obx(
                    () => AppButton(
                      onTap: () {
                        context.navigateTo(const BiometricsRouter());
                      },
                      unlocked: activeButton.value,
                    ),
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
