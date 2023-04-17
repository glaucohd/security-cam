import 'package:security_cam/src/app/domain/entities/recording/video_info_entity.dart';

import '../../../core/utils.dart';

class VideoInfoModel extends VideoInfoEntity {
  VideoInfoModel({
    String? title,
    String? subtitle,
    String? description,
  }) : super(
          description: description,
          subtitle: subtitle,
          title: title,
        );

  factory VideoInfoModel.fromJson(dynamic json) {
    return VideoInfoModel(
      title: Utils.stringJson(json['title']),
      subtitle: Utils.stringJson(json['subtitle']),
      description: Utils.stringJson(json['description']),
    );
  }
}
