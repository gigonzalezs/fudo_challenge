
import 'package:spread/spread.dart';

import '../../pages/home/states.dart';
import '../states/post_states.dart';

class PostsObserver extends SpreadObserver<PostState> {
  @override
  void onState(PostState state) {
   print('PostsObserver: $state');
  }

}

class CreatePostObserver extends SpreadObserver<CreatePostState>
  with StateEmitter {

  @override
  void onState(CreatePostState state) {
    print('CreatePostObserver: $state');
    if (state is CreatePostSuccess) {
      emit<AppState>(AppState.posts);
    }
    if (state is CreatePostFail) {
      print('error: ${state.error} ${state.stackTrace}');

      //emit<AppState>(AppState.posts);
    }
  }

}