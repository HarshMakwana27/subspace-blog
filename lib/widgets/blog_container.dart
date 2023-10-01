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
    //final heigt = MediaQuery.sizeOf(context).height;
    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => BlogDetail(blog: blog)));
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: width * 0.45,
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            child: FadeInImage(
              placeholder: MemoryImage(kTransparentImage),
              image: CachedNetworkImageProvider(blog.image_url),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            width: width * 0.55,
            child: Text(
              blog.title,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
