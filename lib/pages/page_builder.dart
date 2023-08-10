
import 'package:flutter/cupertino.dart';
import 'package:fudo_challenge/pages/login/login_controller.dart';
import 'package:fudo_challenge/repositories/JsonPlaceHolderRepository.dart';

import 'home3/home3_page.dart';
import 'home4/home4_page.dart';
import 'login/login_page.dart';

class PageBuilder {
  static Widget buildHomePage() => const HomePage4();
  static Widget buildLoginPage() => LoginPage(
      controller: LoginPageController()
  );
}

/*

bloc: HomePageBloc(
        userService: UserServiceImpl(
          repository: JsonPlaceHolderRepositoryImpl()
        )
    ),

* */