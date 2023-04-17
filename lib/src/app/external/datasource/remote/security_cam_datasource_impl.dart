import 'package:security_cam/src/app/core/constants.dart';
import 'package:security_cam/src/app/infra/models/authentication/authentication_model.dart';
import 'package:security_cam/src/app/infra/models/recording/recording_model.dart';

import '../../../infra/datasources/security_cam_datasource.dart';
import '../../../services/http_service.dart';

class SecurityCamDatasourceImpl extends SecurityCamDatasource {
  final HttpService service;

  SecurityCamDatasourceImpl({required this.service});
  @override
  Future<RecordingModel> getSecurityRecordings({int? limit}) async {
    final url = 'http://localhost:3001/v1/videos/history?limit=$limit';

    return service.call<RecordingModel>(
      type: RestType.get,
      url: url,
      fromJson: (json) => RecordingModel.fromJson(json),
    );
  }

  //implementaçao mockada para fazer a validacao de login e senha
  @override
  Future<AuthenticationModel> loginValidation({
    required String? user,
    required String? password,
  }) async {
    AuthenticationModel result = AuthenticationModel();

    String username = 'gabriel';
    String security = '140120';

    final RegExp usernameRegExp = RegExp(r'^[a-zA-Z]+$');
    final RegExp passwordRegExp = RegExp(r'^[0-9]+$');

    // Verificar se os campos de usuário e senha são válidos
    if (!usernameRegExp.hasMatch(user ?? "-")) {
      return AuthenticationModel(
        isValidated: false,
        message: Constants.usernameErrorMessage,
      );
    }
    if (!passwordRegExp.hasMatch(password ?? "-")) {
      return AuthenticationModel(
        isValidated: false,
        message: Constants.passwordErrorMessage,
      );
    }

    if (user == username && password == security) {
      result = AuthenticationModel(
        isValidated: true,
        message: Constants.successMessage,
      );
    } else if (user != username && password != security) {
      result = AuthenticationModel(
        isValidated: false,
        message: Constants.wrongUsernameAndPasswordMessage,
      );
    } else if (user != username) {
      result = AuthenticationModel(
        isValidated: false,
        message: Constants.wrongUsernameMessage,
      );
    } else {
      result = AuthenticationModel(
        isValidated: false,
        message: Constants.wrongPasswordMessage,
      );
    }

    return result;
  }
}
