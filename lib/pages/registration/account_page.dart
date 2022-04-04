import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:cursed_work/controllers/settings_controller.dart';
import 'package:cursed_work/navigation/router.gr.dart';
import 'package:cursed_work/utils/bound.dart';
import 'package:cursed_work/utils/ui_kit.dart';
import 'package:cursed_work/widgets/input_field.dart';
import 'package:cursed_work/widgets/main_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:get/get.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  AccountPageState createState() => AccountPageState();
}

class AccountPageState extends State<AccountPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController nicknameController = TextEditingController();
  final SettingsController _settingsController = Get.find();

  final visible = false.obs;
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.dark,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 52),
              // TopBar(
              //   leftAction: () {
              //     // context.navigateBack();
              //   },
              // ),
              const SizedBox(height: 113),
              Text('Аккаунт', style: AppTextStyles.heading2()),
              const SizedBox(height: 34),
              InputField(
                label: 'Почта',
                hintText: 'Введите почту',
                keyboardType: TextInputType.emailAddress,
                controller: emailController,
                focus: true,
                onChanged: (s) {
                  setState(() {});
                },
              ),
              const SizedBox(height: 47),
              InputField(
                label: 'Никнейм',
                hintText: 'Введите никнейм',
                keyboardType: TextInputType.text,
                controller: nicknameController,
                focus: true,
                onChanged: (s) {
                  setState(() {});
                },
              ),
              const Spacer(),
              Obx(
                () => Visibility(
                  visible: visible.value,
                  child: AppButton(
                    onTap: () {
                      context.navigateTo(const PasswordRouter());
                    },
                    unlocked: emailController.text.isNotEmpty &&
                        nicknameController.text.isNotEmpty,
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
