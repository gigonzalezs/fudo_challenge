
import 'package:flutter_test/flutter_test.dart';
import 'package:fudo_challenge/auth/auth_observer.dart';
import 'package:fudo_challenge/auth/states.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:spread/spread.dart';

import '../framework/wait_for_it.dart';
@GenerateNiceMocks([MockSpec<AuthObserverConsumer>()])
import 'auth_observer_test.mocks.dart';

class AuthObserverConsumer {
  void onFail(LoginResultFail fail) {}
  void onSuccess(LoginResultSuccess success) {}
}

void main() async {

  group('AuthObserver tests:', () {

    test('Given a LoginResultSuccess state When observer receives state Then verify onSuccess was invoked', () async {

      // given
      final state = LoginResultSuccess(userName: 'username');
      final mock = MockAuthObserverConsumer(
      );
      final sut = AuthObserver(
        onSuccess: (state) => mock.onSuccess(state),
        onFail: (state) => mock.onFail(state)
      )..selfRegister();

      //when
      SpreadState().emit<LoginResult>(state);

      //then
      await waitForIt('Waits for state is emitted in background', () {
        verify(mock.onSuccess(state));
      });

      /*
      await Future.delayed(
        const Duration(milliseconds: 100),
          () {
            verify(mock.onSuccess(state));
          }
      );
       */

    });

    test('Given a LoginResultFail state When observer receives state Then verify onFail was invoked', () async {

      // given
      final state = LoginResultFail(message: 'error');
      final mock = MockAuthObserverConsumer(
      );
      final sut = AuthObserver(
          onSuccess: (state) => mock.onSuccess(state),
          onFail: (state) => mock.onFail(state)
      )..selfRegister();

      //when
      SpreadState().emit<LoginResult>(state);

      //then
      await waitForIt('Waits for state is emitted in background', () {
        verify(mock.onFail(state));
      });

    });

  });
}