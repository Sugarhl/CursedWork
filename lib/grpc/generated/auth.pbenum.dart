///
import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class Status extends $pb.ProtobufEnum {
  static const Status NOTHING = Status._(
      0,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'NOTHING');
  static const Status SUCCESS = Status._(
      200,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'SUCCESS');
  static const Status CONFLICT = Status._(
      409,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'CONFLICT');

  static const $core.List<Status> values = <Status>[
    NOTHING,
    SUCCESS,
    CONFLICT,
  ];

  static final $core.Map<$core.int, Status> _byValue =
      $pb.ProtobufEnum.initByValue(values);

  static Status? valueOf($core.int value) => _byValue[value];

  const Status._($core.int v, $core.String n) : super(v, n);
}
