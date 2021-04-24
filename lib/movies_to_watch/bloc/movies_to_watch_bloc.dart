import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:proyectoM/models/book.dart';
import 'package:proyectoM/models/movie.dart';
part 'movies_to_watch_event.dart';
part 'movies_to_watch_state.dart';

class MoviesToWatchBloc extends Bloc<MoviesToWatchEvent, MoviesToWatchState> {
  final _cFirestore = FirebaseFirestore.instance;

  MoviesToWatchBloc() : super(MoviesToWatchInitial());

  @override
  Stream<MoviesToWatchState> mapEventToState(
    MoviesToWatchEvent event,
  ) async* {
    if (event is GetMoviesToWatchEvent) {
      try {
        yield MoviesToWatchLoadingState();
        // le pasamos la lista de libros a la UI
        var movies = await _getMovies();
        yield MoviesToWatchLoadedState(
          moviesList: movies,
        );
      } catch (e) {
        // mostraria el error en la UI
        yield MoviesToWatchErrorState(errorMessage: "ERROR EN movies bloc $e");
      }
    }
  }

  // recurpera la lista de docs en firestore
  // map a objet de dart
  // cada elemento agregarlo a una lista.
  Future<List<Movie>> _getMovies() async {
    try {
      var movies = await _cFirestore.collection("movies_to_watch").get();
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
