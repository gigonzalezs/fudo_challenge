
import 'package:flutter/material.dart';
import 'package:fudo_challenge/pages/login/login_page.dart';
import 'package:fudo_challenge/pages/home/home_page.dart';

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
      initialRoute: loginRoute,
      routes: {
        homeRoute: (_) => const HomePage(),
        loginRoute: (_) => const LoginPage()
      },
    );
  }
}