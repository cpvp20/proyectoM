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
                                productRating: widget.movie.productRating,
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
                          widget.movie.status == 2
                              ? widget.movie.status = 0
                              : widget.movie.status = 2;
                        });
                      },
                      child: Container(
                        child: widget.movie.status != 2
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
              widget.movie.productTitle,
              style: Theme.of(context).textTheme.headline5,
            ),
            Text(
              widget.movie.productDescription,
              style: Theme.of(context).textTheme.bodyText2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "Rating:",
                  style: Theme.of(context)
                      .textTheme
                      .headline2
                      .copyWith(fontSize: 18.0),
                ),
                Row(
                  children: _ratingToStars(widget.movie.productRating),
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
                      icon: Icon(Icons.web_outlined),
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
