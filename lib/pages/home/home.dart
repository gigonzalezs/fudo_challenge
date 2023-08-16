import 'package:flutter/material.dart';
import 'package:spread/spread.dart';
import '../../config.dart';
import '../../posts/posts_ui.dart';
import '../../users/users_ui.dart';
import '../../users/users.dart';
import 'states.dart';

class HomePage extends StatelessWidget with StateEmitter {

  HomePage({super.key}) {
    // set initial states
    emit<AppState>(AppState.users);
    LoadUsersUseCase().execute();
  }

  @override
  Widget build(BuildContext context) {
    return Spread<AppState>(
      builder: _homeBuilder,
    );
  }

  Widget _homeBuilder(BuildContext context, AppState? state) {
    return Scaffold(
      appBar: _appbar,
      bottomNavigationBar: _navigator(context, state),
      body: _homeBody(context, state),
      floatingActionButton: _addPostFab(context, state),
    );
  }

  Widget _homeBody(BuildContext context, AppState? state) {
    switch (state) {
      case AppState.createPost: {
        return CreatePostPage();
      }
      case AppState.posts:
        {
          return PostsPage();
        }
      case AppState.users:
      default:
        {
          return UsersPage();
        }
    }
  }

  AppBar get _appbar => AppBar(
        title: Text(appName),
      );

  BottomNavigationBar? _navigator(BuildContext context, AppState? state) {
    if (state != AppState.createPost) {
      return BottomNavigationBar(
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
    }
  }


  FloatingActionButton? _addPostFab(BuildContext context, AppState? state) {
    if (state == AppState.posts) {
      return FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () => emit<AppState>(AppState.createPost)
      );
    }
  }

  Future onNavigatorTap(int index) async {
    print('navigator tap: $index');
    switch (index) {
      case 0:
        {
          showUsers();
          break;
        }
      case 1:
        {
          showPosts();
          break;
        }
    }
  }

  void showUsers() async {
    LoadUsersUseCase().execute();
    emit<AppState>(AppState.users);
  }

  void showPosts() async {
    emit<AppState>(AppState.posts);
  }
}
