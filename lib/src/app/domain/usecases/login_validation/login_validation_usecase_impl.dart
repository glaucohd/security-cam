import '../../entities/authentication/authentication_entity.dart';
import '../../repositories/security_cam_repository.dart';
import 'login_validation_usecase.dart';

class LoginValidationUsecaseImpl extends LoginValidationUsecase {
  final SecurityCamRepository repository;

  LoginValidationUsecaseImpl({required this.repository});
  @override
  Future<AuthenticationEntity> call({
    required String? user,
    required String? password,
  }) async {
    return repository.loginValidation(
      user: user,
      password: password,
    );
  }
}
