import 'dart:convert';

import 'package:test/test.dart';
import 'package:http/http.dart' as http;

void main() {
  test('http get status', () async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    expect(response.statusCode, 200);
  });

  test('http get body', () async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    expect(response.statusCode, 200);
    expect(jsonDecode(response.body), isList);
  });

  test('http get first post', () async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/posts/1'));

    var post = Post.fromJson(jsonDecode(response.body));
    expect(post, TypeMatcher<Post>());
    expect(post.id, 1);
  });

  test('http get posts', () async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

    var posts = jsonDecode(response.body);
    // List<Post> list = List<Post>.from(posts.map((data) => Post.fromJson(data)));
    List<Post> list = List.generate(posts.length, (i) {
      return Post.fromJson(posts[i]);
    });
    expect(list.length, 100);
  });
}

class Post {
  final int userId;
  final int id;
  final String title;
  final String body;

  Post(this.userId, this.id, this.title, this.body);

  Post.fromJson(Map<String, dynamic> data)
      : userId = data['userId'],
        id = data['id'],
        title = data['title'],
        body = data['body'];
}
