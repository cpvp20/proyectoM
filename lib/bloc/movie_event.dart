part of 'movie_bloc.dart';

abstract class MovieEvent extends Equatable {
  const MovieEvent();

  @override
  List<Object> get props => [];
}

class SearchMovieEvent extends MovieEvent {
  final String queryText;

  SearchMovieEvent({@required this.queryText});
  @override
  List<Object> get props => [queryText];
}
