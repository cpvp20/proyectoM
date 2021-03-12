part of 'book_bloc.dart';

abstract class BookState extends Equatable {
  const BookState();

  @override
  List<Object> get props => [];
}

class BookInitial extends BookState {}

class BookLoadingState extends BookState {}

class BookErrorState extends BookState {
  final String errorMessage;

  BookErrorState({@required this.errorMessage});
  @override
  List<Object> get props => [errorMessage];
}

class BookLoadedState extends BookState {
  final List<Book> booksList;

  BookLoadedState({@required this.booksList});
  @override
  List<Object> get props => [booksList];
}
