import 'package:cursed_work/grpc/generated/auth.pbgrpc.dart';
import 'package:get/get.dart';
import 'package:grpc/grpc.dart';
import 'package:grpc/grpc_or_grpcweb.dart';
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

  final _authServiceChanel = GrpcOrGrpcWebClientChannel.grpc(
    'localhost',
    port: 8003,
    options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
  );

  T client<T>() {
    final callOptions = state.value == CredentialsState.loggedIn
        ? CallOptions(
            metadata: {'Sender': 'CLIENT', 'AccessToken': accessToken.value},
          )
        : CallOptions();
    switch (T) {
      case AuthServiceClient:
        return AuthServiceClient(_authServiceChanel, options: callOptions) as T;
    }
    throw Exception('Client type not found');
  }
}
