import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:cursed_work/navigation/router.gr.dart';
import 'package:cursed_work/repositories/credentials_repository.dart';
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

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final CredentialsRepository credentialsRepository = Get.find();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final visible = true.obs;
  final emailError = ''.obs;
  final active = false.obs;
  bool obscure = true;

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
      final check = Email.dirty(value: emailController.text);
      emailError.value = getEmailErrorMessage(
        check.error,
      );
      active.value = check.valid;
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
              TopBar(
                leftAction: () {
                  context.navigateBack();
                },
              ),
              const SizedBox(height: 113),
              Text('Вход', style: AppTextStyles.heading2()),
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
                label: 'Пароль',
                hintText: 'Введите пароль',
                keyboardType: TextInputType.text,
                controller: passwordController,
                obscureText: obscure,
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
                      loginTap(context);
                    },
                    unlocked: active.value,
                  ),
                ),
              ),
              Obx(
                () => Visibility(
                  visible: visible.value,
                  child: const SizedBox(height: 30),
                ),
              ),
              Obx(
                () => Visibility(
                  visible: visible.value,
                  child: AppButton(
                    text: 'Войти через Google',
                    onTap: () {
                      loginTap(context);
                    },
                    unlocked: true,
                    swapColors: true,
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

  void loginTap(BuildContext context) {
    credentialsRepository.login('accessToken');
    context.navigateTo(MainRouter());
  }
}
