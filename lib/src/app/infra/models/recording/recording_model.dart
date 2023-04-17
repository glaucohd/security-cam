import 'package:security_cam/src/app/domain/entities/recording/recording_entity.dart';

import '../../../core/utils.dart';
import 'status_model.dart';
import 'data_model.dart';

class RecordingModel extends RecordingEntity {
  RecordingModel({
    List<DataModel>? data,
    StatusModel? status,
  }) : super(
          data: data,
          status: status,
        );

  factory RecordingModel.fromJson(dynamic json) {
    return RecordingModel(
      data: Utils.listJson(json['data'])
          .map((element) => DataModel.fromJson(Utils.getMapJson(element)))
          .toList(),
      status: StatusModel.fromJson(
        Utils.getMapJson(json['status']),
      ),
    );
  }
}
