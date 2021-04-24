part of 'books_to_read_bloc.dart';

abstract class BooksToReadState extends Equatable {
  const BooksToReadState();

  @override
  List<Object> get props => [];
}

class BooksToReadInitial extends BooksToReadState {}

class BooksToReadLoadingState extends BooksToReadState {}

class BooksToReadLoadedState extends BooksToReadState {
  final List<Book> booksList;

  BooksToReadLoadedState({@required this.booksList});
  @override
  List<Object> get props => [booksList];
}

class BooksToReadErrorState extends BooksToReadState {
  final String errorMessage;

  BooksToReadErrorState({@required this.errorMessage});
  @override
  List<Object> get props => [errorMessage];
}
