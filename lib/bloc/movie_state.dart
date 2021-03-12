part of 'movie_bloc.dart';

abstract class MovieState extends Equatable {
  const MovieState();

  @override
  List<Object> get props => [];
}

class MovieInitial extends MovieState {}

class MovieLoadingState extends MovieState {}

class MovieErrorState extends MovieState {
  final String errorMessage;

  MovieErrorState({@required this.errorMessage});
  @override
  List<Object> get props => [errorMessage];
}

class MovieLoadedState extends MovieState {
  final List<Movie> moviesList;

  MovieLoadedState({@required this.moviesList});
  @override
  List<Object> get props => [moviesList];
}
