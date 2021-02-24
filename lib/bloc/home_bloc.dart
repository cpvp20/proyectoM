import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:google_books_api/models/book.dart';
import 'package:google_books_api/repository/books_repository.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial());
  BooksRepository _bookRepo = BooksRepository();

  @override
  Stream<HomeState> mapEventToState(
    HomeEvent event,
  ) async* {
    if (event is SearchBookEvent) {
      try {
        yield HomeLoadingState();
        // le pasamos la lista de libros a la UI
        var bookCase = await _bookRepo.getAvailableBooks(event.queryText);
        yield HomeLoadedState(
          booksFount: bookCase.totalItems,
          booksList: bookCase.items,
        );
      } catch (error) {
        print(
            "Ha ocurrido un error al tratar de cargar libros buscados con getAvailableBooks: $error");
        yield HomeErrorState(errorMessage: "$error");
      }
    }
  }
}
