import 'package:flutter/foundation.dart';

class Play {
  final String title; // nombre del producto
  final String description; // descripcion del producto
  final String image; // url de imagen del producto
  double productaverageRating;
  int status;

  Play({
    @required this.title,
    @required this.description,
    @required this.image,
    @required this.productaverageRating,
    this.status = 0,
  });
}
