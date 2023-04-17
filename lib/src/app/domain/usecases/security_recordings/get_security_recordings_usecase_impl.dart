import 'package:security_cam/src/app/domain/entities/recording/recording_entity.dart';
import '../../repositories/security_cam_repository.dart';
import 'get_security_recordings_usecase.dart';

class GetSecurityRecordingsUsecaseImpl extends GetSecurityRecordingsUsecase {
  final SecurityCamRepository repository;
  GetSecurityRecordingsUsecaseImpl({
    required this.repository,
  });
  @override
  Future<RecordingEntity> call({int? limit}) async {
    return repository.getSecurityRecordings(limit: limit);
  }
}
