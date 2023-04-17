import 'data_entity.dart';
import 'status_entity.dart';

class RecordingEntity {
  List<DataEntity>? data;
  StatusEntity? status;

  RecordingEntity({
    this.data,
    this.status,
  });
}
