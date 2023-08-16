import 'package:spread/spread.dart';

import '../../ports/ports.dart';

class User implements Entity {
  final int id;
  final String name;
  final String userName;
  final String email;

  User({required this.id, required this.name, required this.userName, required this.email});

  dynamic toDynamic() => {'id': id, 'name': name};

  static User fromDynamic(dynamic user) =>
      User(id: user['id'], name: user['name'], userName: user['useraame'], email: user['email'] );

  factory User.fromUserDto(UserDTO userDTO) {
    return User(
      id: userDTO.id,
      name: userDTO.name,
      userName: userDTO.username,
      email: userDTO.email
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is User && other.id == id && other.name == name;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode;

  @override
  String toString() {
    return 'User{id: $id, name: $name, username: $userName, email: $email}';
  }

  @override
  String get entityId => id.toString();
}
