import 'dart:async';
import 'dart:convert';
import '../framework/http_client.dart';
import 'dtos/post_dto.dart';
import 'dtos/user_dto.dart';
import 'exceptions.dart';

abstract interface class PostsPort {
  Future<List<UserDTO>> findAllUsers();
  Future<List<PostDTO>> findPostsById(int id);
  Future<PostDTO> create(PostDTO postDTO);
}

class PostsApiPort implements PostsPort {
  final HttpClient httpClient;
  static const baseUrl = 'https://jsonplaceholder.typicode.com';
  static final Uri usersURI = Uri.parse('$baseUrl/users/');
  static final Uri createPostURI = Uri.parse('$baseUrl/posts');

  PostsApiPort({required this.httpClient});

  @override
  Future<List<UserDTO>> findAllUsers() async {
    final response = await httpClient.get(usersURI);

    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = json.decode(response.body);
      return jsonResponse.map((user) => UserDTO.fromJson(user)).toList();
    } else {
      throw PostPortException('Failed to load users', response);
    }
  }

  @override
  Future<List<PostDTO>> findPostsById(int id) async {
    final uri = Uri.parse('$baseUrl/users/${id.toString()}/posts');
    final response = await httpClient.get(uri);

    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = json.decode(response.body);
      return jsonResponse.map((post) => PostDTO.fromJson(post)).toList();
    } else {
      throw PostPortException('Failed to load posts', response);
    }
  }

  @override
  Future<PostDTO> create(PostDTO postDTO) async {
    final uri = Uri.parse('$baseUrl/users/${postDTO.userId.toString()}/posts');
    final body = json.encode(postDTO.toJson());
    final response = await httpClient.post(uri, body: body);

    if (response.statusCode == 201) {
      dynamic post = json.decode(response.body);
      return PostDTO(
        id: post['id'],
        userId: postDTO.userId,
        title: postDTO.title,
        body: postDTO.body
      );
    } else {
      throw PostPortException('Failed to create post', response);
    }
  }
}
