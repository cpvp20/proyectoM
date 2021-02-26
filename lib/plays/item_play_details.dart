import 'package:proyectoM/colors.dart';
import 'package:proyectoM/models/product_play.dart';
import 'package:proyectoM/models/product_item_cart.dart';
import 'package:proyectoM/models/product_repository.dart';
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
        padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 300,
                      height: 300,
                      child: Image.network(widget.play.productImage),
                    ),
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          widget.play.status == 1
                              ? widget.play.status = 0
                              : widget.play.status = 1;
                          widget.cartItems.add(
                            ProductItemCart(
                                productTitle: widget.play.productTitle,
                                productRating: widget.play.productRating,
                                product: widget.play,
                                productImage: widget.play.productImage,
                                typeOfProduct: ProductType.PLAYS),
                          );
                        });
                      },
                      child: Container(
                          child: widget.play.status != 1
                              ? Icon(
                                  Icons.library_add_outlined,
                                  size: 30,
                                )
                              : Icon(Icons.library_add, size: 30)),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          widget.play.status == 2
                              ? widget.play.status = 0
                              : widget.play.status = 2;
                        });
                      },
                      child: Container(
                        child: widget.play.status != 2
                            ? Icon(
                                Icons.library_add_check_outlined,
                                size: 30,
                              )
                            : Icon(
                                Icons.library_add_check,
                                size: 30,
                              ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Text(
              widget.play.productTitle,
              style: TextStyle(fontSize: 30),
            ),
            Text(
              widget.play.productDescription,
              style: TextStyle(fontSize: 16),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text("Rating:", style: TextStyle(fontSize: 18)),
                Row(
                  children: _ratingToStars(widget.play.productRating),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Column(
                  children: <Widget>[
                    IconButton(
                      iconSize: 55,
                      icon: Icon(Icons.location_on_outlined),
                      tooltip: 'Find showtimes near me',
                      onPressed: () {
                        setState(() {});
                      },
                    ),
                    Text('Find showtimes near me')
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _ratingToStars(rating) {
    List<Widget> stars = [];
    for (var i = 0; i < 5; i++) {
      if (rating > 0 && rating / 20 > i) {
        stars.add(Icon(Icons.star));
      } else {
        stars.add(Icon(Icons.star_border));
      }
    }
    return stars;
  }
}
