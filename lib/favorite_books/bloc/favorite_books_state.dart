part of 'favorite_books_bloc.dart';

abstract class FavoriteBooksState extends Equatable {
  const FavoriteBooksState();

  @override
  List<Object> get props => [];
}

class FavoriteBooksInitial extends FavoriteBooksState {}

class FavoriteBooksLoadingState extends FavoriteBooksState {}

class FavoriteBooksLoadedState extends FavoriteBooksState {
  final List<Book> booksList;

  FavoriteBooksLoadedState({@required this.booksList});
  @override
  List<Object> get props => [booksList];
}

class FavoriteBooksErrorState extends FavoriteBooksState {
  final String errorMessage;

  FavoriteBooksErrorState({@required this.errorMessage});
  @override
  List<Object> get props => [errorMessage];
}
