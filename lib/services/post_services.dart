import 'dart:convert';
import 'dart:developer';
import '../models/post_model.dart';
import 'package:http/http.dart' as http;

class PostServices {
  static List<PostList> list = [];

  static Future<List<PostList>> getProductData({required int perPage}) async {
    try {
      http.Response response = await http
          .get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body) as List;
        list = data.map((e) => PostList.fromJson(e)).toList();
        perPage = perPage + 1;
      }
    } catch (e) {
      log("message", error: e.toString());
    }
    return list;
  }
}
