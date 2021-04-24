part of 'movies_bloc.dart';

abstract class MoviesState extends Equatable {
  const MoviesState();

  @override
  List<Object> get props => [];
}

class MoviesInitial extends MoviesState {}

class MoviesLoadingState extends MoviesState {}

class MoviesErrorState extends MoviesState {
  final String errorMessage;

  MoviesErrorState({@required this.errorMessage});
  @override
  List<Object> get props => [errorMessage];
}

class MoviesLoadedState extends MoviesState {
  final List<Movie> moviesList;

  MoviesLoadedState({@required this.moviesList});
  @override
  List<Object> get props => [moviesList];
}
