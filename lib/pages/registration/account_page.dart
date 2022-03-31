import 'package:cursed_work/utils/ui_kit.dart';
import 'package:cursed_work/widgets/input_field.dart';
import 'package:cursed_work/widgets/main_button.dart';
import 'package:cursed_work/widgets/top_bar.dart';
import 'package:flutter/material.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  AccountPageState createState() => AccountPageState();
}

class AccountPageState extends State<AccountPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController nicknameController = TextEditingController();

  @override
  void initState() {
    super.initState();
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
              TopBar(leftAction: () {}),
              const SizedBox(height: 113),
              Text('Аккаунт', style: AppTextStyles.heading2()),
              const SizedBox(height: 34),
              InputField(
                label: 'Почта',
                hintText: 'Введите почту',
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
                controller: nicknameController,
                focus: true,
                onChanged: (s) {
                  setState(() {});
                },
              ),
              const Spacer(),
              AppButton(
                onTap: () async {
                  // if (controller.text.isNotEmpty) {
                  //   settings.initProfile();
                  //   await context.navigateTo(UserPreferencesRouter());
                  // }
                },
                unlocked: emailController.text.isNotEmpty &&
                    nicknameController.text.isNotEmpty,
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
