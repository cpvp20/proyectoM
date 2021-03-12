import 'dart:convert';
import 'dart:io';
import 'package:proyectoM/models/book.dart';
import 'package:http/http.dart';

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
      final response = await get(_uri.toString());
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
}
