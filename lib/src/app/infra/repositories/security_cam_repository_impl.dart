import 'package:security_cam/src/app/domain/entities/recording/recording_entity.dart';
import 'package:security_cam/src/app/infra/datasources/security_cam_datasource.dart';
import '../../domain/entities/authentication/authentication_entity.dart';
import '../../domain/repositories/security_cam_repository.dart';

class SecurityCamRepositoryImpl extends SecurityCamRepository {
  final SecurityCamDatasource datasource;

  SecurityCamRepositoryImpl({required this.datasource});
  @override
  Future<RecordingEntity> getSecurityRecordings({int? limit}) async {
    return datasource.getSecurityRecordings(limit: limit);
  }

  @override
  Future<AuthenticationEntity> loginValidation({
    required String? user,
    required String? password,
  }) async {
    return datasource.loginValidation(user: user, password: password);
  }
}
