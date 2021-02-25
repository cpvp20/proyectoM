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
                color: wine,
                width: 230,
                height: 230,
              ),
              Container(
                width: 200,
                height: 200,
                child: Image.network(widget.play.productImage),
              ),
              Positioned(
                top: 10,
                right: 60,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      widget.play.status = widget.play.status;
                    });
                  },
                  child: Container(
                      child: widget.play.status == 1
                          ? Icon(Icons.favorite)
                          : Icon(Icons.favorite_border)),
                ),
              )
            ]),
            SizedBox(height: 14),
            Text(
              widget.play.productTitle,
              style: TextStyle(fontSize: 25),
            ),
            SizedBox(height: 14),
            Text(widget.play.productDescription,
                style: TextStyle(fontSize: 18)),
            SizedBox(height: 14),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text("RATING"),
                Text("\$${widget.play.productRating}",
                    style: TextStyle(
                        fontFamily: 'AkzidenzGrotesk BQ Medium', fontSize: 30))
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RaisedButton(
                    child: Text("WANT TO SEE",
                        style: TextStyle(fontSize: 12, color: Colors.white)),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    onPressed: () {
                      widget.cartItems.add(ProductItemCart(
                          productTitle: widget.play.productTitle,
                          productRating: widget.play.productRating,
                          product: widget.play,
                          productImage: widget.play.productImage,
                          typeOfProduct: ProductType.PLAYS));
                    }),
                RaisedButton(
                  child: Text("SEEN ALREADY",
                      style: TextStyle(fontSize: 12, color: Colors.white)),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  onPressed: () {},
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.location_history),
                      tooltip: 'Find showtimes near me',
                      onPressed: () {
                        setState(() {});
                      },
                    ),
                    Text('Find showtimes near me')
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
