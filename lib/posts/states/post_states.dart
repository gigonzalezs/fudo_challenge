
import '../model/post.dart';

abstract class PostState {}

class LoadingPosts extends PostState {}

class LoadedPostsSuccess extends PostState {
  final List<Post> posts;

  LoadedPostsSuccess({required this.posts});
}

class LoadedPostsFail extends PostState {
  final Object? error;
  final StackTrace? stackTrace;

  LoadedPostsFail({required this.error, required this.stackTrace});
}

abstract class CreatePostState {}

class SavingPost extends CreatePostState {}

class CreatePostSuccess extends CreatePostState {
  final Post post;

  CreatePostSuccess({required this.post});
}

class CreatePostFail extends CreatePostState {
  final Object? error;
  final StackTrace? stackTrace;

  CreatePostFail({required this.error, required this.stackTrace});
}
