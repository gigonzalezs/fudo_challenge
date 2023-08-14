import 'dart:async';
import '../model/user.dart';
import '../../ports/posts_port.dart';

abstract interface class UserService {
  Future<List<User>> getUsers();
}

class UserServiceImpl implements UserService {
  final PostsPort repository;

  UserServiceImpl({required this.repository});

  @override
  Future<List<User>> getUsers() async {
    return repository.findAllUsers();
  }
}
