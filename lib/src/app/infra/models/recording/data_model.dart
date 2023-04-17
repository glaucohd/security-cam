import 'package:security_cam/src/app/domain/entities/recording/data_entity.dart';
import 'package:security_cam/src/app/infra/models/recording/video_info_model.dart';

import '../../../core/utils.dart';
import 'location_info_model.dart';

class DataModel extends DataEntity {
  DataModel({
    String? uri,
    String? fileName,
    VideoInfoModel? videoInfo,
    LocationInfoModel? locationInfo,
  }) : super(
          fileName: fileName,
          locationInfo: locationInfo,
          uri: uri,
          videoInfo: videoInfo,
        );

  factory DataModel.fromJson(dynamic json) {
    return DataModel(
      uri: Utils.stringJson(json['uri']),
      fileName: Utils.stringJson(json['fileName']),
      videoInfo: VideoInfoModel.fromJson(
        Utils.getMapJson(json['videoInfo']),
      ),
      locationInfo: LocationInfoModel.fromJson(
        Utils.getMapJson(json['locationInfo']),
      ),
    );
  }
}
