
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spread/spread_builder.dart';
import 'package:spread/spread_state.dart';
import '../home5_states.dart';

class Posts5Page extends StatelessWidget {
  final Posts5State posts;
  const Posts5Page({super.key, required this.posts});

  @override
  Widget build(BuildContext context) => Center(
    child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spread<Posts5State>(
              entity: posts,
              builder: (BuildContext context, Posts5State? state) {
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