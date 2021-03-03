import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:proyectoM/models/book.dart';
import 'package:proyectoM/repository/books_repository.dart';

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
          booksFound: bookCase.totalItems,
          booksList: bookCase.items,
        );
      } catch (e) {
        // mostraria el error en la UI
        yield HomeErrorState(errorMessage: "$e");
      }
    }
  }
}
