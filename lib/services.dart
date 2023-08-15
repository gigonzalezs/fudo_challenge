import 'auth/auth.dart';
import 'users/users.dart';

class Services {
  static final Services _singleton = Services._internal();
  factory Services() {
    return _singleton;
  }
  Services._internal();
  late final UserService userService;
  late final AuthService authService;

  void init({
    required UserService Function() userService,
    required AuthService Function() authService
  }) async {
    this.userService = userService.call();
    this.authService = authService.call();
  }
}
