
import '../../../framework/spread_state.dart';
import '../home6_states.dart';

abstract interface class UseCase {
  void execute();
}

class IncrementUsersUseCase implements UseCase {
  final Users6State users;

  IncrementUsersUseCase({required this.users});

  @override
  void execute() {
    users.increment();
    SpreadState().emitEntity(users);
  }
}

class IncrementPostsUseCase implements UseCase {
  final Posts6State posts;

  IncrementPostsUseCase({required this.posts});

  @override
  void execute() {
    posts.increment();
    SpreadState().emitEntity(posts);
  }
}