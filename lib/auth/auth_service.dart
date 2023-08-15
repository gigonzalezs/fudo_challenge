
abstract interface class AuthService {

  bool get isAuthenticated;
  Future<bool> login(String username, String password);
  Future<bool> logoff();

}

class AuthServiceImpl implements AuthService {

  bool _isAuthenticated = true;

  @override
  bool get isAuthenticated => _isAuthenticated;

  @override
  Future<bool> login(String username, String password) async {
    _isAuthenticated = _isValidCredentials(username, password);
    return _isAuthenticated;
  }

  bool _isValidCredentials(String username, String password) =>
      username == 'challenge@fudo' && password == 'password';

  @override
  Future<bool> logoff() async {
    _isAuthenticated = false;
    return _isAuthenticated;
  }
}
