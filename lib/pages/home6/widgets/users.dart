import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spread/spread_builder.dart';
import 'package:spread/spread_state.dart';


import '../home6_states.dart';

class Users6Page extends StatelessWidget {
  final Users6State users;
  const Users6Page({super.key, required this.users});

  @override
  Widget build(BuildContext context) => Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spread<Users6State>(
              entity: users,
              builder: (BuildContext context, Users6State? state) {
                return Text(state?.count.toString() ?? "<USERS>");
              }),
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
