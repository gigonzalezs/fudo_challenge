

class AuthService {
  static final AuthService _singleton = AuthService._internal();

  bool _isAuthenticated = false;

  bool get isAuthenticated => _isAuthenticated;

  factory AuthService() {
    return _singleton;
  }

  AuthService._internal();

  Future login() async {
    _isAuthenticated = true;
  }

  Future logoff() async {
    _isAuthenticated = false;
  }
}