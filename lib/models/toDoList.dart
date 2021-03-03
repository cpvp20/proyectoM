import 'package:proyectoM/models/book.dart';
import 'package:proyectoM/models/movie.dart';
import 'package:proyectoM/models/play.dart';

class ToDoList {
  List<Movie> movies;
  List<Book> books;
  List<Play> plays;

  ToDoList({this.movies, this.plays, this.books});
}
