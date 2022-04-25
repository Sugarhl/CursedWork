import 'package:cursed_work/repositories/credentials_repository.dart';
import 'package:cursed_work/utils/enums.dart';
import 'package:fixnum/fixnum.dart';
import 'package:get/get.dart';

class SettingsController extends GetxController {
  final loaded = true.obs;

  final username = 'sugarhl'.obs;
  final name = 'Никита'.obs;
  final surname = 'Сахаров'.obs;
  final date = '26.03.2001'.obs;
  final height = Int64(170).obs;
  final weight = Int64(68).obs;
  final gender = Gender.male.obs;
  final avatarRemote = ''.obs;
  final avatarLocal = ''.obs;

  final CredentialsRepository credentialsRepository = Get.find();

  Future<void> load() async {
    loaded.value = false;
    avatarLocal.value = await credentialsRepository.getAvatar();
    loaded.value = true;
  }

  Future<void> updateSettings({
    String? username,
    String? name,
    String? surname,
    String? date,
    int? height,
    int? weight,
    Gender? gender,
    String? avatarLocal,
    bool syncToServer = true,
  }) async {
    this.username.value = username ?? this.username.value;
    this.name.value = name ?? this.name.value;
    this.surname.value = surname ?? this.surname.value;
    this.date.value = date ?? this.date.value;

    if (avatarLocal != null) {
      this.avatarLocal.value = avatarLocal;
      await credentialsRepository.setAvatar(avatarLocal);
    }
    this.gender.value = gender ?? this.gender.value;
    this.height.value = Int64(height ?? this.height.value.toInt());
    this.weight.value = Int64(weight ?? this.weight.value.toInt());
    if (syncToServer) {
      //ToDo:: Send request
    }
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
