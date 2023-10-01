import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:subspace/provider/blog_provider.dart';

class BlogListView extends ConsumerWidget {
  const BlogListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final blogs = ref.watch(blogsProvider);

    if (blogs.length == 0) {
      return const Center(child: Text("No blogs available."));
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Blog Explorer"),
      ),
      body: ListView.builder(
        itemCount: blogs.length,
        itemBuilder: (context, index) {
          final blog = blogs[index];
          return ListTile(
            title: Text(blog.title),
            leading: Image.network(blog.image_url),
            onTap: () {
              // // Navigate to the detailed view of the selected blog
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => DetailedBlogView(blog: blog),
              //   ),
              // );
            },
          );
        },
      ),
    );
  }
}
