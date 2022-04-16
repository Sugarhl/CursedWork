import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:cursed_work/controllers/registration_controller.dart';
import 'package:cursed_work/controllers/settings_controller.dart';
import 'package:cursed_work/navigation/router.gr.dart';
import 'package:cursed_work/utils/bound.dart';
import 'package:cursed_work/utils/sizes.dart';
import 'package:cursed_work/utils/ui_kit.dart';
import 'package:cursed_work/validation/fields.dart';
import 'package:cursed_work/validation/forms.dart';
import 'package:cursed_work/widgets/input_field.dart';
import 'package:cursed_work/widgets/main_button.dart';
import 'package:cursed_work/widgets/top_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:formz/formz.dart';
import 'package:get/get.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  AccountPageState createState() => AccountPageState();
}

class AccountPageState extends State<AccountPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController nicknameController = TextEditingController();
  final emailError = ''.obs;
  final nicknameError = ''.obs;

  final SettingsController _settingsController = Get.find();
  final LoginController _loginController = Get.find();

  final visible = true.obs;
  final active = false.obs;

  @override
  void initState() {
    super.initState();
    final keyboardVisibilityController = KeyboardVisibilityController();
    keyboardVisibilityController.onChange.listen((vis) {
      if (vis == false) {
        sleep(Durations.button);
      }
      visible.value = !vis;
    });

    emailController.addListener(() {
      emailError.value = getEmailErrorMessage(
        Email.dirty(value: emailController.text).error,
      );
      setButton();
    });
    nicknameController.addListener(() {
      nicknameError.value = getNicknameErrorMessage(
        Nickname.dirty(value: nicknameController.text).error,
      );
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
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 52),
              TopBar(
                leftAction: () {
                  context.router.pop();
                },
              ),
              const SizedBox(height: 113),
              Text('Аккаунт', style: AppTextStyles.heading2()),
              const SizedBox(height: 34),
              InputField(
                label: 'Почта',
                hintText: 'Введите почту',
                keyboardType: TextInputType.emailAddress,
                controller: emailController,
                errorString: emailError,
              ),
              const SizedBox(height: 47),
              InputField(
                label: 'Никнейм',
                hintText: 'Введите никнейм',
                keyboardType: TextInputType.text,
                controller: nicknameController,
                errorString: nicknameError,
              ),
              const Spacer(),
              Obx(
                () => Visibility(
                  visible: visible.value,
                  child: AppButton(
                    onTap: () {
                      nextAction(context);
                    },
                    unlocked: active.value,
                  ),
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> nextAction(BuildContext context) async {
    active.value = false;
    if (await _loginController.checkLogin(nicknameController.text)) {
      await context.navigateTo(const PasswordRouter());
    } else {
      nicknameError.value = 'Никнейм уже занят';
    }
  }

  void setButton() {
    active.value = AccountForm(
          email: emailController.text,
          nickname: nicknameController.text,
        ).status ==
        FormzStatus.valid;
  }
}
