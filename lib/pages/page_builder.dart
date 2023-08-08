
import 'package:flutter/cupertino.dart';
import 'package:fudo_challenge/pages/home/home_controller.dart';
import 'package:fudo_challenge/pages/home/home_page.dart';
import 'package:fudo_challenge/pages/login/login_controller.dart';

import 'login/login_page.dart';

class PageBuilder {
  static Widget buildHomePage() => HomePage(
    controller: HomeController()
  );
  static Widget buildLoginPage() => LoginPage(
      controller: LoginPageController()
  );
}