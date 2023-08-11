
import 'package:flutter/material.dart';
import 'package:fudo_challenge/config.dart';
import 'package:fudo_challenge/framework/spread_state.dart';
import 'package:fudo_challenge/pages/home4/widgets/posts.dart';
import 'package:fudo_challenge/pages/home4/widgets/users.dart';
import '../../framework/spread_builder.dart';
import 'home4_states.dart';

class HomePage4 extends StatelessWidget {

  const HomePage4({super.key
  });


  @override
  Widget build(BuildContext context) {
    SpreadState().emit<Home4PageState>(Home4PageState.users);
    return Scaffold(
        appBar: _appbar,
        bottomNavigationBar: _navigator(context),
        body: Spread<Home4PageState>(
          builder: _homeBody,
        )
    );
  }

  Widget _homeBody(BuildContext context, Home4PageState? state) {
    switch(state) {
      case Home4PageState.posts: {
        //return _postsPageBuilder(context);
        return const UsersPage();
      }
      case Home4PageState.users:
      default: {
        //return _usersPageBuilder(context);
        return const PostsPage();
      }
    }
  }

  AppBar get _appbar => AppBar(
    title: Text(appName),
  );

  BottomNavigationBar _navigator(BuildContext context) => BottomNavigationBar(
    onTap: onNavigatorTap,
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

  Widget _usersPageBuilder(BuildContext context) => const Text('users');
      //UserList(state: state);

  Widget _postsPageBuilder(BuildContext context) => const Text('posts');

  Future onNavigatorTap(int index) async {
    print('navigator tap: $index');
    switch(index) {
      case 0: {
        SpreadState().emit<Home4PageState>(Home4PageState.users);
        break;
      }
      case 1: {
        SpreadState().emit<Home4PageState>(Home4PageState.posts);
        break;
      }
    }
  }
}