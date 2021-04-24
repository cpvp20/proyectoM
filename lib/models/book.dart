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
  final double averageRating;

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
    this.averageRating,
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
        image: json['volumeInfo'] != null &&
                json['volumeInfo']['imageLinks'] != null
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
            ? 0
            : json['volumeInfo']['pageCount'] as int,
        averageRating: json['volumeInfo'] != null &&
                json['volumeInfo']['averageRating'] != null
            ? json['volumeInfo']['averageRating'].toDouble()
            : 3.0);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'selfLink': selfLink,
      'publishedDate': publishedDate,
      'image': image,
      'authors': authors,
      'previewLink': previewLink,
      'language': language,
      'categories': categories,
      'description': description,
      'pageCount': pageCount,
      'averageRating': averageRating,
    };
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
      averageRating
    ];
  }
}
