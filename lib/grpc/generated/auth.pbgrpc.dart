///
//  Generated code. Do not modify.
//  source: auth.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'auth.pb.dart' as $0;
export 'auth.pb.dart';

class AuthServiceClient extends $grpc.Client {
  static final _$checkLogin =
      $grpc.ClientMethod<$0.CheckLoginRequest, $0.CheckLoginResponse>(
          '/models.api.AuthService/CheckLogin',
          ($0.CheckLoginRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.CheckLoginResponse.fromBuffer(value));
  static final _$registration =
      $grpc.ClientMethod<$0.RegistrationRequest, $0.RegistrationResponse>(
          '/models.api.AuthService/Registration',
          ($0.RegistrationRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.RegistrationResponse.fromBuffer(value));

  AuthServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.CheckLoginResponse> checkLogin(
      $0.CheckLoginRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$checkLogin, request, options: options);
  }

  $grpc.ResponseFuture<$0.RegistrationResponse> registration(
      $0.RegistrationRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$registration, request, options: options);
  }
}

abstract class AuthServiceBase extends $grpc.Service {
  $core.String get $name => 'models.api.AuthService';

  AuthServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.CheckLoginRequest, $0.CheckLoginResponse>(
        'CheckLogin',
        checkLogin_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.CheckLoginRequest.fromBuffer(value),
        ($0.CheckLoginResponse value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.RegistrationRequest, $0.RegistrationResponse>(
            'Registration',
            registration_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.RegistrationRequest.fromBuffer(value),
            ($0.RegistrationResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.CheckLoginResponse> checkLogin_Pre($grpc.ServiceCall call,
      $async.Future<$0.CheckLoginRequest> request) async {
    return checkLogin(call, await request);
  }

  $async.Future<$0.RegistrationResponse> registration_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.RegistrationRequest> request) async {
    return registration(call, await request);
  }

  $async.Future<$0.CheckLoginResponse> checkLogin(
      $grpc.ServiceCall call, $0.CheckLoginRequest request);
  $async.Future<$0.RegistrationResponse> registration(
      $grpc.ServiceCall call, $0.RegistrationRequest request);
}
