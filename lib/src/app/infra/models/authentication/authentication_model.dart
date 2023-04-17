import '../../../domain/entities/authentication/authentication_entity.dart';

class AuthenticationModel extends AuthenticationEntity {
  AuthenticationModel({
    String? message,
    bool? isValidated,
  }) : super(
          isValidated: isValidated,
          message: message,
        );
}
