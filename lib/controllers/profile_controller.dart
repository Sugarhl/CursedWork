import 'package:cursed_work/repositories/credentials_repository.dart';
import 'package:cursed_work/utils/models/device_model.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  final loaded = true.obs;

  final bpm = 80.obs;
  final steps = 10500.obs;

  final List<DeviceModel> devices = [
    DeviceModel(name: 'Samsung smart watch 3', id: 'id'),
    DeviceModel(name: 'Mi Smart Band 5', id: 'id'),
  ].obs;

  final CredentialsRepository credentialsRepository = Get.find();

  Future<void> load() async {
    loaded.value = false;
    print('load');
    loaded.value = true;
  }

  Future<void> addDevice(DeviceModel device) async {}
}
