import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:proyectoM/models/movie.dart';
import 'package:proyectoM/repository/movies_repository.dart';
part 'movie_event.dart';
part 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  MovieBloc() : super(MovieInitial());
  MoviesRepository _movieRepo = MoviesRepository();

  @override
  Stream<MovieState> mapEventToState(
    MovieEvent event,
  ) async* {
    if (event is SearchMovieEvent) {
      try {
        yield MovieLoadingState();
        // le pasamos la lista de libros a la UI
        var movies = await _movieRepo.getAvailableMovies(event.queryText);
        yield MovieLoadedState(
          moviesList: movies,
        );
      } catch (e) {
        // mostraria el error en la UI
        yield MovieErrorState(errorMessage: "ERROR EN movie bloc $e");
      }
    }
  }
}
