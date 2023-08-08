
import 'dart:async';

import 'package:fudo_challenge/users/user.dart';

import '../repositories/JsonPlaceHolderRepository.dart';

abstract interface class UserService {
  Future<List<User>> getUsers();
}

class UserServiceImpl implements UserService {
  final JsonPlaceHolderRepository repository;

  UserServiceImpl({required this.repository});

  @override
  Future <List<User>> getUsers() async {
   return repository.findAllUsers();
  }
}
