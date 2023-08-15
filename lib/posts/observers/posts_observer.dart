
import 'package:spread/spread.dart';

import '../states/post_states.dart';

class PostsObserver extends SpreadObserver<PostState> {
  @override
  void onState(PostState state) {
   print('PostsObserver: $state');
  }

}