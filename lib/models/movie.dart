import 'package:flutter/foundation.dart';

class Movie {
  final String title; // nombre del producto
  final String description; // descripcion del producto
  final String image; // url de imagen del producto
  double productRating;
  int status;

  Movie({
    @required this.title,
    @required this.description,
    @required this.image,
    @required this.productRating,
    this.status = 0,
  });
}
