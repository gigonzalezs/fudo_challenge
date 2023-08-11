
import 'package:flutter/cupertino.dart';
import 'package:fudo_challenge/framework/spread_builder.dart';

import '../home5_states.dart';

class Users5Page extends StatelessWidget {
  const Users5Page({super.key});
  
  @override
  Widget build(BuildContext context) => Spread<Home5PageState>(
      builder: (BuildContext context, Home5PageState? state) {
        return Center(
          child: Text(state?.count.toString() ?? "<USERS>"),
        );
      }
  );

}