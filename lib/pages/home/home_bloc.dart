
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fudo_challenge/pages/home/home_events.dart';
import 'package:fudo_challenge/pages/home/home_states.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  HomePageBloc() : super(UsersState()) {
    on<ShowUsersEvent>((event, emit) => emit(UsersState()));
    on<ShowPostsEvent>((event, emit) => emit(PostsState()));
  }

  @override
  Stream<HomePageState> mapEventToState(HomePageEvent event) async* {
    print ("event received: $event");
    if (event is ShowUsersEvent) {
      yield UsersState();

    } else if (event is ShowPostsEvent) {
      yield PostsState();
    }
  }
}