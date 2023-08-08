
import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:fudo_challenge/config.dart';

import '../../auth/auth_service.dart';

class LoginPageController {
  late final BuildContext context;

  LoginPageController();

  String? userValidator(String? userName) {
    if (userName == null || userName.isEmpty) {
      return 'correo vacío';
    }
    return null;
  }

  String? passwordValidator(String? password) {
    if (password == null || password.isEmpty) {
      return 'Contraseña vacia';
    }
    return null;
  }

  Future<String?> onLogin(LoginData data) async {
    if (data.name.trim().toLowerCase() != 'challenge@fudo' || data.password != 'password') {
      return 'Usuario o contraseña inválida';
    }
    return null;
  }

  void onSubmitAnimationCompleted() {
    AuthService().login()
    .then((_) => Navigator.of(context).pushReplacementNamed(homeRoute));
  }

  Future<String?> onRecoverPassword(String value) async {
    return null;
  }
}