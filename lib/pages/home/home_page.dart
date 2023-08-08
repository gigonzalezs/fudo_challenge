
import 'package:flutter/material.dart';
import 'package:fudo_challenge/config.dart';
import 'home_controller.dart';
import 'home_scaffold.dart';

class HomePage extends StatelessWidget {
  final HomeController controller;

  const HomePage({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return HomeScaffoldBuilder(
        appBar: _appbar,
        usersBuilder:  (ctx, s) => const Text('users'),
        postsBuilder: (ctx, s) => const Text('posts'),
        bottomNavigationBarBuilder: (ctx) => _navigator(ctx),
    );
  }

  AppBar get _appbar => AppBar(
    title: Text(appName),
  );

  BottomNavigationBar _navigator(BuildContext context) => BottomNavigationBar(
    onTap: (index) => controller.onNavigatorTap(context, index),
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