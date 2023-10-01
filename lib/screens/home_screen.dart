import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:subspace/provider/blog_provider.dart';
import 'package:subspace/widgets/blog_list.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  Future<void> _loadBlogs() {
    return ref.read(blogsProvider.notifier).fetchBlogs();
  }

  @override
  void initState() {
    super.initState();
    _loadBlogs();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: BlogListView());
  }
}
