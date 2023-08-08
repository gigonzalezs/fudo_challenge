import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../framework/bloc_self_provider_builder.dart';
import 'home_bloc.dart';
import 'home_events.dart';
import 'home_states.dart';

typedef BottomNavigationBarBuilder = BottomNavigationBar Function(BuildContext);

class HomeScaffoldBuilder extends StatelessWidget {
  final HomePageBloc bloc;
  final AppBar appBar;
  final BottomNavigationBarBuilder bottomNavigationBarBuilder;
  final BlocWidgetBuilder<UsersState> usersBuilder;
  final BlocWidgetBuilder<PostsState> postsBuilder;

  const HomeScaffoldBuilder(
      {super.key, required this.bloc,
      required this.appBar,
      required this.bottomNavigationBarBuilder,
      required this.usersBuilder,
      required this.postsBuilder});

  @override
  Widget build(BuildContext context) {
    return BlocSelfProviderBuilder<HomePageBloc, HomePageState>(
      bloc: bloc,
      builder: (BuildContext ctx, HomePageState state) {
        return Scaffold(
            appBar: appBar,
            bottomNavigationBar: bottomNavigationBarBuilder(ctx),
            body: _buildBodyForState(ctx, state, usersBuilder, postsBuilder)
        );
      }
    );
  }

  Widget _buildBodyForState(BuildContext context, HomePageState state,
      BlocWidgetBuilder<UsersState> usersBuilder,
      BlocWidgetBuilder<PostsState> postsBuilder) {
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