
import 'package:flutter/cupertino.dart';
import 'package:fudo_challenge/pages/home/home_page.dart';
import 'package:fudo_challenge/pages/login/login_controller.dart';
import 'package:fudo_challenge/repositories/JsonPlaceHolderRepository.dart';

import '../users/users_service.dart';
import 'home/home_bloc.dart';
import 'login/login_page.dart';

class PageBuilder {
  static Widget buildHomePage() => HomePage(
    bloc: HomePageBloc(
        userService: UserServiceImpl(
          repository: JsonPlaceHolderRepositoryImpl()
        )
    ),
  );
  static Widget buildLoginPage() => LoginPage(
      controller: LoginPageController()
  );
}