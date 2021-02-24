import 'package:estructura_practica_1/models/product_movie.dart';
import 'package:estructura_practica_1/models/product_book.dart';
import 'package:estructura_practica_1/models/product_play.dart';

class ProductCart {
  List<ProductMovie> movies;
  List<ProductBook> books;
  List<ProductPlay> plays;

  ProductCart({this.movies, this.plays, this.books});
}
