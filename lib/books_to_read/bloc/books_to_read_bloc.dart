import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:proyectoM/models/book.dart';
import 'package:proyectoM/repository/books_repository.dart';
part 'books_to_read_event.dart';
part 'books_to_read_state.dart';

class BooksToReadBloc extends Bloc<BooksToReadEvent, BooksToReadState> {
  final _cFirestore = FirebaseFirestore.instance;

  BooksToReadBloc() : super(BooksToReadInitial());

  @override
  Stream<BooksToReadState> mapEventToState(
    BooksToReadEvent event,
  ) async* {
    if (event is GetBooksToReadEvent) {
      try {
        yield BooksToReadLoadingState();
        // le pasamos la lista de libros a la UI
        var books = await _getBooks();
        yield BooksToReadLoadedState(
          booksList: books,
        );
      } catch (e) {
        // mostraria el error en la UI
        yield BooksToReadErrorState(errorMessage: "ERROR EN books bloc $e");
      }
    }
  }

  // recurpera la lista de docs en firestore
  // map a objet de dart
  // cada elemento agregarlo a una lista.
  Future<List<Book>> _getBooks() async {
    try {
      var books = await _cFirestore.collection("books_to_read").get();
      print("obteniendo libros de la firebase DB");
      return books.docs
          .map(
            (element) => Book(
              id: element["id"],
              image: element["image"],
              language: element["language"],
              pageCount: element["pageCount"],
              previewLink: element["previewLink"],
              publishedDate: element["publishedDate"],
              selfLink: element["selfLink"],
              authors: element["authors"]?.cast<String>(),
              title: element["title"],
              averageRating: element["averageRating"],
              categories: element["categories"]?.cast<String>(),
              description: element["description"],
            ),
          )
          .toList();
    } catch (e) {
      print("Error: $e");
      return [];
    }
  }
}
