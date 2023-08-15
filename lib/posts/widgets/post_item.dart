import 'package:flutter/material.dart';
import '../model/post.dart';


class PostItem extends StatelessWidget {
  final Post post;

  PostItem({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () => _toggleSelected(),
        child: ListTile(
            tileColor: Colors.transparent,
            title: Text(post.title),
            subtitle: Text(post.body)
        )
    );
  }
}

void _toggleSelected() {}


