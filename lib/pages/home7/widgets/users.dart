import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spread/spread_builder.dart';
import 'package:fudo_challenge/users/widgets/user_list.dart';
import 'package:fudo_challenge/users/user_states.dart';

class Users7Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) =>
      Spread<UsersState>(
          builder: (BuildContext context, UsersState? state) {
            return User7List(state: state);
          }
      );
}
