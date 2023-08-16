
import 'package:flutter/material.dart';
import 'states.dart';
import 'auth_observer.dart';
import 'login_use_case.dart';

class LoginPage extends StatefulWidget {
  final String? errorMessage;

  LoginPage({super.key, this.errorMessage});

  @override
  State<StatefulWidget> createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {

  final TextEditingController userController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  late final AuthObserver observer;

  LoginPageState() {
    observer = AuthObserver(
        onFail: _onLoginFail
    )
    ..selfRegister();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: userController,
              decoration: const InputDecoration(
                labelText: 'Usuario',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Contraseña',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _onLoginButtonPressed,
              child: const Text('Login'),
            )
          ],
        ),
      ),
    );
  }

  void _onLoginFail(LoginResultFail fail) {
    _showSnackBar(fail.message);
  }

  void _showSnackBar(String message) {
    final snackBar = SnackBar(
        backgroundColor: Colors.red,
        content: Text(message)
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void _onLoginButtonPressed() async {
    LoginUseCase(
        username: userController.text,
        password: passwordController.text
    ).execute();
  }
}
