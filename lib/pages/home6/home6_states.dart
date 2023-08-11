
import 'package:fudo_challenge/framework/spread_state.dart';

abstract class Home6PageState
    implements Entity {
  final String id;
  int _count = 0;

  Home6PageState(this.id);

  void increment() {
    _count ++;
  }
  int get count => _count;

  @override
  String get entityId => id;
}

class Users6State extends Home6PageState {
  Users6State({required String id}) : super(id);
}

class Posts6State extends Home6PageState {
  Posts6State({required String id}) : super(id);
}