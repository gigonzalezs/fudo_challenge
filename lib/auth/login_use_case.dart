
import 'states.dart';
import 'package:spread/spread.dart';
import '../services.dart';

class LoginUseCase with StateEmitter implements UseCase {
  final String username;
  final String password;

  LoginUseCase({required this.username, required this.password});

  @override
  void execute() async {
    Services().authService.login(username, password)
        .then((result) {
            print('LoginUseCase: login = $result');
            if (result) {
              emit<LoginResult>(LoginResultSuccess(
                  userName: username
              ));
            } else {
              emit<LoginResult>(LoginResultFail(
                  message: "Usuario o contraseña invalida."
              ));
            }
    });
  }


}