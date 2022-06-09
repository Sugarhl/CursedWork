import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:cursed_work/navigation/router.gr.dart';
import 'package:cursed_work/utils/bound.dart';
import 'package:cursed_work/utils/sizes.dart';
import 'package:cursed_work/utils/ui_kit.dart';
import 'package:cursed_work/widgets/input_field.dart';
import 'package:cursed_work/widgets/main_button.dart';
import 'package:cursed_work/widgets/top_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:get/get.dart';

class CreatePostPage extends StatefulWidget {
  const CreatePostPage({Key? key, required this.channel}) : super(key: key);

  final String channel;

  @override
  CreatePostPageState createState() => CreatePostPageState();
}

class CreatePostPageState extends State<CreatePostPage> {
  TextEditingController titleController = TextEditingController();
  TextEditingController textController = TextEditingController();

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
          padding: const EdgeInsets.symmetric(horizontal: AppSizes.pageInset),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TopBar(
                leftAction: () {
                  context.router.pop();
                },
                centerLabel: 'Новый пост',
                centerStyle: AppTextStyles.button1(),
              ),
              const SizedBox(height: 30),
              InputField(
                label: 'Название',
                hintText: 'Введите название',
                keyboardType: TextInputType.emailAddress,
                controller: titleController,
              ),
              const SizedBox(height: 47),
              InputField(
                label: 'Описание',
                maxLines: 10,
                height: 200,
                hintText: 'Введите описание',
                keyboardType: TextInputType.emailAddress,
                controller: textController,
              ),
              const Spacer(),
              Obx(
                () => Visibility(
                  visible: visible.value,
                  child: AppButton(
                    text: 'Опубликовать',
                    onTap: () {
                      context.navigateTo(const FeedRouter());
                    },
                    unlocked: titleController.text.isNotEmpty &&
                        textController.text.isNotEmpty,
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
