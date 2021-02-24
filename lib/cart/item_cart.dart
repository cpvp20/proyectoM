import 'package:estructura_practica_1/colors.dart';
import 'package:estructura_practica_1/models/product_repository.dart';
import 'package:flutter/material.dart';

class ItemCart extends StatefulWidget {
  final dynamic product;
  final ValueChanged<double> onAmountUpdated;
  ItemCart({
    Key key,
    @required this.onAmountUpdated,
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
                    style: TextStyle(
                        fontFamily: 'AkzidenzGrotesk BQ Medium',
                        color: Colors.white,
                        fontSize: 22),
                  ),
                  SizedBox(height: 8),
                  Text(
                    _checkSize(),
                    style: TextStyle(
                        fontFamily: 'AkzidenzGrotesk BQ Medium',
                        color: Colors.white,
                        fontSize: 15),
                  ),
                  SizedBox(height: 28),
                  Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        IconButton(
                            icon: Icon(Icons.add_circle_outline, color: blue),
                            color: blue,
                            onPressed: _addProd),
                        Text("${widget.product.productAmount}",
                            style: TextStyle(
                                fontFamily: 'AkzidenzGrotesk BQ Medium',
                                fontSize: 24)),
                        IconButton(
                            icon:
                                Icon(Icons.remove_circle_outline, color: blue),
                            color: blue,
                            onPressed: _removeProd),
                        SizedBox(
                          height: 12,
                        ),
                        Text("\$${widget.product.productPrice}",
                            style: TextStyle(
                                fontFamily: 'AkzidenzGrotesk BQ Medium',
                                fontSize: 28)),
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

  void _addProd() {
    setState(() {
      ++widget.product.productAmount;
    });
    widget.onAmountUpdated(widget.product.productPrice);
  }

  void _removeProd() {
    setState(() {
      --widget.product.productAmount;
    });
    widget.onAmountUpdated(-1 * widget.product.productPrice);
  }

  String _checkSize() {
    if (widget.product.typeOfProduct == ProductType.MOVIES) {
      switch (widget.product.productSize) {
        case 0:
          return "Tamaño Chico";
          break;
        case 1:
          return "Tamaño Mediano";
          break;
        case 2:
          return "Tamaño Grande";
          break;
        default:
          return "";
      }
    } else if (widget.product.typeOfProduct == ProductType.BOOKS) {
      switch (widget.product.productSize) {
        case 0:
          return "Peso 250G";
          break;
        case 1:
          return "Peso 1K";
          break;
        default:
          return "";
      }
    } else {
      return "";
    }
  }
}
