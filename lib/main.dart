import 'package:flutter/material.dart';
import 'auth/auth.dart';
import 'ports/ports.dart';
import 'users/users.dart';
import 'services.dart';
import 'app.dart';

void main() {
  initServices();
  initObservers();
  runApp(const MyApp());
}

void initServices() async {
  Services()
      .init(
        userService: () => UserServiceImpl(
            repository: PostsApiPort()
        ),
        authService: () => AuthServiceImpl()
  );
}

void initObservers() async {
  UsersObserver().selfRegister();
}
