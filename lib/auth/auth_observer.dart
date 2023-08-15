
import 'states.dart';
import 'package:spread/spread.dart';

class AuthObserver extends SpreadObserver<LoginResult> {
  final void Function(LoginResultFail)? onFail;
  final void Function(LoginResultSuccess)? onSuccess;

  AuthObserver({this.onFail, this.onSuccess});

  @override
  void onState(LoginResult state) async {
   switch (state.runtimeType) {
     case LoginResultFail: {
       onFail?.call(state as LoginResultFail);
       break;
     }
     case LoginResultSuccess: {
       onSuccess?.call(state as LoginResultSuccess);
       break;
     }
   }
  }

}