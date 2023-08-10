
import 'package:flutter/cupertino.dart';
import 'package:fudo_challenge/pages/home/home_page.dart';
import 'package:fudo_challenge/pages/login/login_controller.dart';
import 'package:fudo_challenge/repositories/JsonPlaceHolderRepository.dart';


import 'home2/home2_page.dart';
import 'login/login_page.dart';

class PageBuilder {
  static Widget buildHomePage() => const HomePage2();
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