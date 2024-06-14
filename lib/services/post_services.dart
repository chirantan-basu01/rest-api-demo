import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/post_model.dart';

class PostRepository {
  final String baseUrl = 'https://jsonplaceholder.typicode.com';

  Future<List<Post>> fetchPosts() async {
    final response = await http.get(Uri.parse('$baseUrl/posts'));

    try {
      if (response.statusCode == 200) {
        // List<Post> posts = Post.fromJsonList(response.body);
        List<dynamic> jsonResponse = json.decode(response.body);
        List<Post> posts =
            jsonResponse.map((post) => Post.fromJson(post)).toList();
        return posts;
      } else {
        throw Exception('Failed to load posts');
      }
    } catch (e) {
      rethrow;
    }
  }
}
