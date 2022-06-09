import 'package:auto_route/auto_route.dart';
import 'package:cursed_work/controllers/settings_controller.dart';
import 'package:cursed_work/navigation/router.gr.dart';
import 'package:cursed_work/repositories/credentials_repository.dart';
import 'package:cursed_work/utils/assets.dart';
import 'package:cursed_work/utils/enums.dart';
import 'package:cursed_work/utils/sizes.dart';
import 'package:cursed_work/utils/ui_kit.dart';
import 'package:cursed_work/validation/fields.dart';
import 'package:cursed_work/widgets/input_field.dart';
import 'package:cursed_work/widgets/main_button.dart';
import 'package:cursed_work/widgets/settings_menu.dart';
import 'package:cursed_work/widgets/top_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  SettingsPageState createState() => SettingsPageState();
}

class SettingsPageState extends State<SettingsPage> {
  final _email = TextEditingController();
  final _surnameController = TextEditingController();
  final _dateController = TextEditingController();
  final _heightController = TextEditingController();
  final _weightController = TextEditingController();
  final _activeButton = false.obs;

  final nameError = ''.obs;
  final surnameError = ''.obs;
  final dateError = ''.obs;
  final heightError = ''.obs;
  final weightError = ''.obs;

  @override
  void initState() {
    super.initState();

    _email.addListener(() {
      nameError.value = getNameErrorMessage(
        Name.dirty(value: _email.text).error,
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
    _heightController.addListener(() {
      heightError.value = getHeightErrorMessage(
        Height.dirty(value: _heightController.text).error,
      );
      setButton();
    });
    _weightController.addListener(() {
      weightError.value = getHeightErrorMessage(
        Weight.dirty(value: _weightController.text).error,
      );
      setButton();
    });
  }

  final _preferencesKey = GlobalKey();
  final ImagePicker _picker = ImagePicker();
  final CredentialsRepository credentialsRepository = Get.find();
  final SettingsController _settingsController = Get.find();

  @override
  void didChangeDependencies() {
    setAllFields();

    super.didChangeDependencies();
  }

  Future<void> setAllFields() async {
    await _settingsController.load();
    _email.text = _settingsController.email.value;
    _email.addListener(() {
      setButton();
    });
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
                const SizedBox(height: 70),
                Text('Ваши данные', style: AppTextStyles.heading2()),
                const SizedBox(height: 34),
                InputField(
                  label: 'Почта',
                  hintText: 'Введите почту',
                  controller: _email,
                  keyboardType: TextInputType.text,
                  capitalization: TextCapitalization.sentences,
                  errorString: nameError,
                ),
                const Spacer(),
                Obx(
                  () => AppButton(
                    text: 'Сохранить',
                    onTap: () {
                      _settingsController.updateSettings(
                        email: _email.text,
                      );
                      context.router.pop();
                    },
                    unlocked: _activeButton.value,
                  ),
                ),
                const SizedBox(height: 50),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void setButton() {
    _activeButton.value = Email.dirty(value: _email.text).valid;
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
            context.router.replaceAll([const EmailRouter()]);
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
