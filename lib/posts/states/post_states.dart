
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
