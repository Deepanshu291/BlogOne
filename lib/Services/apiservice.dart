import 'dart:convert';

import 'package:blogone/Models/blogModel.dart';
import 'package:http/http.dart' as http;
import 'package:riverpod/riverpod.dart';

final blogProvider = Provider<BlogApi>((ref) {
  return BlogApi();
});

class BlogApi {
  
  Future<List<BlogModel>> fetchBlogs() async {
    final String url = 'https://intent-kit-16.hasura.app/api/rest/blogs';
    final String adminSecret =
        '32qR4KmXOIpsGPQKMqEJHGJS27G5s7HdSKO3gdtQd2kv5e852SiYwWNfxkZOBuQ6';

    try {
      final response = await http.get(Uri.parse(url), headers: {
        'x-hasura-admin-secret': adminSecret,
      });

      if (response.statusCode == 200) {
        // Request successful, handle the response data here
        var data = response.body;
        // print(data.runtimeType);
        Map<String, dynamic> map = json.decode(data);
        // print(map['blogs']);
        List<dynamic> blogs = map['blogs'];

        // print(blogs);
        List<BlogModel> bloglist =
            blogs.map((json) => BlogModel.fromJson(json)).toList();

        // print(bloglist.length);
        return bloglist;
        // print('Response data: ${response.body}');
      } else {
        // Request failed
        print('Request failed with status code: ${response.statusCode}');
        print('Response data: ${response.body}');
        return [];
      }
    } catch (e) {
      // Handle any errors that occurred during the request
      print('Error: $e');
      return [];
    }
  }
}
