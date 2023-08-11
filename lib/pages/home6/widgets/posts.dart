
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../home6_states.dart';
import 'package:spread/spread_builder.dart';
import 'package:spread/spread_state.dart';

class Posts6Page extends StatelessWidget {
  final Posts6State posts;
  const Posts6Page({super.key, required this.posts});

  @override
  Widget build(BuildContext context) => Center(
    child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spread<Posts6State>(
              entity: posts,
              builder: (BuildContext context, Posts6State? state) {
                return Text(state?.count.toString() ?? "<POSTS>");
              }),
          IconButton(
              onPressed: () {
                print('increment posts');
                posts.increment();
                SpreadState().emitEntity(posts);
              },
              icon: const Icon(Icons.add_circle))
        ],
      )
  );
}