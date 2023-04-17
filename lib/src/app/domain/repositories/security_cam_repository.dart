import '../entities/authentication/authentication_entity.dart';
import '../entities/recording/recording_entity.dart';

abstract class SecurityCamRepository {
  Future<RecordingEntity> getSecurityRecordings({int? limit});

  Future<AuthenticationEntity> loginValidation({
    required String? user,
    required String? password,
  });
}
