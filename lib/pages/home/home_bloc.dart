import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fudo_challenge/pages/home/home_events.dart';
import 'package:fudo_challenge/pages/home/home_states.dart';

import '../../users/users_service.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  final UserService userService;

  HomePageBloc({
    required this.userService
  }) : super(UsersState.empty()) {
    on<ShowUsersEvent>(_onShowUsersEvent);
    on<ShowPostsEvent>(_onShowPostsEvent);
  }

  void _onShowUsersEvent(ShowUsersEvent event, Emitter emit) {
    emit(UsersState(
        users: userService.getUsers()
    ));
  }

  void _onShowPostsEvent(ShowPostsEvent event, Emitter emit) {
    emit(PostsState());
  }

  final _eventByTabIndex = {
    0: () => ShowUsersEvent(),
    1: () => ShowPostsEvent()
  };

  Future onNavigatorTap(int index) async {
    print('navigator tap: $index');
    final HomePageEvent event = _eventByTabIndex[index]!();
    print("adding event: $event");
    add(event);
  }

  Future start() async {
    add(ShowUsersEvent());
  }
}