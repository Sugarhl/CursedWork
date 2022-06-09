import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum CredentialsState { idle, loggedIn, loggedOut }

class CredentialsRepository extends GetxController {
  SharedPreferences? _prefs;

  Future<SharedPreferences> _getPrefs() async {
    _prefs ??= await SharedPreferences.getInstance();
    return _prefs!;
  }

  final accessToken = ''.obs;
  final state = CredentialsState.idle.obs;

  Future<void> logout() async {
    final prefs = await _getPrefs();
    await prefs.remove('access_token');
    state.value = CredentialsState.loggedOut;
  }

  Future<void> login(
    String accessToken,
  ) async {
    final prefs = await _getPrefs();
    await prefs.setString('access_token', accessToken);
    this.accessToken.value = accessToken;
    state.value = CredentialsState.loggedIn;
  }

  Future<void> restoreCredentials() async {
    state.value = CredentialsState.idle;
    final prefs = await _getPrefs();
    final token = prefs.getString('access_token');
    if (token != null) {
      accessToken.value = token;
      state.value = CredentialsState.loggedIn;
    } else {
      state.value = CredentialsState.loggedOut;
    }
  }

  Future<void> setAvatar(String path) async {
    final prefs = await _getPrefs();
    await prefs.setString('avatar', path);
  }

  Future<String> getAvatar() async {
    final prefs = await _getPrefs();
    return prefs.getString('avatar') ?? '';
  }
}
