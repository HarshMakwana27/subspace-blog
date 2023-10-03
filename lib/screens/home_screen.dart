import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:subspace/provider/blog_provider.dart';
import 'package:subspace/widgets/blog_container.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends ConsumerState<HomeScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "SubSpace",
          style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                fontWeight: FontWeight.w400,
                color: Theme.of(context).colorScheme.primary,
              ),
        ),
        actions: [Icon(Icons.search)],
      ),
      body: _selectedIndex == 0
          ? FutureBuilder<void>(
              future: ref.read(blogsProvider.notifier).fetchBlogs(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text(
                      "Failed to fetch blogs, please try again later !",
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: Theme.of(context).colorScheme.onBackground,
                          ),
                    ),
                  );
                } else {
                  final blogs = ref.read(blogsProvider);

                  if (blogs.isEmpty) {
                    return Center(
                      child: Text(
                        "No blogs available.",
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              color: Theme.of(context).colorScheme.onBackground,
                            ),
                      ),
                    );
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
            )
          : Center(
              child: Text(
                "Favourites will be displayed here.",
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
            ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favourites',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Theme.of(context).colorScheme.primary,
        onTap: _onItemTapped,
        backgroundColor: Theme.of(context).colorScheme.background,
        unselectedItemColor:
            Theme.of(context).colorScheme.onBackground.withOpacity(0.5),
      ),
      drawer: const Drawer(),
      backgroundColor: Theme.of(context).colorScheme.background,
    );
  }
}
