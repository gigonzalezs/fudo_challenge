
import '../../ports/ports.dart';
import '../model/post.dart';

abstract interface class PostsService {
  Future<List<Post>> getPosts({required int userId});
}

class PostServiceImpl implements PostsService {
  final PostsPort repository;

  PostServiceImpl({required this.repository});

  @override
  Future<List<Post>> getPosts({required int userId}) {
    return repository.findPostsById(userId)
        .then((postDtos) => postDtos
          .map((postDto) => Post.fromDTO(postDto))
          .toList(growable: false)
    );
  }

}