import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:fudo_challenge/framework/http_client.dart';
import 'package:fudo_challenge/ports/dtos/user_dto.dart';
import 'package:fudo_challenge/ports/exceptions.dart';
import 'package:fudo_challenge/ports/posts_port.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateNiceMocks([MockSpec<HttpClient>()])
import 'posts_port_test.mocks.dart';

const baseUrl = 'https://jsonplaceholder.typicode.com';
final Uri usersURI = Uri.parse('$baseUrl/users/');
final Uri createPostURI = Uri.parse('$baseUrl/posts');

final expctedfindAllUsers = '[{"id":1,"name":"Leanne Graham","username":"Bret","email":"Sincere@april.biz","address":{"street":"Kulas Light","suite":"Apt. 556","city":"Gwenborough","zipcode":"92998-3874","geo":{"lat":"-37.3159","lng":"81.1496"}},"phone":"1-770-736-8031 x56442","website":"hildegard.org","company":{"name":"Romaguera-Crona","catchPhrase":"Multi-layered client-server neural-net","bs":"harness real-time e-markets"}}]';


void main() async {
  final client = MockHttpClient();
  final PostsApiPort sut = PostsApiPort(httpClient: client);

  group('PostsApiPort tests:', () {

    test('Given a valid Http response When findAllUsers Then return successfully parsed response', () async {

      // given
      when(client.get(usersURI))
          .thenAnswer((_) => Future.value(http.Response(expctedfindAllUsers, 200)));

      // when
      final actual = await sut.findAllUsers();

      // then
      final expected = json.decode(expctedfindAllUsers)
          .map((user) => UserDTO.fromJson(user)).toList();
      expect(actual.length, equals(expected.length));
      expect(actual[0], equals(expected[0]));
    });

    test('Given a invalid Http response When findAllUsers Then throw exception', () async {

      // given
      final response = http.Response('', 500);
      when(client.get(usersURI))
          .thenAnswer((_) => Future.value(response));

      // when - then
      expect(() => sut.findAllUsers(), throwsA(const TypeMatcher<PostPortException>()));

    });
  });
}