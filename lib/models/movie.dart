import 'package:equatable/equatable.dart';

class Movie extends Equatable {
  final int id;
  final String title;
  final String releaseDate;
  final String image;
  final String language;
  final String description;
  final double averageRating;

  const Movie(
      {this.id,
      this.title,
      this.releaseDate,
      this.image,
      this.language,
      this.description,
      this.averageRating});

  @override
  String toString() {
    return 'Movie(id: $id)';
  }

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      id: json['id'] as int,
      title: json['original_title'] == null
          ? null
          : json['original_title'] as String,
      releaseDate:
          json['release_date'] == null ? null : json['release_date'] as String,
      image: json['poster_path'] == null
          ? null
          : "https://image.tmdb.org/t/p/original/" +
              (json['poster_path'] as String),
      language: json['original_language'] == null
          ? null
          : json['original_language'] as String,
      description: json['overview'] == null ? null : json['overview'] as String,
      averageRating: json['vote_average'] == null
          ? null
          : (json['vote_average'].toDouble()) * 10,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'releaseDate': releaseDate,
      'image': image,
      'language': language,
      'description': description,
      'averageRating': averageRating,
    };
  }

  List<Object> get props {
    return [
      id,
      title,
      releaseDate,
      image,
      language,
      description,
      averageRating
    ];
  }
}
