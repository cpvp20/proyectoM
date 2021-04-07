import 'dart:convert';
import 'dart:io';
import 'package:proyectoM/models/book.dart';
import 'package:http/http.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class BooksRepository {
  static final BooksRepository _booksRepository = BooksRepository._internal();
  factory BooksRepository() {
    return _booksRepository;
  }

  BooksRepository._internal();

  Future<List<Book>> getAvailableBooks(String query) async {
    // https://www.googleapis.com/books/v1/volumes?q=query
    final _uri = Uri(
        scheme: "https",
        host: "www.googleapis.com",
        path: "books/v1/volumes",
        queryParameters: {"q": query});

    try {
      final response = await get(_uri);
      if (response.statusCode == HttpStatus.ok) {
        var _responseAsJson = jsonDecode(response.body);

        var results = (_responseAsJson['items'] as List<dynamic>)?.map((e) {
          return e == null ? null : Book.fromJson(e as Map<String, dynamic>);
        })?.toList();

        return results;
      } else
        return null;
    } catch (e) {
      // arroje un error
      throw "Ha ocurrido un error: $e";
    }
  }

  Future<List<Book>> getBooksToRead() async {
    var books =
        await FirebaseFirestore.instance.collection('books_to_read').get();
    List<Book> results = books.docs
        .map((element) => Book(
            id: element['id'] as String,
            selfLink: element['selfLink'] as String,
            title: element['title'] as String,
            publishedDate: element['publishedDate'] as String,
            image: element['image'] as String,
            authors: (element['authors']?.cast<String>()),
            language: element['language'] as String,
            previewLink: element['previewLink'] as String,
            categories: (element['categories']?.cast<String>()),
            description: element['description'] as String,
            pageCount: element['pageCount'] as int,
            rating: (element['pageCount'] as int) % 100))
        .toList();

    print(results);
    return results;
  }
}
