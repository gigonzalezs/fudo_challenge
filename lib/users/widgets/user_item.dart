import 'package:flutter/material.dart';
import 'package:spread/spread.dart';
import '../model/user.dart';

class UserItem extends StatelessWidget with StateEmitter {
  final User user;
  bool _selected = false;

  UserItem({super.key, required this.user});

  static const Color _tileColor = Colors.transparent;
  static final Color _hoverColor = Colors.blue[100]!;
  static final Color _tapColor = Colors.blue[300]!;

  @override
  Widget build(BuildContext context) {
    return Spread<_UserItemState>(
        builder: (BuildContext ctx, _UserItemState? state) {
      late Color backColor;
      if (state == null) {
        backColor = _tileColor;
      } else {
        switch (state) {
          case _UserItemState.NoSelected:
            {
              backColor = _tileColor;
              break;
            }
          case _UserItemState.Selected:
            {
              backColor = _tapColor;
              break;
            }
          case _UserItemState.HoverIn:
            {
              backColor = _hoverColor;
              break;
            }
          case _UserItemState.HoverOut:
            {
              backColor = _tileColor;
              break;
            }
        }
      }
      return MouseRegion(
          onEnter: (_) => emit<_UserItemState>(_UserItemState.HoverIn),
          onExit: (_) => emit<_UserItemState>(_UserItemState.HoverOut),
          child: InkWell(
            onTap: () => _toggleSelected(),
              child: ListTile(
              tileColor: _tileColor, //backColor,
              title: Text(user.name),
              subtitle: Row(
                children: [Text('${user.userName} <${user.email}>')],
              )
          )
          )
      );
    });
  }

  void _toggleSelected() {
    _selected = !_selected;
    if (_selected) {
      emit<_UserItemState>(_UserItemState.Selected);
    } else {
      emit<_UserItemState>(_UserItemState.NoSelected);
    }
  }
}

enum _UserItemState {
  NoSelected, Selected, HoverIn, HoverOut
}
