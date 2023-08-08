
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fudo_challenge/pages/home/home_events.dart';
import 'package:fudo_challenge/pages/home/home_states.dart';

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
}