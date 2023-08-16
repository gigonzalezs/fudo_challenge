import 'package:spread/spread.dart';
import '../../posts/posts.dart';
import '../states/user_item_states.dart';

class UserItemObserver extends SpreadObserver<UserItemState> with StateEmitter {
  @override
  onState(UserItemState state) {
    if (state is UserSelectedState) {
      LoadPostsUseCase(
          user: state.user
      ).execute();
    }
  }
}
