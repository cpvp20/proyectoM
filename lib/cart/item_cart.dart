import 'package:estructura_practica_1/colors.dart';
import 'package:estructura_practica_1/models/product_repository.dart';
import 'package:flutter/material.dart';

class ItemCart extends StatefulWidget {
  final dynamic product;
  ItemCart({
    Key key,
    @required this.product,
  }) : super(key: key);

  @override
  _ItemCartState createState() => _ItemCartState();
}

class _ItemCartState extends State<ItemCart> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      color: yellow,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Image.network(
              widget.product.productImage,
              height: 160,
              width: 160,
            ),
            Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 8),
                  Text(
                    "${widget.product.productTitle}",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  SizedBox(height: 8),
                  SizedBox(height: 28),
                  Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("\$${widget.product.productRating}",
                            style: TextStyle(fontSize: 28)),
                      ])
                ]),
            SizedBox(
              height: 12,
            ),
          ],
        ),
      ),
    );
  }
}
