import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:subspace/model/blog.dart';
import 'package:subspace/widgets/blog_detail.dart';
import 'package:transparent_image/transparent_image.dart';

class BlogContainer extends StatelessWidget {
  const BlogContainer({super.key, required this.blog});

  final Blog blog;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;
    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => BlogDetail(blog: blog)));
      },
      child: Card(
        elevation: 1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        color: Theme.of(context).colorScheme.background,
        surfaceTintColor: Theme.of(context).colorScheme.background,
        margin: const EdgeInsets.symmetric(vertical: 5),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: width * 0.45,
              height: height * 0.13,
              child: FadeInImage(
                placeholder: MemoryImage(kTransparentImage),
                image: CachedNetworkImageProvider(blog.imageUrl),
                fit: BoxFit.fill,
              ),
            ),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
                child: Text(
                  blog.title,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground),
                  textAlign: TextAlign.left,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
