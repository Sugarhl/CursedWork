import 'package:auto_route/auto_route.dart';
import 'package:cursed_work/controllers/settings_controller.dart';
import 'package:cursed_work/navigation/router.gr.dart';
import 'package:cursed_work/utils/sizes.dart';
import 'package:cursed_work/utils/ui_kit.dart';
import 'package:cursed_work/widgets/avatar_adder.dart';
import 'package:cursed_work/widgets/main_button.dart';
import 'package:cursed_work/widgets/top_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AvatarPage extends StatefulWidget {
  const AvatarPage({Key? key}) : super(key: key);

  @override
  AvatarPageState createState() => AvatarPageState();
}

class AvatarPageState extends State<AvatarPage> {
  @override
  void initState() {
    super.initState();
  }

  final path = ''.obs;
  final loading = true.obs;
  final ImagePicker _picker = ImagePicker();
  final SettingsController _settingsController = Get.find();

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
              Text('Добавьте фотографию', style: AppTextStyles.heading2()),
              const SizedBox(height: 80),
              Center(
                child: Obx(
                  () => AvatarAdder(
                    localPath: path.value,
                    size: 200,
                    onPressed: () async {
                      final image = await _picker.pickImage(
                        source: ImageSource.gallery,
                      );
                      if (image != null) {
                        path.value = image.path;
                      }
                    },
                    loading: loading.value,
                  ),
                ),
              ),
              const Spacer(),
              AppButton(
                onTap: () {
                  _settingsController.updateSettings(avatarLocal: path.value);
                  context.navigateTo(MainRouter());
                },
                unlocked: true,
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
