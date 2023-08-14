import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spread/spread.dart';
import '../widgets/user_list.dart';
import '../states/user_states.dart';

class UsersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) =>
      Spread<UsersState>(builder: (BuildContext context, UsersState? state) {
        return UsersList(state: state);
      });
}
