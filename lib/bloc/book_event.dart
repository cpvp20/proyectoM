part of 'book_bloc.dart';

abstract class BookEvent extends Equatable {
  const BookEvent();

  @override
  List<Object> get props => [];
}

class SearchBookEvent extends BookEvent {
  final String queryText;

  SearchBookEvent({@required this.queryText});
  @override
  List<Object> get props => [queryText];
}
