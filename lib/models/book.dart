import 'package:equatable/equatable.dart';

class Book extends Equatable {
  final String id;
  final String selfLink;
  final String title;
  final String publishedDate;
  final String image;
  final String language;
  final String previewLink;
  final List<String> authors;
  final List<String> categories;
  final String description;
  final int pageCount;
  final int rating;

  const Book({
    this.id,
    this.selfLink,
    this.title,
    this.publishedDate,
    this.image,
    this.authors,
    this.language,
    this.previewLink,
    this.categories,
    this.description,
    this.pageCount,
    this.rating,
  });

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      id: json['id'] as String,
      selfLink: json['selfLink'] as String,
      title: json['volumeInfo'] == null
          ? null
          : json['volumeInfo']['title'] as String,
      publishedDate: json['volumeInfo'] == null
          ? null
          : json['volumeInfo']['publishedDate'] as String,
      image:
          json['volumeInfo'] != null && json['volumeInfo']['imageLinks'] != null
              ? json['volumeInfo']['imageLinks']['thumbnail'] as String
              : null,
      authors: json['volumeInfo'] == null
          ? null
          : (json['volumeInfo']['authors']?.cast<String>()),
      language: json['volumeInfo'] == null
          ? null
          : json['volumeInfo']['language'] as String,
      previewLink: json['volumeInfo'] == null
          ? null
          : json['volumeInfo']['previewLink'] as String,
      categories: json['volumeInfo'] == null
          ? null
          : (json['volumeInfo']['categories']?.cast<String>()),
      description: json['volumeInfo'] == null
          ? null
          : json['volumeInfo']['description'] as String,
      pageCount: json['volumeInfo'] == null
          ? null
          : json['volumeInfo']['pageCount'] as int,
      rating: json['volumeInfo'] == null
          ? null
          : (json['volumeInfo']['pageCount'] as int) % 100,
    );
  }

  List<Object> get props {
    return [
      id,
      selfLink,
      title,
      publishedDate,
      image,
      authors,
      language,
      previewLink,
      categories,
      description,
      pageCount,
      rating
    ];
  }
}
