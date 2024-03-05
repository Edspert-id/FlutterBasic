import 'dart:convert';

class Movie {
  final String title;
  final String thumbnailUrl;

  Movie({required this.title, required this.thumbnailUrl});

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'thumbnail': thumbnailUrl,
    };
  }

  factory Movie.fromMap(Map<String, dynamic> map) {
    return Movie(
      title: map['title'] ?? '',
      thumbnailUrl: map['thumbnail'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Movie.fromJson(String source) => Movie.fromMap(json.decode(source));
}
