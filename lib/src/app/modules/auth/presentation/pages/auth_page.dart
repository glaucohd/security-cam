import 'package:flutter/material.dart';
import 'package:security_cam/src/app/core/app_colors.dart';
import 'package:security_cam/src/app/modules/auth/presentation/vos/auth_result_vo.dart';
import 'package:security_cam/src/app/modules/video_list/presentation/widgets/text_widget.dart';

import '../../../../core/constants.dart';
import '../../../../core/injector.dart';
import '../../../../core/routes.dart';
import '../controllers/auth_controller.dart';
import '../widgets/text_fiel_widget.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  late AuthController controller;

  @override
  void initState() {
    super.initState();
    controller = getIt<AuthController>();
    controller.usernameController.addListener(controller.updateButtonState);
    controller.passwordController.addListener(controller.updateButtonState);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              Constants.logo,
              width: 100,
              height: 100,
            ),
            const SizedBox(height: 16),
            const TextWidget(
              text: Constants.welcomeText,
              fontSize: 32,
            ),
            const SizedBox(height: 16),
            const TextWidget(
              text: Constants.loginText,
              fontSize: 16,
              color: AppColors.grey,
            ),
            const SizedBox(height: 25),
            TextFielWidget(
              hintText: Constants.userHintText,
              controller: controller.usernameController,
            ),
            const SizedBox(height: 25),
            TextFielWidget(
              hintText: Constants.passwordHintText,
              controller: controller.passwordController,
            ),
            const SizedBox(height: 30),
            _buttonWidget(),
          ],
        ),
      ),
    );
  }

  Widget _buttonWidget() {
    return SizedBox(
      width: 200,
      child: ValueListenableBuilder<bool>(
        valueListenable: controller.isButtonEnabled,
        builder: (context, isEnabled, _) {
          return ElevatedButton(
            onPressed: isEnabled ? () => _handleLogin() : null,
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
                  if (!isEnabled || states.contains(MaterialState.disabled)) {
                    return AppColors.greyLight;
                  }
                  return AppColors.green;
                },
              ),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            child: const Text(Constants.loginButtonText),
          );
        },
      ),
    );
  }

  void _handleLogin() async {
    final result = await controller.login();
    if (result.isValidated == false) {
      runShowDialog(result);
    } else {
      controller.navigateTo(route: Routes.videoListPage);
    }
  }

  Future<void> runShowDialog(AuthResultVO response) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: TextWidget(
            text: Constants.errorDialogTitle,
            color: Theme.of(context).colorScheme.error,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
          content: TextWidget(
            text: response.message ?? '-',
            color: AppColors.primaryText,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: AppColors.green,
                ),
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: const TextWidget(
                  text: Constants.errorDialogOkButtonText,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
