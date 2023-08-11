
import 'package:flutter/material.dart';
import 'package:fudo_challenge/config.dart';
import 'package:fudo_challenge/framework/spread_state.dart';
import 'package:fudo_challenge/pages/home5/widgets/posts.dart';
import 'package:fudo_challenge/pages/home5/widgets/users.dart';
import '../../framework/spread_builder.dart';
import 'home5_states.dart';

class HomePage5 extends StatelessWidget {
  final Users5State users = Users5State(id: 'users');
  final Posts5State posts = Posts5State(id: 'posts');

  HomePage5({super.key
  });


  @override
  Widget build(BuildContext context) {
    SpreadState().emit<Home5PageState>(users);
    SpreadState().emitEntity(users);
    SpreadState().emitEntity(posts);

    return Scaffold(
        appBar: _appbar,
        bottomNavigationBar: _navigator(context),
        body: Spread<Home5PageState>(
          builder: _homeBody,
        )
    );
  }

  Widget _homeBody(BuildContext context, Home5PageState? state) {
    switch(state.runtimeType) {
      case Posts5State: {
        return Posts5Page(posts: posts);
      }
      case Users5State:
      default: {
        return Users5Page(users: users);
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
        users.increment();
        SpreadState().emit<Home5PageState>(users);
        break;
      }
      case 1: {
        posts.increment();
        SpreadState().emit<Home5PageState>(posts);
        break;
      }
    }
  }
}