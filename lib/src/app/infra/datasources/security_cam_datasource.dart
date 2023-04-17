import '../models/authentication/authentication_model.dart';
import '../models/recording/recording_model.dart';

abstract class SecurityCamDatasource {
  Future<RecordingModel> getSecurityRecordings({int? limit});

  Future<AuthenticationModel> loginValidation({
    required String? user,
    required String? password,
  });
}
