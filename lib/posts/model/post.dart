
import '../../ports/ports.dart';

class Post {
  final int id;
  final int userId;
  final String title;
  final String body;

  Post({required this.id, required this.userId, required this.title, required this.body});

  factory Post.fromDTO(PostDTO dto) {
    return Post(
      id: dto.id,
      userId: dto.userId,
      title: dto.title,
      body: dto.body,
    );
  }

  PostDTO toDTO() => PostDTO(
    id: id,
    userId: userId,
    title: title,
    body: body,
  );
}