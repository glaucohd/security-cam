import '../../entities/recording/recording_entity.dart';

abstract class GetSecurityRecordingsUsecase {
  Future<RecordingEntity> call({int? limit});
}
