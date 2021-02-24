import 'package:estructura_practica_1/colors.dart';
import 'package:estructura_practica_1/models/product_play.dart';
import 'package:estructura_practica_1/models/product_item_cart.dart';
import 'package:estructura_practica_1/models/product_repository.dart';
import 'package:flutter/material.dart';

class PlayDetails extends StatefulWidget {
  final ProductPlay play;
  final List<ProductItemCart> cartItems;
  PlayDetails({Key key, @required this.play, @required this.cartItems})
      : super(key: key);

  @override
  _PlayDetailsState createState() => _PlayDetailsState();
}

class _PlayDetailsState extends State<PlayDetails> {
//los PLAYS no tienen sizes obviamente
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.play.productTitle),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 50,
            ),
            Stack(alignment: Alignment.center, children: [
              Container(
                color: orange,
                width: 440,
                height: 440,
              ),
              Container(
                width: 400,
                height: 400,
                child: Image.network(widget.play.productImage),
              ),
              Positioned(
                top: 10,
                right: 60,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      widget.play.liked = !widget.play.liked;
                    });
                  },
                  child: Container(
                      child: widget.play.liked
                          ? Icon(Icons.favorite)
                          : Icon(Icons.favorite_border)),
                ),
              )
            ]),
            SizedBox(height: 14),
            Text(
              widget.play.productTitle,
              style: TextStyle(
                  fontFamily: 'AkzidenzGrotesk BQ Medium', fontSize: 25),
            ),
            SizedBox(height: 14),
            Text(widget.play.productDescription,
                style: TextStyle(
                    fontFamily: 'AkzidenzGrotesk BQ Medium', fontSize: 18)),
            SizedBox(height: 14),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text("            "),
                Text("\$${widget.play.productPrice}",
                    style: TextStyle(
                        fontFamily: 'AkzidenzGrotesk BQ Medium', fontSize: 30))
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RaisedButton(
                    child: Text("AGREGAR AL CARRITO",
                        style: TextStyle(
                            fontFamily: 'AkzidenzGrotesk BQ Medium',
                            fontSize: 12,
                            color: Colors.white)),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    onPressed: () {
                      widget.cartItems.add(ProductItemCart(
                          productTitle: widget.play.productTitle,
                          productAmount: 1,
                          productPrice: widget.play.productPrice,
                          product: widget.play,
                          productImage: widget.play.productImage,
                          typeOfProduct: ProductType.PLAYS));
                    }),
                RaisedButton(
                  child: Text("COMPRAR AHORA",
                      style: TextStyle(
                          fontFamily: 'AkzidenzGrotesk BQ Medium',
                          fontSize: 12,
                          color: Colors.white)),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  onPressed: () {},
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
