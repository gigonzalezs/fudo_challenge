
class User {
  final int id;
  final String name;

  User({required this.id, required this.name});

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
}