import 'package:cursed_work/grpc/generated/auth.pbgrpc.dart';
import 'package:cursed_work/repositories/credentials_repository.dart';
import 'package:cursed_work/validation/fields.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  Email email = Email.pure();

  final CredentialsRepository credentialsRepository = Get.find();

  Future<bool> checkLogin(String login) async {
    final res = await credentialsRepository
        .client<AuthServiceClient>()
        .checkLogin(CheckLoginRequest(login: ''));
    return res.status == Status.SUCCESS;
  }

  Future<bool> register(String login, String password) async {
    final res = await credentialsRepository
        .client<AuthServiceClient>()
        .registration(RegistrationRequest(login: login, password: password));
    return res.status == Status.SUCCESS;
  }
}
