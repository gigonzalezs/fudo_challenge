
import 'package:spread/spread.dart';

import '../../services.dart';
import '../../users/model/user.dart';
import '../model/post.dart';
import '../states/post_states.dart';

class LoadPostsUseCase extends UseCase with StateEmitter {
  final User user;

  LoadPostsUseCase({required this.user});

  @override
  void execute() async {
    emit<PostState>(LoadingPosts());
    Services().postsService.getPosts(userId: user.id)
    .then((posts) => emit<PostState>(LoadedPostsSuccess(posts: posts)))
    .onError((error, stackTrace) => emit<PostState>(LoadedPostsFail(
      error: error,
      stackTrace: stackTrace
    )));
  }
}

class CreatePostUseCase extends UseCase with StateEmitter {
  final Post post;

  CreatePostUseCase({required this.post});

  @override
  void execute() {
    // TODO: implement execute
  }
}