part of 'movies_bloc.dart';

abstract class MoviesEvent extends Equatable {
  const MoviesEvent();

  @override
  List<Object> get props => [];
}

class SearchMoviesEvent extends MoviesEvent {
  final String queryText;

  SearchMoviesEvent({@required this.queryText});
  @override
  List<Object> get props => [queryText];
}
