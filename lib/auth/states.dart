

abstract class LoginResult {}

class LoginResultSuccess extends LoginResult {
  final String userName;

  LoginResultSuccess({required this.userName});
}

class LoginResultFail extends LoginResult {
  final String message;

  LoginResultFail({required this.message});
}