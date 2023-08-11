
import 'package:flutter/material.dart';
import 'package:fudo_challenge/config.dart';
import 'package:fudo_challenge/framework/spread_state.dart';
import '../../framework/spread_builder.dart';
import 'home3_states.dart';

class HomePage3 extends StatelessWidget {

  const HomePage3({super.key
  });

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: _appbar,
        bottomNavigationBar: _navigator(context),
        body: Spread<Home3PageState>(
          builder: _homeBody,
        )
    );
  }

  Widget _homeBody(BuildContext context, Home3PageState? state) {
    switch(state.runtimeType) {
      case Posts3State: {
        return _postsPageBuilder(context);
      }
      case Users3State:
      default: {
        return _usersPageBuilder(context);
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
        SpreadState().emit<Home3PageState>(Users3State());
        break;
      }
      case 1: {
        SpreadState().emit<Home3PageState>(Posts3State());
        break;
      }
    }
  }
}