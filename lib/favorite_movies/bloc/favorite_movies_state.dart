part of 'favorite_movies_bloc.dart';

abstract class FavoriteMoviesState extends Equatable {
  const FavoriteMoviesState();

  @override
  List<Object> get props => [];
}

class FavoriteMoviesInitial extends FavoriteMoviesState {}

class FavoriteMoviesLoadingState extends FavoriteMoviesState {}

class FavoriteMoviesLoadedState extends FavoriteMoviesState {
  final List<Movie> moviesList;

  FavoriteMoviesLoadedState({@required this.moviesList});
  @override
  List<Object> get props => [moviesList];
}

class FavoriteMoviesErrorState extends FavoriteMoviesState {
  final String errorMessage;

  FavoriteMoviesErrorState({@required this.errorMessage});
  @override
  List<Object> get props => [errorMessage];
}
