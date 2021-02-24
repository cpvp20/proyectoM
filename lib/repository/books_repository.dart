import 'dart:convert';
import 'dart:io';

import 'package:google_books_api/models/book_case.dart';
import 'package:http/http.dart';

class BooksRepository {
  static final BooksRepository _booksRepository = BooksRepository._internal();
  factory BooksRepository() {
    return _booksRepository;
  }

  BooksRepository._internal();

  Future<BookCase> getAvailableBooks(String query) async {
    print("performing function getAvailableBooks");

    // https://www.googleapis.com/books/v1/volumes?q=query
    //http://openlibrary.org/search.json?title=the+lord+of+the+rings
    final _uri = Uri(
        scheme: "http",
        host: "openlibrary.org",
        path: "search.json",
        queryParameters: {"title": query});

    try {
      final response = await get(_uri.toString());
      if (response.statusCode == HttpStatus.ok) {
        var _responseAsJson = jsonDecode(response.body);
        print("start responseAsJson\n");
        print(_responseAsJson);
        print("end responseAsJson\n");
        BookCase bookCase = BookCase.fromJson(_responseAsJson);
        print("totalItems");
        print(bookCase.totalItems);
        print(bookCase.items);
        return bookCase;
      } else
        return BookCase(totalItems: 0);
    } catch (error) {
      throw "Ha ocurrido un error al llamar getAvailableBooks: $error";
    }
  }
}
