import 'dart:async';
import 'dart:convert';
import 'user_dto.dart';
import 'package:http/http.dart' as http;

abstract interface class PostsPort {
  Future<List<UserDTO>> findAllUsers();
}

class PostsApiPort implements PostsPort {

  @override
  Future<List<UserDTO>> findAllUsers() async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users/'));

    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = json.decode(response.body);
      return jsonResponse.map((user) => UserDTO.fromJson(user)).toList();
    } else {
      throw Exception('Failed to load users');
    }
  }
}
