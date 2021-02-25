import 'package:flutter/foundation.dart';

class ProductMovie {
  final String productTitle; // nombre del producto
  final String productDescription; // descripcion del producto
  final String productImage; // url de imagen del producto
  double productRating;
  int status;

  ProductMovie({
    @required this.productTitle,
    @required this.productDescription,
    @required this.productImage,
    @required this.productRating,
    this.status = 0,
  });
}
