
import 'package:flutter/material.dart';
import '../user.dart';

class UserItem extends StatelessWidget {
  final User user;

  const UserItem({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(user.name),
    );
  }

}