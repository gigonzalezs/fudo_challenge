
import '../../ports/ports.dart';

class Post {
  final int id;
  final String title;
  final String body;

  Post({required this.id, required this.title, required this.body});

  factory Post.fromDTO(PostDTO dto) {
    return Post(
      id: dto.id,
      title: dto.title,
      body: dto.body,
    );
  }
}