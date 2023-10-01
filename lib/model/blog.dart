import 'dart:convert';

class Blog {
  final String id;
  final String image_url;
  final String title;

  Blog({
    required this.id,
    required this.image_url,
    required this.title,
  });

  factory Blog.fromJson(json) {
    return Blog(
      id: json['id'],
      title: json['title'],
      image_url: json['image_url'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'image_url': image_url,
    };
  }
}
