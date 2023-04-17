import 'package:flutter/material.dart';
import 'package:security_cam/src/app/core/constants.dart';

import '../../../../core/navigation.dart';
import '../../../../domain/usecases/login_validation/login_validation_usecase.dart';
import '../vos/auth_result_vo.dart';

class AuthController {
  final LoginValidationUsecase loginValidationUsecase;
  AuthResultVO authResult = AuthResultVO();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final ValueNotifier<bool> isButtonEnabled = ValueNotifier<bool>(false);

  AuthController({
    required this.loginValidationUsecase,
  });

  Future<AuthResultVO> login() async {
    final response = await loginValidationUsecase(
      password: passwordController.text,
      user: usernameController.text,
    );

    // Verificar se a validação do login falhou
    if (response.isValidated == false) {
      return AuthResultVO(
        isValidated: false,
        message: response.message,
      );
    }

    // Se a validação for bem-sucedida, retornar um AuthResultVO com isValidated = true
    return AuthResultVO(
      isValidated: true,
      message: Constants.successMessage,
    );
  }

  void updateButtonState() {
    bool isEnabled = usernameController.text.isNotEmpty &&
        passwordController.text.isNotEmpty;
    isButtonEnabled.value = isEnabled;
  }

  void navigateTo({required String route}) {
    cleanTextController();
    Navigation.instance.key.currentState
        ?.pushNamedAndRemoveUntil(route, (Route<dynamic> route) => false);
  }

  void cleanTextController() {
    usernameController.clear();
    passwordController.clear();
  }
}
