
import 'package:fudo_challenge/framework/spread_state.dart';

abstract class Home5PageState implements Entity {
  final String id;
  int _count = 0;

  Home5PageState(this.id);

  void increment() {
    _count ++;
  }
  int get count => _count;

  @override
  String get entityId => id;
}

class Users5State extends Home5PageState {
  Users5State({required String id}) : super(id);
}

class Posts5State extends Home5PageState {
  Posts5State({required String id}) : super(id);
}