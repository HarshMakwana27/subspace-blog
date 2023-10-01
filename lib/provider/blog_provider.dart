import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:subspace/model/blog.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class BlogsNotifier extends StateNotifier<List<Blog>> {
  BlogsNotifier() : super([]);

  Future<void> fetchBlogs() async {
    const String url = 'https://intent-kit-16.hasura.app/api/rest/blogs';
    const String adminSecret =
        '32qR4KmXOIpsGPQKMqEJHGJS27G5s7HdSKO3gdtQd2kv5e852SiYwWNfxkZOBuQ6';

    try {
      final response = await http.get(Uri.parse(url), headers: {
        'x-hasura-admin-secret': adminSecret,
      });

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body)['blogs'];

        // Convert the response data to a list of Blog objects
        final blogs = responseData
            .map((dynamic blogData) => Blog.fromJson(blogData))
            .toList();

        print(blogs.toString());

        // Update the state of the provider
        state = blogs;
      } else {
        // Request failed
        print('Request failed with status code: ${response.statusCode}');
        print('Response data: ${response.body}');
      }
    } catch (e) {
      // Handle any errors that occurred during the request
      print('Error: $e');
    }
  }
}

final blogsProvider = StateNotifierProvider<BlogsNotifier, List<Blog>>((ref) {
  return BlogsNotifier();
});
