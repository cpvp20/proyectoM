part of 'movies_to_watch_bloc.dart';

abstract class MoviesToWatchState extends Equatable {
  const MoviesToWatchState();

  @override
  List<Object> get props => [];
}

class MoviesToWatchInitial extends MoviesToWatchState {}

class MoviesToWatchLoadingState extends MoviesToWatchState {}

class MoviesToWatchLoadedState extends MoviesToWatchState {
  final List<Movie> moviesList;

  MoviesToWatchLoadedState({@required this.moviesList});
  @override
  List<Object> get props => [moviesList];
}

class MoviesToWatchErrorState extends MoviesToWatchState {
  final String errorMessage;

  MoviesToWatchErrorState({@required this.errorMessage});
  @override
  List<Object> get props => [errorMessage];
}
