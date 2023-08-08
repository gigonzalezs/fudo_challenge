import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fudo_challenge/pages/home/home_events.dart';
import 'package:fudo_challenge/pages/home/home_states.dart';

extension HomePageBlocLookup on BuildContext {
  HomePageBloc get bloc {
   return BlocProvider.of<HomePageBloc>(this);
  }
}

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  HomePageBloc() : super(UsersState()) {
    on<ShowUsersEvent>(_onShowUsersEvent);
    on<ShowPostsEvent>(_onShowPostsEvent);
  }

  void _onShowUsersEvent(ShowUsersEvent event, Emitter emit) {
    emit(UsersState());
  }

  void _onShowPostsEvent(ShowPostsEvent event, Emitter emit) {
    emit(PostsState());
  }

  final _events = {
    0: () => ShowUsersEvent(),
    1: () => ShowPostsEvent()
  };

  Future onNavigatorTap(int index) async {
    print('navigator tap: $index');
    final HomePageEvent event = _events[index]!();
    print("adding event: $event");
    add(event);
  }
}