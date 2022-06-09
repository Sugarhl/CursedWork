import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:cursed_work/controllers/settings_controller.dart';
import 'package:cursed_work/navigation/router.gr.dart';
import 'package:cursed_work/utils/bound.dart';
import 'package:cursed_work/utils/sizes.dart';
import 'package:cursed_work/utils/ui_kit.dart';
import 'package:cursed_work/validation/fields.dart';
import 'package:cursed_work/widgets/input_field.dart';
import 'package:cursed_work/widgets/main_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:get/get.dart';

class EmailPage extends StatefulWidget {
  const EmailPage({Key? key}) : super(key: key);

  @override
  EmailPageState createState() => EmailPageState();
}

class EmailPageState extends State<EmailPage> {
  final SettingsController settingsController = Get.find();

  TextEditingController emailController = TextEditingController();
  TextEditingController repeatedController = TextEditingController();

  final visible = false.obs;
  bool obscure = true;
  final passwordError = ''.obs;
  final repeatedError = ''.obs;

  @override
  void initState() {
    super.initState();
    final keyboardVisibilityController = KeyboardVisibilityController();
    visible.value = !keyboardVisibilityController.isVisible;
    keyboardVisibilityController.onChange.listen((vis) {
      if (vis == false) {
        sleep(Durations.button);
      }
      visible.value = !vis;
    });

    emailController.addListener(() {
      passwordError.value = getEmailErrorMessage(
        Email.dirty(value: emailController.text).error,
      );
      if (emailController.text != repeatedController.text) {
        repeatedError.value = 'Почты не совпадают';
      } else {
        repeatedError.value = '';
      }
    });
    repeatedController.addListener(() {
      if (emailController.text != repeatedController.text) {
        repeatedError.value = 'Почты не совпадают';
      } else {
        repeatedError.value = '';
      }
    });
  }

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
          padding: const EdgeInsets.symmetric(horizontal: AppSizes.pageInset),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // TopBar(
              //   leftAction: () {
              //     context.router.pop();
              //   },
              // ),
              const SizedBox(height: 30),
              Text('SUDDENLY THE NEWS', style: AppTextStyles.heading1()),
              const SizedBox(height: 70),
              InputField(
                label: 'Почта',
                hintText: 'Введите почту',
                keyboardType: TextInputType.emailAddress,
                controller: emailController,
                errorString: passwordError,
              ),
              const SizedBox(height: 47),
              InputField(
                label: 'Подтвердите почту',
                hintText: 'Введите почту еще раз',
                keyboardType: TextInputType.emailAddress,
                controller: repeatedController,
                errorString: repeatedError,
              ),
              const Spacer(),
              Obx(
                () => Visibility(
                  visible: visible.value,
                  child: AppButton(
                    onTap: () {
                      settingsController.updateSettings(
                        email: emailController.text,
                      );
                      context.navigateTo(const ChannelsRouter());
                    },
                    unlocked: Email.dirty(value: emailController.text).valid &&
                        repeatedController.text == emailController.text,
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
}
