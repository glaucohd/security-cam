import 'location_info_entity.dart';
import 'video_info_entity.dart';

class DataEntity {
  String? uri;
  String? fileName;
  VideoInfoEntity? videoInfo;
  LocationInfoEntity? locationInfo;

  DataEntity({
    this.uri,
    this.fileName,
    this.videoInfo,
    this.locationInfo,
  });
}
