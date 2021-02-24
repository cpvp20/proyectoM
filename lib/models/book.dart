import 'package:equatable/equatable.dart';

class Book extends Equatable {
  final String title;
  final String isbn;
  final String description;
  // final List<String> language;
  //final List<String> authors;
  final String publishedDate;
  final String rating;

  const Book({
    this.title,
    this.isbn,
    this.description,
    // this.language,
    //this.authors,
    this.publishedDate,
    this.rating,
  });

  @override
  String toString() {
    return 'Book(title: $title, isbn: $isbn, description: $description, publishedDate: $publishedDate,  rating: $rating)';
  }

  factory Book.fromJson(Map<String, dynamic> json) {
    print("calling bookfromjson");
    return Book(
      title: json['title'] as String,
      isbn: json['isbn'] as String,
      description: json["description"] as String,
      //language: (json["language"]?.cast<String>()),
      //authors: (json['author_name']?.cast<String>()),
      publishedDate: json['publish_year'] as String,
      rating: json['title'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'isbn': isbn,
      "description": description,
      //   "language": language,
      //  'authors': authors,
      'publishedDate': publishedDate,
      'rating': rating,
    };
  }

  Book copyWith({
    String title,
    String isbn,
    List<String> authors,
    List<String> language,
    String publishedDate,
    String description,
    String rating,
  }) {
    return Book(
      title: title ?? this.title,
      isbn: isbn ?? this.isbn,
      //language: language ?? this.language,

      // authors: authors ?? this.authors,
      publishedDate: publishedDate ?? this.publishedDate,
      rating: rating ?? this.rating,
      description: description ?? this.description,
    );
  }

  @override
  List<Object> get props {
    return [
      title,
      isbn,
      //language,
      //authors,
      publishedDate,
      rating,

      description,
    ];
  }
}
