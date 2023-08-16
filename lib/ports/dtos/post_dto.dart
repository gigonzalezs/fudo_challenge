
class PostDTO {
  final int userId;
  final int id;
  final String title;
  final String body;

  PostDTO({required this.userId, required this.id, required this.title, required this.body});

  factory PostDTO.fromJson(Map<String, dynamic> json) {
    return PostDTO(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'id': id,
      'title': title,
      'body': body,
    };
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PostDTO &&
        other.userId == userId &&
        other.id == id &&
        other.title == title &&
        other.body == body;
  }

  @override
  int get hashCode {
    return userId.hashCode ^
    id.hashCode ^
    title.hashCode ^
    body.hashCode;
  }
}
