import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:proyectoM/models/movie.dart';
part 'favorite_movies_event.dart';
part 'favorite_movies_state.dart';

class FavoriteMoviesBloc
    extends Bloc<FavoriteMoviesEvent, FavoriteMoviesState> {
  final _cFirestore = FirebaseFirestore.instance;

  FavoriteMoviesBloc() : super(FavoriteMoviesInitial());

  @override
  Stream<FavoriteMoviesState> mapEventToState(
    FavoriteMoviesEvent event,
  ) async* {
    if (event is GetFavoriteMoviesEvent) {
      try {
        yield FavoriteMoviesLoadingState();
        // le pasamos la lista de libros a la UI
        var movies = await _getMovies();
        yield FavoriteMoviesLoadedState(
          moviesList: movies,
        );
      } catch (e) {
        // mostraria el error en la UI
        yield FavoriteMoviesErrorState(errorMessage: "ERROR En movies bloc $e");
      }
    }
  }

  // recurpera la lista de docs en firestore
  // map a objet de dart
  // cada elemento agregarlo a una lista.
  Future<List<Movie>> _getMovies() async {
    try {
      var movies = await _cFirestore.collection("favorite_movies").get();
      print("obteniendo libros de la firebase DB");
      return movies.docs
          .map(
            (element) => Movie(
              id: element["id"],
              image: element["image"],
              language: element["language"],
              releaseDate: element["releaseDate"],
              title: element["title"],
              averageRating: element["averageRating"],
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
