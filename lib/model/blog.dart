class Blog {
  final String id;
  final String imageUrl;
  final String title;
  bool isFav;

  Blog({
    required this.id,
    required this.imageUrl,
    required this.title,
    this.isFav = false,
  });

  factory Blog.fromJson(json) {
    return Blog(
      id: json['id'],
      title: json['title'],
      imageUrl: json['image_url'],
    );
  }
}
