
import '../framework/spread_state.dart';
import '../framework/use_case.dart';
import '../services.dart';
import 'package:fudo_challenge/users/user_states.dart';

class LoadUsersUseCase implements UseCase {

  @override
  void execute() async {
    SpreadState().emit<UsersState>(LoadingUsers());
    Services().users.getUsers()
    .then((users) {
      SpreadState().emit<UsersState>(LoadedUsersSuccess(users: users));
    })
    .onError((error, stackTrace) {
      SpreadState().emit<UsersState>(LoadedUsersFail(
          error: error,
          stackTrace: stackTrace
      ));
    });
  }
}

