import 'dart:async';

import '../users/user.dart';

abstract interface class PostsPort {
  Future<List<User>> findAllUsers();
}

class PostsApiPort implements PostsPort {

  @override
  Future<List<User>> findAllUsers() async {
    return Future.delayed(
        const Duration(
          seconds: 2,
        ),
        () => [
          User(id: 1, name: "aaaa"),
          User(id: 2, name: "bbbb")
        ]
    );
  }
}
