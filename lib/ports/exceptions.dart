
import 'package:http/http.dart';

class PostPortException implements Exception {
  final String message;
  late final int status;
  late final String body;

  PostPortException(this.message, Response response) {
    status = response.statusCode;
    body = response.body;
  }
}