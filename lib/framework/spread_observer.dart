
import 'package:fudo_challenge/framework/spread_state.dart';

abstract class SpreadObserver<T> {

  void selfRegister() async {
    SpreadState().subscribe<T>(onState);
  }

  void onState(T state);

}