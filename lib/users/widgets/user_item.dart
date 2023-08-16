import 'package:flutter/material.dart';
import 'package:spread/spread.dart';
import '../model/user.dart';
import '../states/user_item_states.dart';

class UserItem extends StatelessWidget with StateEmitter {
  final User user;
  bool _selected = false;
  Color backColor = _tileColor;

  UserItem({super.key, required this.user});

  static const Color _tileColor = Colors.transparent;
  static final Color _tapColor = Colors.blue[300]!;

  @override
  Widget build(BuildContext context) {
    return Spread<UserItemState>(
        builder: (BuildContext ctx, UserItemState? state) {

      if (state == null) {
        backColor = _tileColor;
      } else {

        switch (state.runtimeType) {
          case UserNoSelectedState:
            {
              if (state.user == user) {
                backColor = _tileColor;
              }
              break;
            }
          case UserSelectedState:
            {
              if (state.user == user) {
                backColor = _tapColor;
              } else {
                backColor = _tileColor;
              }
              break;
            }
        }
      }
      return InkWell(
          onTap: () => _toggleSelected(),
          child: ListTile(
              tileColor: backColor,
              title: Text(user.name),
              subtitle: Row(
                children: [Text('${user.userName} <${user.email}>')],
              )));
    });
  }

  void _toggleSelected() {
    _selected = !_selected;
    if (_selected) {
      emit<UserItemState>(UserSelectedState(user: user));
    } else {
      emit<UserItemState>(UserNoSelectedState(user: user));
    }
  }
}


