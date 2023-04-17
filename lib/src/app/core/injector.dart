import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:security_cam/src/app/external/datasource/remote/security_cam_datasource_impl.dart';
import 'package:security_cam/src/app/infra/repositories/security_cam_repository_impl.dart';

import '../domain/repositories/security_cam_repository.dart';
import '../domain/usecases/login_validation/login_validation_usecase.dart';
import '../domain/usecases/login_validation/login_validation_usecase_impl.dart';
import '../domain/usecases/security_recordings/get_security_recordings_usecase.dart';
import '../domain/usecases/security_recordings/get_security_recordings_usecase_impl.dart';
import '../infra/datasources/security_cam_datasource.dart';
import '../modules/auth/presentation/controllers/auth_controller.dart';
import '../modules/video_list/presentation/controllers/security_recordings_controller.dart';
import '../services/http_service.dart';

final getIt = GetIt.instance;

void configureDependences() {
  getIt.registerSingleton<HttpService>(HttpService());

  getIt.registerLazySingleton<SecurityCamRepository>(() =>
      SecurityCamRepositoryImpl(datasource: getIt<SecurityCamDatasource>()));

  getIt.registerLazySingleton<SecurityCamDatasource>(
    () => SecurityCamDatasourceImpl(service: getIt<HttpService>()),
  );

  getIt.registerLazySingleton<GetSecurityRecordingsUsecase>(
    () => GetSecurityRecordingsUsecaseImpl(
        repository: getIt<SecurityCamRepository>()),
  );

  getIt.registerLazySingleton<LoginValidationUsecase>(
    () => LoginValidationUsecaseImpl(
      repository: getIt<SecurityCamRepository>(),
    ),
  );

  getIt.registerSingleton(
    AuthController(
      loginValidationUsecase: getIt<LoginValidationUsecase>(),
    ),
  );

  getIt.registerSingleton(
    SecurityRecordingsController(
      getSecurityRecordingsUsecase: getIt<GetSecurityRecordingsUsecase>(),
    ),
  );
}
