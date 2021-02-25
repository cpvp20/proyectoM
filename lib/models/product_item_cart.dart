import 'package:flutter/foundation.dart';
import 'package:estructura_practica_1/models/product_repository.dart';

class ProductItemCart {
  String productTitle;
  double productRating;
  String productImage;
  dynamic product;
  final ProductType typeOfProduct;

  ProductItemCart(
      {this.typeOfProduct,
      @required this.productTitle,
      @required this.productRating,
      @required this.productImage,
      @required this.product});
}
