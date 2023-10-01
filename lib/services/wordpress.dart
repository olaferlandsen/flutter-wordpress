import 'package:flutter_application_1/models/post_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Wordpress {

  static Future<List<PostModel>> fetchPosts() async {
    final response = await http.get(Uri.parse('https://public-api.wordpress.com/rest/v1.1/sites/ohmyflutter.wordpress.com/posts'));
    if (response.statusCode == 200) {
      Map<String, dynamic> jsonResponse = json.decode(response.body);
      List<dynamic> postsJson = jsonResponse['posts'];
      List<PostModel> posts = postsJson.map((post) => PostModel.fromJson(post)).toList();
      return posts;
    } else {
      throw Exception('Failed to load posts');
    }
  }

  static Future<PostModel> getPostBySlug (String slug) async {
    // ignore: prefer_interpolation_to_compose_strings
    final response = await http.get(Uri.parse('https://public-api.wordpress.com/rest/v1.1/sites/ohmyflutter.wordpress.com/posts/slug:' + slug));
    dynamic jsonResponse = json.decode(response.body);
    return PostModel.fromJson(jsonResponse);
  }

   static Future<PostModel> getPostById (int id) async {
    // ignore: prefer_interpolation_to_compose_strings
    final response = await http.get(Uri.parse('https://public-api.wordpress.com/rest/v1.1/sites/ohmyflutter.wordpress.com/posts/' + id.toString()));
    dynamic jsonResponse = json.decode(response.body);
    return PostModel.fromJson(jsonResponse);
  }
}