import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:subspace/provider/blog_provider.dart';
import 'package:subspace/widgets/blog_container.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Blog Explorer"),
      ),
      body: FutureBuilder<void>(
        future: ref.read(blogsProvider.notifier).fetchBlogs(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else {
            final blogs = ref.read(blogsProvider);

            if (blogs.isEmpty) {
              return const Center(child: Text("No blogs available."));
            }

            return ListView.builder(
              itemCount: blogs.length,
              itemBuilder: (context, index) {
                final blog = blogs[index];
                return BlogContainer(
                  blog: blog,
                );
              },
            );
          }
        },
      ),
    );
  }
}
