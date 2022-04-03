import 'package:auto_route/auto_route.dart';
import 'package:cursed_work/controllers/settings_controller.dart';
import 'package:cursed_work/navigation/router.dart';
import 'package:cursed_work/navigation/router.gr.dart';
import 'package:cursed_work/repositories/credentials_repository.dart';
import 'package:cursed_work/utils/assets.dart';
import 'package:cursed_work/utils/enums.dart';
import 'package:cursed_work/utils/ui_kit.dart';
import 'package:cursed_work/widgets/avatar_adder.dart';
import 'package:cursed_work/widgets/gender_button.dart';
import 'package:cursed_work/widgets/input_field.dart';
import 'package:cursed_work/widgets/main_button.dart';
import 'package:cursed_work/widgets/settings_menu.dart';
import 'package:cursed_work/widgets/top_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  SettingsPageState createState() => SettingsPageState();
}

class SettingsPageState extends State<SettingsPage> {
  final _nameController = TextEditingController();
  final _surnameController = TextEditingController();
  final _dateController = TextEditingController();
  final _heightController = TextEditingController();
  final _weightController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  final _preferencesKey = GlobalKey();
  final ImagePicker _picker = ImagePicker();
  final CredentialsRepository credentialsRepository = Get.find();
  final SettingsController _settingsController = Get.find();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
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
                    rightAction: () {
                      showSettingsMenu(context);
                    },
                    rightWidget: SizedBox(
                      key: _preferencesKey,
                      width: 24,
                      height: 24,
                      child: Center(
                        child: SvgPicture.asset(
                          Assets.options,
                          width: 28,
                          height: 7,
                          color: AppColors.light,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 50),
                  Center(
                    child: AvatarAdder(
                      loading: !_settingsController.loaded.value,
                      localPath: '',
                      size: 150,
                      smallCamera: true,
                    ),
                  ),
                  const SizedBox(height: 40),
                  Text('Персональные данные', style: AppTextStyles.heading2()),
                  const SizedBox(height: 34),
                  InputField(
                    label: 'Имя',
                    hintText: 'Введите имя',
                    controller: _nameController,
                    keyboardType: TextInputType.text,
                    capitalization: TextCapitalization.sentences,
                    focus: true,
                  ),
                  const SizedBox(height: 47),
                  InputField(
                    label: 'Фамилия',
                    hintText: 'Введите пароль еще раз',
                    keyboardType: TextInputType.text,
                    controller: _surnameController,
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
                  ),
                  const SizedBox(height: 40),
                  Text('Биометрия', style: AppTextStyles.heading2()),
                  const SizedBox(height: 34),
                  InputField(
                    label: 'Рост',
                    hintText: 'Введите рост',
                    controller: _heightController,
                    focus: true,
                    onChanged: (s) {
                      setState(() {});
                    },
                  ),
                  const SizedBox(height: 47),
                  InputField(
                    label: 'Вес',
                    hintText: 'Введите вес',
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
                  const SizedBox(height: 50),
                  AppButton(
                    text: 'Сохранить',
                    onTap: () {
                      context.navigateTo(const AvatarRouter());
                    },
                    unlocked: true,
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

  void showSettingsMenu(BuildContext context) {
    final buttonBox =
        _preferencesKey.currentContext?.findRenderObject() as RenderBox?;
    final position = buttonBox!.localToGlobal(Offset.zero);

    final overlay =
        Overlay.of(context)?.context.findRenderObject() as RenderBox?;
    showMenu(
      context: context,
      position: RelativeRect.fromRect(
        Offset(position.dx, position.dy) & const Size(40, 40),
        Offset.zero & overlay!.size,
      ),
      items: [
        PostMenu(
          onLogout: () {
            credentialsRepository.logout();
            context.router.replaceAll([const WelcomeRouter()]);
            Navigator.pop<SettingsMenuAction>(
              context,
              SettingsMenuAction.logout,
            );
            FocusScope.of(context).unfocus();
          },
        )
      ],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      color: AppColors.dark,
    );
  }
}
