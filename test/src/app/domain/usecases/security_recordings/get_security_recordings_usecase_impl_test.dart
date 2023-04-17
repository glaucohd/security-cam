import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:security_cam/src/app/domain/entities/recording/data_entity.dart';
import 'package:security_cam/src/app/domain/entities/recording/recording_entity.dart';
import 'package:security_cam/src/app/domain/entities/recording/status_entity.dart';
import 'package:security_cam/src/app/domain/repositories/security_cam_repository.dart';
import 'package:security_cam/src/app/domain/usecases/security_recordings/get_security_recordings_usecase_impl.dart';
import 'get_security_recordings_usecase_impl_test.mocks.dart';

@GenerateMocks([SecurityCamRepository])
void main() {
  final repository = MockSecurityCamRepository();
  final usecase = GetSecurityRecordingsUsecaseImpl(repository: repository);

  test('Deve retornar um objeto do tipo RecordingEntity', () async {
    // Arrange
    final recording =
        RecordingEntity(data: <DataEntity>[], status: StatusEntity());
    when(repository.getSecurityRecordings()).thenAnswer((_) async => recording);

    // Act
    final result = await usecase();

    // Assert
    expect(result, isInstanceOf<RecordingEntity>());
  });

  test('Deve lançar uma exceção em caso de erro no repositório', () async {
    // Arrange
    when(repository.getSecurityRecordings())
        .thenThrow(Exception('Erro no repositório'));

    // Act
    final call = usecase();

    // Assert
    expect(call, throwsA(isInstanceOf<Exception>()));
  });
}
