import 'auth/auth.dart';
import 'posts/posts.dart';
import 'users/users.dart';

class Services {
  static final Services _singleton = Services._internal();
  factory Services() {
    return _singleton;
  }
  Services._internal();
  late final UserService userService;
  late final AuthService authService;
  late final PostsService postsService;

  void init({
    required UserService Function() userService,
    required AuthService Function() authService,
    required PostsService Function() postsService
  }) async {
    this.userService = userService.call();
    this.authService = authService.call();
    this.postsService = postsService.call();
  }
}
