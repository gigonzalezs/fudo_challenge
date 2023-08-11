
import 'package:fudo_challenge/users/users_observer.dart';
import 'package:fudo_challenge/users/users_service.dart';

class Services {
  static final Services _singleton = Services._internal();
  factory Services() {
    return _singleton;
  }
  Services._internal();
  late final UserService users;

  void init({
    required UserService Function() users,
  }) async {
    this.users = users();
  }
}