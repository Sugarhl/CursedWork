import 'package:auto_route/auto_route.dart';
import 'package:cursed_work/controllers/settings_controller.dart';
import 'package:cursed_work/navigation/router.gr.dart';
import 'package:cursed_work/utils/sizes.dart';
import 'package:cursed_work/utils/ui_kit.dart';
import 'package:cursed_work/validation/fields.dart';
import 'package:cursed_work/validation/forms.dart';
import 'package:cursed_work/widgets/input_field.dart';
import 'package:cursed_work/widgets/main_button.dart';
import 'package:cursed_work/widgets/top_bar.dart';
import 'package:flutter/material.dart';
import 'package:formz/formz.dart';
import 'package:get/get.dart';

class PersonalDataPage extends StatefulWidget {
  const PersonalDataPage({Key? key}) : super(key: key);

  @override
  PersonalDataPageState createState() => PersonalDataPageState();
}

class PersonalDataPageState extends State<PersonalDataPage> {
  final _nameController = TextEditingController();
  final _surnameController = TextEditingController();
  final _dateController = TextEditingController();
  final _activeButton = false.obs;
  final SettingsController _settingsController = Get.find();

  final nameError = ''.obs;
  final surnameError = ''.obs;
  final dateError = ''.obs;

  @override
  void initState() {
    super.initState();

    _nameController.addListener(() {
      nameError.value = getNameErrorMessage(
        Name.dirty(value: _nameController.text).error,
      );
      setButton();
    });
    _surnameController.addListener(() {
      surnameError.value = getNameErrorMessage(
        Name.dirty(value: _surnameController.text).error,
      );
      setButton();
    });
    _dateController.addListener(() {
      dateError.value = getDateErrorMessage(
        Date.dirty(value: _dateController.text).error,
      );
      setButton();
    });
  }

  void setButton() {
    _activeButton.value = PersonalForm(
          date: _dateController.text,
          surname: _surnameController.text,
          name: _nameController.text,
        ).status ==
        FormzStatus.valid;
  }

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
                  Text('Персональные данные', style: AppTextStyles.heading2()),
                  const SizedBox(height: 34),
                  InputField(
                    label: 'Имя',
                    hintText: 'Введите имя',
                    controller: _nameController,
                    keyboardType: TextInputType.text,
                    capitalization: TextCapitalization.sentences,
                    errorString: nameError,
                    focus: true,
                  ),
                  const SizedBox(height: 47),
                  InputField(
                    label: 'Фамилия',
                    hintText: 'Введите пароль еще раз',
                    keyboardType: TextInputType.text,
                    controller: _surnameController,
                    errorString: surnameError,
                    focus: true,
                  ),
                  const SizedBox(height: 47),
                  InputField(
                    label: 'Дата рождения',
                    hintText: 'ДД.ММ.ГГГГ',
                    keyboardType: TextInputType.datetime,
                    controller: _dateController,
                    focus: true,
                    datePicker: true,
                    errorString: dateError,
                  ),
                  const SizedBox(height: 111),
                  Obx(
                    () => AppButton(
                      onTap: () {
                        _settingsController.updateSettings(
                          name: _nameController.text,
                          surname: _surnameController.text,
                          date: _dateController.text,
                        );
                        context.navigateTo(const BiometricsRouter());
                      },
                      unlocked: _activeButton.value,
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
