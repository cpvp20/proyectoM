import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:proyectoM/models/book.dart';
import 'package:proyectoM/repository/books_repository.dart';
part 'book_event.dart';
part 'book_state.dart';

class BookBloc extends Bloc<BookEvent, BookState> {
  BookBloc() : super(BookInitial());
  BooksRepository _bookRepo = BooksRepository();

  @override
  Stream<BookState> mapEventToState(
    BookEvent event,
  ) async* {
    if (event is SearchBookEvent) {
      try {
        yield BookLoadingState();
        // le pasamos la lista de libros a la UI
        var books = await _bookRepo.getAvailableBooks(event.queryText);
        yield BookLoadedState(
          booksList: books,
        );
      } catch (e) {
        // mostraria el error en la UI
        yield BookErrorState(errorMessage: "ERROR EN books bloc $e");
      }
    }
    if (event is SearchBooksToReadEvent) {
      try {
        yield BookLoadingState();
        // le pasamos la lista de libros a la UI
        var books = await _bookRepo.getBooksToRead();
        yield BookLoadedState(
          booksList: books,
        );
      } catch (e) {
        // mostraria el error en la UI
        yield BookErrorState(errorMessage: "ERROR EN books bloc\n $e");
      }
    }
  }
}
