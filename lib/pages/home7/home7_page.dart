
import 'package:flutter/material.dart';
import 'package:fudo_challenge/config.dart';
import 'package:fudo_challenge/framework/spread_state.dart';
import 'package:fudo_challenge/users/user_use_cases.dart';
import 'package:fudo_challenge/pages/home7/widgets/posts.dart';
import 'package:fudo_challenge/pages/home7/widgets/users.dart';
import '../../framework/spread_builder.dart';
import 'home7_states.dart';

class HomePage7 extends StatelessWidget {

  HomePage7({super.key
  });

  @override
  Widget build(BuildContext context) {
    // set initial states
    SpreadState().emit<Home7PageState>(Home7PageState.users);
    LoadUsersUseCase().execute();

    return Scaffold(
        appBar: _appbar,
        bottomNavigationBar: _navigator(context),
        body: Spread<Home7PageState>(
          builder: _homeBody,
        )
    );
  }

  Widget _homeBody(BuildContext context, Home7PageState? state) {
    switch(state) {
      case Home7PageState.posts: {
        return Posts7Page();
      }
      case Home7PageState.users:
      default: {
        return Users7Page();
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


  Future onNavigatorTap(int index) async {
    print('navigator tap: $index');
    switch(index) {
      case 0: {
        showUsers();
        break;
      }
      case 1: {
        showPosts();
        break;
      }
    }
  }

  void showUsers() async {
    LoadUsersUseCase().execute();
    SpreadState().emit<Home7PageState>(Home7PageState.users);
  }

  void showPosts() async {
    SpreadState().emit<Home7PageState>(Home7PageState.posts);
  }
}