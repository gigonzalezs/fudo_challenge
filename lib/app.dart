import 'package:flutter/material.dart';
import 'package:spread/spread.dart';
import 'auth/auth.dart';
import 'pages/home/home.dart';
import 'config.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appName,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: Spread<LoginResult>(
        builder: (BuildContext context, LoginResult? state) {
          if(state == null)  return LoginPage();
          switch(state.runtimeType) {
            case LoginResultSuccess: {
              return HomePage();
            }
            case LoginResultFail: {
              final fail = state as LoginResultFail;
              return LoginPage(
                errorMessage: fail.message,
              );
            }
            default: {
              return LoginPage();
            }
          }
        },
      )
    );
  }
}
