
import 'package:flutter/material.dart';
import 'package:fudo_challenge/config.dart';
import 'package:fudo_challenge/pages/home6/useCases/use_cases.dart';
import 'package:fudo_challenge/pages/home6/widgets/posts.dart';
import 'package:fudo_challenge/pages/home6/widgets/users.dart';
import 'package:spread/spread_builder.dart';
import 'home6_states.dart';
import 'package:spread/spread_state.dart';

class HomePage6 extends StatelessWidget {
  final Users6State users = Users6State(id: 'users');
  final Posts6State posts = Posts6State(id: 'posts');

  HomePage6({super.key
  });


  @override
  Widget build(BuildContext context) {
    SpreadState().emit<Home6PageState>(users);
    SpreadState().emitEntity(users);
    SpreadState().emitEntity(posts);

    return Scaffold(
        appBar: _appbar,
        bottomNavigationBar: _navigator(context),
        body: Spread<Home6PageState>(
          builder: _homeBody,
        )
    );
  }

  Widget _homeBody(BuildContext context, Home6PageState? state) {
    switch(state.runtimeType) {
      case Posts6State: {
        return Posts6Page(posts: posts);
      }
      case Users6State:
      default: {
        return Users6Page(users: users);
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
        IncrementUsersUseCase(users: users).execute();
        SpreadState().emit<Home6PageState>(users);
        break;
      }
      case 1: {
        IncrementPostsUseCase(posts: posts).execute();
        SpreadState().emit<Home6PageState>(posts);
        break;
      }
    }
  }
}