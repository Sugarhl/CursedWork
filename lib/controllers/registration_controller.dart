import 'package:cursed_work/repositories/credentials_repository.dart';
import 'package:cursed_work/utils/enums.dart';
import 'package:cursed_work/utils/util_functions.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginController extends GetxController {
  final CredentialsRepository credentialsRepository = Get.find();
  final emailError = ''.obs;

  final remoteError = ''.obs;
  final remoteLoading = false.obs;

  final remoteGoogleError = ''.obs;
  final remoteGoogleLoading = false.obs;

  Future<bool> checkLogin({required String login}) async {
    // final res = await credentialsRepository
    //     .client<AuthServiceClient>()
    //     .checkLogin(CheckLoginRequest(login: ''));
    // return res.status == Status.SUCCESS;
    return true;
  }

  Future<bool> register(
      {required String login, required String password}) async {
    // final res = await credentialsRepository
    //     .client<AuthServiceClient>()
    //     .registration(RegistrationRequest(login: login, password: password));
    // return res.status == Status.SUCCESS;
    return true;
  }

  Future<bool> login({
    required String login,
    required String password,
  }) async {
    _refreshErrors();
    remoteLoading.value = true;
    final res = 'accessToken';
    try {
    } catch (e) {
      remoteError.value = errorToMessage(AppError.serverError);
      remoteLoading.value = false;
      return false;
    }
    await credentialsRepository.login(res);
    remoteError.value = errorToMessage(AppError.none);
    remoteLoading.value = false;
    return true;
  }


  Future<bool> loginWithGoogle() async {
    _refreshErrors();
    GoogleSignInAccount? signIn;
    remoteGoogleLoading.value = true;
    try {
      final _googleSignIn = GoogleSignIn(
        scopes: [
          'email',
        ],
      );
      signIn = await _googleSignIn.signIn();
      final googleToken = await signIn!.authentication;
      // final token =
      //     await credentialsRepository.client<AuthServiceClient>().loginWithGoogle(
      //           LoginWithGoogleRequest()
      //             ..googleAccessToken = googleToken.accessToken!,
      //         );

      await credentialsRepository.login(googleToken.idToken!);
    } catch (e) {
      remoteGoogleError.value = errorToMessage(AppError.googleError);
      remoteGoogleLoading.value = false;
      return false;
    }
    remoteGoogleLoading.value = false;
    return true;
  }

  void _refreshErrors() {
    remoteError.value = '';
    remoteGoogleError.value = '';
  }
}
