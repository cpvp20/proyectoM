part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeErrorState extends HomeState {
  final String errorMessage;

  HomeErrorState({@required this.errorMessage});
  @override
  List<Object> get props => [errorMessage];
}

class HomeLoadedState extends HomeState {
  final List<Book> booksList;
  final int booksFound;

  HomeLoadedState({@required this.booksFound, @required this.booksList});
  @override
  List<Object> get props => [booksList, booksFound];
}
