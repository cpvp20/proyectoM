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
        padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Card(
              color: grey,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            Container(
                              width: 200,
                              height: 200,
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
                                        productRating:
                                            widget.play.productRating,
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
                                          size: 40,
                                        )
                                      : Icon(Icons.library_add, size: 40)),
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
                                            size: 40,
                                          )
                                        : Icon(
                                            Icons.library_add_check,
                                            size: 40,
                                          ))),
                          ],
                        ),
                      ],
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 0, vertical: 20),
                      child: Text(
                        widget.play.productTitle,
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Text(
              widget.play.productDescription,
              style: TextStyle(fontSize: 16),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text("RATING"),
                Text("${widget.play.productRating}",
                    style: TextStyle(
                        fontFamily: 'AkzidenzGrotesk BQ Medium', fontSize: 30))
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
                      icon: Icon(Icons.find_in_page_outlined),
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
}
