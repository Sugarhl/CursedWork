import 'package:cursed_work/repositories/credentials_repository.dart';
import 'package:cursed_work/utils/enums.dart';
import 'package:fixnum/fixnum.dart';
import 'package:get/get.dart';

class SettingsController extends GetxController {
  final loaded = true.obs;

  final username = 'sugarhl'.obs;
  final name = 'Никита'.obs;
  final surname = 'Сахаров'.obs;
  final date = DateTime(0).obs;
  final height = Int64(170).obs;
  final weight = Int64(1).obs;
  final gender = Gender.male.obs;
  final avatarRemote = ''.obs;
  final avatarLocal = ''.obs;

  final CredentialsRepository credentialsRepository = Get.find();

  Future<void> load() async {
    loaded.value = false;
    print('load');
    loaded.value = true;
  }

  void changeGender() {
    switch (gender.value) {
      case Gender.none:
        break;
      case Gender.male:
        gender.value = Gender.female;
        break;
      case Gender.female:
        gender.value = Gender.male;
        break;
    }
  }
}
