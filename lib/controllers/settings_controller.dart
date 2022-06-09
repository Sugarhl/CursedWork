import 'package:cursed_work/repositories/credentials_repository.dart';
import 'package:get/get.dart';

class SettingsController extends GetxController {
  final loaded = true.obs;

  final email = 'sugarhl'.obs;

  final CredentialsRepository credentialsRepository = Get.find();

  Future<void> load() async {
    loaded.value = false;
    loaded.value = true;
  }

  Future<void> updateSettings({
    String? email,
    bool syncToServer = true,
  }) async {
    this.email.value = email ?? this.email.value;
    if (syncToServer) {
      //ToDo:: Send request
    }
  }
}
