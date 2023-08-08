import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_bloc.dart';
import 'home_states.dart';

typedef UsersStateWidgetBuilder = Widget Function(BuildContext, UsersState);
typedef PostsStateWidgetBuilder = Widget Function(BuildContext, PostsState);
typedef BottomNavigationBarBuilder = BottomNavigationBar Function(BuildContext);

class HomeScaffoldBuilder extends StatelessWidget {
  final HomePageBloc bloc;
  final AppBar appBar;
  final BottomNavigationBarBuilder bottomNavigationBarBuilder;
  final UsersStateWidgetBuilder usersBuilder;
  final PostsStateWidgetBuilder postsBuilder;

  const HomeScaffoldBuilder(
      {super.key, required this.bloc,
      required this.appBar,
      required this.bottomNavigationBarBuilder,
      required this.usersBuilder,
      required this.postsBuilder});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => bloc,
        child: _HomeScaffoldContentBuilder(
          appBar: appBar,
          bottomNavigationBarBuilder: bottomNavigationBarBuilder,
          usersBuilder: usersBuilder,
          postsBuilder: postsBuilder,
        )
    );
  }
}

class _HomeScaffoldContentBuilder extends StatelessWidget {
  final AppBar appBar;
  final BottomNavigationBarBuilder bottomNavigationBarBuilder;
  final UsersStateWidgetBuilder usersBuilder;
  final PostsStateWidgetBuilder postsBuilder;

  const _HomeScaffoldContentBuilder(
      {super.key,
      required this.appBar,
      required this.bottomNavigationBarBuilder,
      required this.usersBuilder,
      required this.postsBuilder});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomePageBloc, HomePageState>(
      builder: (BuildContext ctx, HomePageState state) {
        return Scaffold(
            appBar: appBar,
            bottomNavigationBar: bottomNavigationBarBuilder(ctx),
            body: _buildBodyForState(ctx, state, usersBuilder, postsBuilder)
        );
      },
    );
  }

  Widget _buildBodyForState(BuildContext context, HomePageState state,
      UsersStateWidgetBuilder usersBuilder, PostsStateWidgetBuilder postsBuilder) {
    switch (state.runtimeType) {
      case PostsState:
        {
          return postsBuilder(context, state as PostsState);
        }
      case UsersState:
      default:
        {
          return usersBuilder(context, state as UsersState);
        }
    }
  }
}
