
import 'package:flutter/material.dart';
import 'package:fudo_challenge/config.dart';

import 'home_controller.dart';

class HomePage extends StatelessWidget {
  final HomeController controller;

  const HomePage({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    controller.context = context;
    return Scaffold(
      appBar: _appbar,
      bottomNavigationBar: _navigator,
    );
  }

  AppBar get _appbar => AppBar(
    title: Text(appName),
  );

  BottomNavigationBar get _navigator => BottomNavigationBar(
    onTap: controller.onNavigatorTap,
    items: const <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        icon: Icon(Icons.account_circle),
        label: 'Users',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.data_array),
        label: 'Posts',
      ),
    ],
  );
}