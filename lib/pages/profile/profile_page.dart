import 'package:cursed_work/controllers/settings_controller.dart';
import 'package:cursed_work/repositories/credentials_repository.dart';
import 'package:cursed_work/utils/ui_kit.dart';
import 'package:cursed_work/widgets/avatar_adder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  ProfilePageState createState() => ProfilePageState();
}

class ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    super.initState();
  }

  final _preferencesKey = GlobalKey();
  final CredentialsRepository credentialsRepository = Get.find();
  final SettingsController _settings = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.dark,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: NotificationListener<OverscrollIndicatorNotification>(
            onNotification: (overscroll) {
              overscroll.disallowIndicator();
              return false;
            },
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Obx(
                        () => Padding(
                          padding: const EdgeInsets.only(left: 16),
                          child: Text(
                            '@${_settings.username.value}',
                            style: AppTextStyles.heading2(),
                          ),
                        ),
                      ),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(right: 16),
                        child: InkWell(
                          highlightColor: AppColors.light.withOpacity(0.3),
                          splashColor: AppColors.light.withOpacity(0.3),
                          radius: 20,
                          child: Container(
                            height: 24,
                            width: 24,
                            alignment: Alignment.center,
                            decoration:
                                const BoxDecoration(shape: BoxShape.circle),
                            child: SvgPicture.asset(
                              'assets/settings.svg',
                              height: 22,
                              width: 22,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 50),
                  Center(
                    child: Obx(
                      () => AvatarAdder(
                        loading: !_settings.loaded.value,
                        localPath: _settings.avatarLocal.value,
                        size: 110,
                        smallCamera: true,
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      '${_settings.name.value} ${_settings.surname.value}',
                      style: AppTextStyles.heading2(),
                    ),
                  ),
                  const SizedBox(height: 50),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
