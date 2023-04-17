import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:security_cam/src/app/infra/datasources/security_cam_datasource.dart';
import 'package:security_cam/src/app/infra/models/authentication/authentication_model.dart';
import 'package:security_cam/src/app/infra/models/recording/data_model.dart';
import 'package:security_cam/src/app/infra/models/recording/recording_model.dart';
import 'package:security_cam/src/app/infra/models/recording/status_model.dart';
import 'package:security_cam/src/app/infra/repositories/security_cam_repository_impl.dart';

import 'security_cam_repository_impl_test.mocks.dart';

@GenerateMocks([SecurityCamDatasource])
void main() {
  late SecurityCamDatasource datasource;
  late SecurityCamRepositoryImpl repository;

  setUp(() {
    datasource = MockSecurityCamDatasource();
    repository = SecurityCamRepositoryImpl(datasource: datasource);
  });

  test('Deve retornar um objeto do tipo RecordingModel', () async {
    // Arrange
    final recording =
        RecordingModel(data: <DataModel>[], status: StatusModel());
    when(datasource.getSecurityRecordings(limit: null))
        .thenAnswer((_) async => recording);

    // Act
    final result = await repository.getSecurityRecordings();

    // Assert
    expect(result, isInstanceOf<RecordingModel>());
    expect(result.data, equals(recording.data));
    expect(result.status, equals(recording.status));
  });

  group('loginValidation', () {
    test('Deve retornar uma isValidated igual a true', () async {
      // Arrange
      final authentication = AuthenticationModel(isValidated: true);

      when(datasource.loginValidation(user: 'gabriel', password: '140120'))
          .thenAnswer((_) async => authentication);

      // Act
      final result =
          await repository.loginValidation(user: 'gabriel', password: '140120');

      // Assert
      expect(result.isValidated, equals(authentication.isValidated));
    });
  });
}
