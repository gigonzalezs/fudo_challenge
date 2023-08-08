
import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:fudo_challenge/config.dart';

import 'login_controller.dart';

class LoginPage extends StatelessWidget {
  final LoginPageController controller;

  const LoginPage({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    controller.context = context;
    return FlutterLogin(
      title: appName,
      logo: const AssetImage('assets/logo.png'),
      logoTag: logoTag,
      titleTag: titleTag,
      navigateBackAfterRecovery: true,
      loginAfterSignUp: false,
      userValidator: controller.userValidator,
      passwordValidator: controller.passwordValidator,
      onLogin: controller.onLogin,
      onSubmitAnimationCompleted: controller.onSubmitAnimationCompleted,
      onRecoverPassword: controller.onRecoverPassword
    );
  }
}