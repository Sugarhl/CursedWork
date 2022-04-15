///
//  Generated code. Do not modify.
//  source: auth.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use statusDescriptor instead')
const Status$json = const {
  '1': 'Status',
  '2': const [
    const {'1': 'NOTHING', '2': 0},
    const {'1': 'SUCCESS', '2': 200},
    const {'1': 'CONFLICT', '2': 409},
  ],
};

/// Descriptor for `Status`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List statusDescriptor = $convert.base64Decode('CgZTdGF0dXMSCwoHTk9USElORxAAEgwKB1NVQ0NFU1MQyAESDQoIQ09ORkxJQ1QQmQM=');
@$core.Deprecated('Use checkLoginRequestDescriptor instead')
const CheckLoginRequest$json = const {
  '1': 'CheckLoginRequest',
  '2': const [
    const {'1': 'login', '3': 1, '4': 1, '5': 9, '10': 'login'},
  ],
};

/// Descriptor for `CheckLoginRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List checkLoginRequestDescriptor = $convert.base64Decode('ChFDaGVja0xvZ2luUmVxdWVzdBIUCgVsb2dpbhgBIAEoCVIFbG9naW4=');
@$core.Deprecated('Use checkLoginResponseDescriptor instead')
const CheckLoginResponse$json = const {
  '1': 'CheckLoginResponse',
  '2': const [
    const {'1': 'status', '3': 1, '4': 1, '5': 14, '6': '.models.api.Status', '10': 'status'},
  ],
};

/// Descriptor for `CheckLoginResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List checkLoginResponseDescriptor = $convert.base64Decode('ChJDaGVja0xvZ2luUmVzcG9uc2USKgoGc3RhdHVzGAEgASgOMhIubW9kZWxzLmFwaS5TdGF0dXNSBnN0YXR1cw==');
@$core.Deprecated('Use registrationRequestDescriptor instead')
const RegistrationRequest$json = const {
  '1': 'RegistrationRequest',
  '2': const [
    const {'1': 'login', '3': 1, '4': 1, '5': 9, '10': 'login'},
    const {'1': 'password', '3': 2, '4': 1, '5': 9, '10': 'password'},
  ],
};

/// Descriptor for `RegistrationRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List registrationRequestDescriptor = $convert.base64Decode('ChNSZWdpc3RyYXRpb25SZXF1ZXN0EhQKBWxvZ2luGAEgASgJUgVsb2dpbhIaCghwYXNzd29yZBgCIAEoCVIIcGFzc3dvcmQ=');
@$core.Deprecated('Use registrationResponseDescriptor instead')
const RegistrationResponse$json = const {
  '1': 'RegistrationResponse',
  '2': const [
    const {'1': 'status', '3': 1, '4': 1, '5': 14, '6': '.models.api.Status', '10': 'status'},
  ],
};

/// Descriptor for `RegistrationResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List registrationResponseDescriptor = $convert.base64Decode('ChRSZWdpc3RyYXRpb25SZXNwb25zZRIqCgZzdGF0dXMYASABKA4yEi5tb2RlbHMuYXBpLlN0YXR1c1IGc3RhdHVz');
