import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:proyectoM/models/book.dart';
part 'favorite_books_event.dart';
part 'favorite_books_state.dart';

class FavoriteBooksBloc extends Bloc<FavoriteBooksEvent, FavoriteBooksState> {
  final _cFirestore = FirebaseFirestore.instance;

  FavoriteBooksBloc() : super(FavoriteBooksInitial());

  @override
  Stream<FavoriteBooksState> mapEventToState(
    FavoriteBooksEvent event,
  ) async* {
    if (event is GetFavoriteBooksEvent) {
      try {
        yield FavoriteBooksLoadingState();
        // le pasamos la lista de libros a la UI
        var books = await _getBooks();
        yield FavoriteBooksLoadedState(
          booksList: books,
        );
      } catch (e) {
        // mostraria el error en la UI
        yield FavoriteBooksErrorState(errorMessage: "ERROR EN books bloc $e");
      }
    }
  }

  // recurpera la lista de docs en firestore
  // map a objet de dart
  // cada elemento agregarlo a una lista.
  Future<List<Book>> _getBooks() async {
    try {
      var books = await _cFirestore.collection("favorite_books").get();
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
