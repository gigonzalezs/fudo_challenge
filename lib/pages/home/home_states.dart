
import '../../users/user.dart';

abstract class HomePageState {}

class UsersState extends HomePageState {
  final Future<List<User>> users;

  UsersState({required this.users});

  static UsersState empty() => UsersState(users: Future.value(List.empty()));
}

class PostsState extends HomePageState {}
