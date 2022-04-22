import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:cursed_work/controllers/registration_controller.dart';
import 'package:cursed_work/navigation/router.gr.dart';
import 'package:cursed_work/pages/loading_page.dart';
import 'package:cursed_work/repositories/credentials_repository.dart';
import 'package:cursed_work/utils/bound.dart';
import 'package:cursed_work/utils/sizes.dart';
import 'package:cursed_work/utils/ui_kit.dart';
import 'package:cursed_work/utils/util_functions.dart';
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
  final LoginController loginController = Get.find();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final visible = true.obs;
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
      loginController.emailError.value = getEmailErrorMessage(
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
                errorString: loginController.emailError,
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
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const Spacer(),
                          Obx(
                            () => Padding(
                              padding: const EdgeInsets.only(bottom: 6),
                              child: Text(
                                loginController.remoteError.value,
                                style: AppTextStyles.mainText()
                                    .copyWith(color: AppColors.orange),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Obx(
                        () => AppButton(
                          onTap: () {
                            loginTap(context);
                          },
                          loading: loginController.remoteLoading.value,
                          unlocked: active.value,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Obx(
                () => Visibility(
                  visible: visible.value,
                  child: const SizedBox(height: 10),
                ),
              ),
              Obx(
                () => Visibility(
                  visible: visible.value,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const Spacer(),
                          Obx(
                            () => Padding(
                              padding: const EdgeInsets.only(bottom: 6),
                              child: Text(
                                loginController.remoteGoogleError.value,
                                style: AppTextStyles.mainText()
                                    .copyWith(color: AppColors.orange),
                              ),
                            ),
                          ),
                        ],
                      ),
                      AppButton(
                        text: 'Войти через Google',
                        onTap: () {
                          loginGoogleTap(context);
                        },
                        loading: loginController.remoteGoogleLoading.value,
                        unlocked: true,
                        swapColors: true,
                      ),
                    ],
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

  Future<void> loginTap(BuildContext context) async {
    final router = context.router;
    final inet = await checkInetConnection(context);
    if (!inet) {
      return;
    }
    final sucsess = await loginController.login(
      login: emailController.text,
      password: passwordController.text,
    );
    if (sucsess) {
      await router.navigate(MainRouter());
    }
  }

  Future<void> loginGoogleTap(BuildContext context) async {
    final router = context.router;
    final sucsess = await loginController.loginWithGoogle();
    if (sucsess) {
      await router.navigate(MainRouter());
    }
  }
}
