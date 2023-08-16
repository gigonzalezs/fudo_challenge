import 'package:flutter/material.dart';
import 'auth/auth.dart';
import 'ports/ports.dart';
import 'posts/posts.dart';
import 'users/users.dart';
import 'services.dart';
import 'app.dart';

void main() {
  initServices();
  initObservers();
  runApp(const MyApp());
}

void initServices() async {
  final PostsApiPort postsApiPort = PostsApiPort();
  Services()
      .init(
        userService: () => UserServiceImpl(
            repository: postsApiPort
        ),
        authService: () => AuthServiceImpl(),
        postsService: () => PostServiceImpl(
            repository: postsApiPort
        )
  );
}

void initObservers() async {
  UserItemObserver().selfRegister();
  PostsObserver().selfRegister();
  CreatePostObserver().selfRegister();
}