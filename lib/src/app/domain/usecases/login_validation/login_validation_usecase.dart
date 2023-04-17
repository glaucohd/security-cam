import '../../entities/authentication/authentication_entity.dart';

abstract class LoginValidationUsecase {
  Future<AuthenticationEntity> call({
    required String? user,
    required String? password,
  });
}
