import 'dart:convert';
import 'dart:io';
import 'package:proyectoM/models/book_case.dart';
import 'package:http/http.dart';

class BooksRepository {
  static final BooksRepository _booksRepository = BooksRepository._internal();
  factory BooksRepository() {
    return _booksRepository;
  }

  BooksRepository._internal();

  Future<BookCase> getAvailableBooks(String query) async {
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
        BookCase bookCase = BookCase.fromJson(_responseAsJson);
        return bookCase;
      } else
        return BookCase(totalItems: 0);
    } catch (e) {
      // arroje un error
      throw "Ha ocurrido un error: $e";
    }
  }
}
