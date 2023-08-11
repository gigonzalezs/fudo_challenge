
import 'package:flutter/cupertino.dart';
import 'package:fudo_challenge/framework/spread_builder.dart';

import '../home4_states.dart';

class PostsPage extends StatelessWidget {
  const PostsPage({super.key});

  @override
  Widget build(BuildContext context) => Spread<Home4PageState>(
      builder: (BuildContext context, Home4PageState? state) {
        return Center(
          child: Text(state?.toString() ?? "<POSTS>"),
        );
      }
  );

}