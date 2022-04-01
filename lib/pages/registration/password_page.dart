import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:cursed_work/navigation/router.gr.dart';
import 'package:cursed_work/utils/bound.dart';
import 'package:cursed_work/utils/ui_kit.dart';
import 'package:cursed_work/widgets/input_field.dart';
import 'package:cursed_work/widgets/main_button.dart';
import 'package:cursed_work/widgets/top_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:get/get.dart';

class PasswordPage extends StatefulWidget {
  const PasswordPage({Key? key}) : super(key: key);

  @override
  PasswordPageState createState() => PasswordPageState();
}

class PasswordPageState extends State<PasswordPage> {
  TextEditingController passwordController = TextEditingController();
  TextEditingController verifyController = TextEditingController();

  final visible = false.obs;

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
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TopBar(leftAction: () {
                context.navigateBack();
              }),
              const SizedBox(height: 113),
              Text('Безопасность', style: AppTextStyles.heading2()),
              const SizedBox(height: 34),
              InputField(
                label: 'Пароль',
                hintText: 'Введите пароль',
                keyboardType: TextInputType.visiblePassword,
                controller: passwordController,
                focus: true,
              ),
              const SizedBox(height: 47),
              InputField(
                label: 'Подтвердите пароль',
                hintText: 'Введите пароль еще раз',
                keyboardType: TextInputType.visiblePassword,
                controller: verifyController,
                focus: true,
              ),
              const Spacer(),
              Obx(
                () => Visibility(
                  visible: visible.value,
                  child: AppButton(
                    onTap: () {
                      context.navigateTo(const PersonalDataRouter());
                    },
                    unlocked: passwordController.text.isNotEmpty &&
                        verifyController.text == passwordController.text,
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
