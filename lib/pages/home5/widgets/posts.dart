
import 'package:flutter/cupertino.dart';
import 'package:fudo_challenge/framework/spread_builder.dart';

import '../home5_states.dart';

class Posts5Page extends StatelessWidget {
  final Posts5State posts;
  const Posts5Page({super.key, required this.posts});

  @override
  Widget build(BuildContext context) => Spread<Posts5State>(
      entity: posts,
      builder: (BuildContext context, Posts5State? state) {
        return Center(
          child: Text(state?.count.toString() ?? "<POSTS>"),
        );
      }
  );

}