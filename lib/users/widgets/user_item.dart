import 'package:flutter/material.dart';
import 'package:spread/spread.dart';
import '../model/user.dart';

class UserItem extends StatelessWidget with StateEmitter {
  final User user;
  bool _selected = false;
  Color backColor = _tileColor;

  UserItem({super.key, required this.user});

  static const Color _tileColor = Colors.transparent;
  static final Color _tapColor = Colors.blue[300]!;

  @override
  Widget build(BuildContext context) {
    return Spread<_UserItemState>(
        builder: (BuildContext ctx, _UserItemState? state) {

      if (state == null) {
        backColor = _tileColor;
      } else {

        switch (state.runtimeType) {
          case _UserNoSelectedState:
            {
              if (state.user == user) {
                backColor = _tileColor;
              }
              break;
            }
          case _UserSelectedState:
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
      emit<_UserItemState>(_UserSelectedState(user: user));
    } else {
      emit<_UserItemState>(_UserNoSelectedState(user: user));
    }
  }
}

abstract class _UserItemState {
  final User user;

  _UserItemState({required this.user});
}
class _UserNoSelectedState extends _UserItemState {
  _UserNoSelectedState({required super.user});
}
class _UserSelectedState extends _UserItemState {
  _UserSelectedState({required super.user});
}
