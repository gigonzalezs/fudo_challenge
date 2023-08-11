
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fudo_challenge/framework/spread_builder.dart';
import 'package:fudo_challenge/framework/spread_state.dart';

import '../home5_states.dart';

class Users5Page extends StatelessWidget {
  final Users5State users;
  const Users5Page({super.key, required this.users});
  
  @override
  Widget build(BuildContext context) => Spread<Users5State>(
      entity: users,
      builder: (BuildContext context, Users5State? state) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(state?.count.toString() ?? "<USERS>"),
              IconButton(
                  onPressed: () {
                    print('increment users');
                    users.increment();
                    SpreadState().emitEntity(users);
                  },
                  icon: const Icon(Icons.add_circle))
            ],
          )
        );
      }
  );

}