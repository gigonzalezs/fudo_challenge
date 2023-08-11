
import 'package:flutter/material.dart';
import 'package:fudo_challenge/config.dart';
import 'package:fudo_challenge/framework/spread_state.dart';
import '../../framework/spread_builder.dart';

class HomePage2 extends StatelessWidget {

  const HomePage2({super.key
  });

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: _appbar,
        bottomNavigationBar: _navigator(context),
        body: Spread(
          stateKey: "homeTab",
          builder: _homeBody,
        )
    );
  }

  Widget _homeBody(BuildContext context, dynamic state) {
    switch(state) {
      case "posts": {
        return _postsPageBuilder(context);
      }
      case "users":
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
        SpreadState().emitNamed("homeTab", "users");
        break;
      }
      case 1: {
        SpreadState().emitNamed("homeTab", "posts");
        break;
      }
    }
  }
}