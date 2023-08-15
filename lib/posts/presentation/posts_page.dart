import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spread/spread.dart';
import '../states/post_states.dart';
import '../widgets/post_list.dart';

class PostsPage extends StatelessWidget {

  const PostsPage({super.key});

  @override
  Widget build(BuildContext context) =>
      Spread<PostState>(builder: (BuildContext context, PostState? state) {
        return PostList(state: state);
      });
}
