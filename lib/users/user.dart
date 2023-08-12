
import 'package:spread/entity.dart';

class User implements Entity {
  final int id;
  final String name;
  final List<UserPost> posts;

  User({required this.id, required this.name, this.posts = const []});

  dynamic toDynamic() => {
    'id': id,
    'name': name
  };

  static User fromDynamic(dynamic user) => User(
      id: user['id'],
      name: user['name']
  );


  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is User
        && other.id == id
        && other.name == name;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode;

  @override
  String toString() {
    return 'User{id: $id, name: $name}';
  }

  @override
  String get entityId => id.toString();
}

class UserPost {
  final String content;

  UserPost({required this.content});
}