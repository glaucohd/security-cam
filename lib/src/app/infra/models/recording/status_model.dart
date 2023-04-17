import 'package:security_cam/src/app/domain/entities/recording/status_entity.dart';

import '../../../core/utils.dart';

class StatusModel extends StatusEntity {
  StatusModel({
    String? message,
    int? code,
  }) : super(
          code: code,
          message: message,
        );

  factory StatusModel.fromJson(dynamic json) {
    return StatusModel(
      message: Utils.stringJson(json['message']),
      code: Utils.intJson(json['code']),
    );
  }
}
