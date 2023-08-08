import 'dart:async';

import '../users/user.dart';

abstract interface class JsonPlaceHolderRepository {
  Future<List<User>> findAllUsers();
}

class JsonPlaceHolderRepositoryImpl implements JsonPlaceHolderRepository {

  @override
  Future<List<User>> findAllUsers() async {
    return Future.delayed(
        const Duration(
          seconds: 2,
        ),
        () => [
          User(id: 1, name: "a"),
          User(id: 2, name: "b")
        ]
    );
  }
}
