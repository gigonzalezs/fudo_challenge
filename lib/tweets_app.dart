
import 'package:flutter/material.dart';
import 'package:fudo_challenge/pages/page_builder.dart';

import 'auth/auth_service.dart';
import 'config.dart';

class TweetsApp extends StatelessWidget {
  const TweetsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appName,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      initialRoute: AuthService().isAuthenticated? homeRoute: loginRoute,
      routes: {
        homeRoute: (_) => PageBuilder.buildHomePage(),
        loginRoute: (_) => PageBuilder.buildLoginPage()
      },
    );
  }
}