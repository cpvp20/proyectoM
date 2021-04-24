import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:proyectoM/models/movie.dart';
import 'package:proyectoM/repository/movies_repository.dart';
part 'movies_event.dart';
part 'movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  MoviesBloc() : super(MoviesInitial());
  MoviesRepository _movieRepo = MoviesRepository();

  @override
  Stream<MoviesState> mapEventToState(
    MoviesEvent event,
  ) async* {
    if (event is SearchMoviesEvent) {
      try {
        yield MoviesLoadingState();
        // le pasamos la lista de libros a la UI
        var movies = await _movieRepo.getAvailableMovies(event.queryText);
        yield MoviesLoadedState(
          moviesList: movies,
        );
      } catch (e) {
        // mostraria el error en la UI
        yield MoviesErrorState(errorMessage: "ERROR en movies bloc $e");
      }
    }
  }
}
