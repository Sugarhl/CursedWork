import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:cursed_work/navigation/router.gr.dart';
import 'package:cursed_work/utils/bound.dart';
import 'package:cursed_work/utils/sizes.dart';
import 'package:cursed_work/utils/ui_kit.dart';
import 'package:cursed_work/validation/fields.dart';
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

    passwordController.addListener(() {
      passwordError.value = getPasswordErrorMessage(
        Password.dirty(value: passwordController.text).error,
      );
      if (passwordController.text != repeatedController.text) {
        repeatedError.value = 'Пароли не совпадают';
      } else {
        repeatedError.value = '';
      }
    });
    repeatedController.addListener(() {
      if (passwordController.text != repeatedController.text) {
        repeatedError.value = 'Пароли не совпадают';
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
              TopBar(
                leftAction: () {
                  context.router.pop();
                },
              ),
              const SizedBox(height: 113),
              Text('Безопасность', style: AppTextStyles.heading2()),
              const SizedBox(height: 34),
              InputField(
                label: 'Пароль',
                hintText: 'Введите пароль',
                keyboardType: TextInputType.visiblePassword,
                controller: passwordController,
                errorString: passwordError,
                obscureText: obscure,
                onObscureTap: () {
                  setState(() {
                    obscure = !obscure;
                  });
                },
              ),
              const SizedBox(height: 47),
              InputField(
                label: 'Подтвердите пароль',
                hintText: 'Введите пароль еще раз',
                keyboardType: TextInputType.visiblePassword,
                controller: repeatedController,
                obscureText: obscure,
                errorString: repeatedError,
                onObscureTap: () {
                  setState(() {
                    obscure = !obscure;
                  });
                },
              ),
              const Spacer(),
              Obx(
                () => Visibility(
                  visible: visible.value,
                  child: AppButton(
                    onTap: () {
                      context.navigateTo(const PersonalDataRouter());
                    },
                    unlocked:
                        Password.dirty(value: passwordController.text).valid &&
                            repeatedController.text == passwordController.text,
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
