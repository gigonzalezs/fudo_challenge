
import 'package:flutter/cupertino.dart';
import 'package:fudo_challenge/pages/login/login_controller.dart';
import 'home7/home7_page.dart';
import 'login/login_page.dart';

class PageBuilder {
  static Widget buildHomePage() => HomePage7();
  static Widget buildLoginPage() => LoginPage(
      controller: LoginPageController()
  );
}
