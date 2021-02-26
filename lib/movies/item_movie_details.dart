import 'package:proyectoM/colors.dart';
import 'package:proyectoM/models/product_movie.dart';
import 'package:proyectoM/models/product_item_cart.dart';
import 'package:proyectoM/models/product_repository.dart';
import 'package:flutter/material.dart';

class MovieDetails extends StatefulWidget {
  final ProductMovie movie;
  final List<ProductItemCart> cartItems;
  MovieDetails({Key key, @required this.movie, @required this.cartItems})
      : super(key: key);

  @override
  _MovieDetailsState createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.movie.productTitle),
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
                              child: Image.network(widget.movie.productImage),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  widget.movie.status == 1
                                      ? widget.movie.status = 0
                                      : widget.movie.status = 1;
                                  widget.cartItems.add(
                                    ProductItemCart(
                                        productTitle: widget.movie.productTitle,
                                        productRating:
                                            widget.movie.productRating,
                                        product: widget.movie,
                                        productImage: widget.movie.productImage,
                                        typeOfProduct: ProductType.MOVIES),
                                  );
                                });
                              },
                              child: Container(
                                  child: widget.movie.status != 1
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
                                    widget.movie.status == 2
                                        ? widget.movie.status = 0
                                        : widget.movie.status = 2;
                                  });
                                },
                                child: Container(
                                    child: widget.movie.status != 2
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
                        widget.movie.productTitle,
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Text(
              widget.movie.productDescription,
              style: TextStyle(fontSize: 16),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text("RATING"),
                Text("${widget.movie.productRating}",
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
                      tooltip: 'Find movie online',
                      onPressed: () {
                        setState(() {});
                      },
                    ),
                    Text('Find movie online')
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
