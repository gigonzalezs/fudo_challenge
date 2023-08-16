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
    final stateKey =  "posts_cache_${user.id}";
    final List<Post>? postsCached =
    SpreadState().getNamed<List<Post>>(stateKey);

    if (postsCached != null) {
      emit<PostState>(LoadedPostsSuccess(posts: postsCached));
    } else {
        emit<PostState>(LoadingPosts());
        Services()
            .postsService
            .getPosts(userId: user.id)
            .then((posts) {
                emit<PostState>(LoadedPostsSuccess(posts: posts));
                emitNamed(stateKey, posts);
            })
            .onError((error, stackTrace) {
              emit<PostState>(LoadedPostsFail(
                  error: error,
                  stackTrace: stackTrace)
              );
        });
    }
  }
}

class CreatePostUseCase extends UseCase with StateEmitter {
  final Post post;

  CreatePostUseCase({required this.post});

  @override
  void execute() {
    emit<CreatePostState>(SavingPost());
    Services().postsService.savePost(post: post).then((savedPost) {
      emit<CreatePostState>(CreatePostSuccess(post: savedPost));
    }).onError((error, stackTrace) {
      emit<CreatePostState>(
          CreatePostFail(error: error, stackTrace: stackTrace));
    });
  }
}
