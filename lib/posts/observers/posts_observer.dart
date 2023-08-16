
import 'package:spread/spread.dart';

import '../../pages/home/states.dart';
import '../model/post.dart';
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
      final stateKey =  "posts_cache_${state.post.userId}";
      final List<Post>? postsCached = SpreadState().
        getNamed<List<Post>>(stateKey);
      postsCached?.add(state.post);
      emit<AppState>(AppState.posts);
    }
    if (state is CreatePostFail) {
      print('error: ${state.error} ${state.stackTrace}');

      //emit<AppState>(AppState.posts);
    }
  }

}