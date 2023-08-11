import 'package:flutter/material.dart';
import 'package:fudo_challenge/repositories/JsonPlaceHolderRepository.dart';
import 'package:fudo_challenge/services.dart';
import 'package:fudo_challenge/users/users_observer.dart';
import 'package:fudo_challenge/users/users_service.dart';

import 'tweets_app.dart';

void main() {
  initServices();
  initObservers();
  runApp(const TweetsApp());
}

void initServices() async {
  Services().init(
    users: () => UserServiceImpl(
        repository: JsonPlaceHolderRepositoryImpl()
    )
  );
}

void initObservers() async {
  UsersObserver().selfRegister();
}



