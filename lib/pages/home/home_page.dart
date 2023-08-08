
import 'package:flutter/material.dart';
import 'package:fudo_challenge/config.dart';
import 'home_bloc.dart';
import 'home_scaffold.dart';

class HomePage extends StatelessWidget {
  final HomePageBloc bloc;

  const HomePage({super.key,
    required this.bloc
  });

  @override
  Widget build(BuildContext context) {
    return HomeScaffoldBuilder(
        bloc: bloc,
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
    onTap: context.bloc.onNavigatorTap,
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