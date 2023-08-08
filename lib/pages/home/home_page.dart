
import 'package:flutter/material.dart';
import 'package:fudo_challenge/config.dart';
import 'package:fudo_challenge/pages/home/home_states.dart';
import 'package:fudo_challenge/pages/home/widgets/user_list.dart';
import '../../users/user.dart';
import 'home_bloc.dart';
import 'home_scaffold.dart';

class HomePage extends StatelessWidget {
  final HomePageBloc bloc;

  const HomePage({super.key,
    required this.bloc
  });

  @override
  Widget build(BuildContext context) {
    bloc.start();
    return HomeScaffoldBuilder(
        bloc: bloc,
        appBar: _appbar,
        usersBuilder: _usersPageBuilder,
        postsBuilder: _postsPageBuilder,
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

  Widget _usersPageBuilder(BuildContext context, UsersState state) =>
      UserList(state: state);

  Widget _postsPageBuilder(BuildContext context, PostsState state) => const Text('posts');
}