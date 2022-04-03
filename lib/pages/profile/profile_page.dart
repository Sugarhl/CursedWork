import 'package:auto_route/auto_route.dart';
import 'package:cursed_work/controllers/profile_controller.dart';
import 'package:cursed_work/controllers/settings_controller.dart';
import 'package:cursed_work/navigation/router.gr.dart';
import 'package:cursed_work/repositories/credentials_repository.dart';
import 'package:cursed_work/utils/assets.dart';
import 'package:cursed_work/utils/enums.dart';
import 'package:cursed_work/utils/ui_kit.dart';
import 'package:cursed_work/widgets/avatar.dart';
import 'package:cursed_work/widgets/previews/device_preview.dart';
import 'package:cursed_work/widgets/previews/metrics_preview.dart';
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
  final ProfileController _profile = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.dark,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 26),
          child: NotificationListener<OverscrollIndicatorNotification>(
            onNotification: (overscroll) {
              overscroll.disallowIndicator();
              return false;
            },
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildTopBar(context),
                  const SizedBox(height: 20),
                  Center(
                    child: Obx(
                      () => Avatar(
                        url: _settings.avatarLocal.value,
                        size: 110,
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Center(
                    child: Text(
                      '${_settings.name.value} ${_settings.surname.value}',
                      style: AppTextStyles.heading2(),
                    ),
                  ),
                  const SizedBox(height: 30),
                  buildUserMetrics(),
                  const SizedBox(height: 35),
                  Text(
                    'Мои устройства',
                    style: AppTextStyles.button1(),
                  ),
                  const SizedBox(height: 10),
                  ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      if (index == _profile.devices.length) {
                        return DevicePreview.plus(
                          onTap: () {
                            print('plus');
                          },
                        );
                      }
                      return DevicePreview(device: _profile.devices[index]);
                    },
                    separatorBuilder: (context, index) => SizedBox(
                      height: index == _profile.devices.length - 1 ? 12 : 8,
                    ),
                    itemCount: _profile.devices.length + 1,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Row buildUserMetrics() {
    return Row(
      children: [
        Obx(
          () => Expanded(
            child: MetricsPreview(
              type: MetricsType.bpm,
              value: _profile.bpm.value,
            ),
          ),
        ),
        const SizedBox(width: 20),
        Obx(
          () => Expanded(
            child: MetricsPreview(
              type: MetricsType.steps,
              value: _profile.steps.value,
            ),
          ),
        ),
      ],
    );
  }

  Row buildTopBar(BuildContext context) {
    return Row(
      children: [
        Obx(
          () => Text(
            '@${_settings.username.value}',
            style: AppTextStyles.heading2(),
          ),
        ),
        const Spacer(),
        InkWell(
          borderRadius: BorderRadius.circular(24),
          onTap: () {
            context.navigateTo(const SettingsRouter());
          },
          highlightColor: AppColors.red.withOpacity(0.7),
          splashColor: AppColors.red.withOpacity(0.7),
          radius: 30,
          child: Container(
            height: 30,
            width: 30,
            alignment: Alignment.center,
            decoration: const BoxDecoration(shape: BoxShape.circle),
            child: SvgPicture.asset(
              Assets.settings,
              height: 22,
              width: 22,
            ),
          ),
        )
      ],
    );
  }
}
