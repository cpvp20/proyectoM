import 'package:proyectoM/models/product_book.dart';
import 'package:proyectoM/models/product_item_cart.dart';
import 'package:proyectoM/models/product_repository.dart';
import 'package:flutter/material.dart';

class BookDetails extends StatefulWidget {
  final ProductBook book;
  final List<ProductItemCart> cartItems;
  BookDetails({Key key, @required this.book, @required this.cartItems})
      : super(key: key);

  @override
  _BookDetailsState createState() => _BookDetailsState();
}

class _BookDetailsState extends State<BookDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.book.productTitle),
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
                      child: Image.network(widget.book.productImage),
                    ),
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          widget.book.status == 1
                              ? widget.book.status = 0
                              : widget.book.status = 1;
                          widget.cartItems.add(
                            ProductItemCart(
                                productTitle: widget.book.productTitle,
                                productRating: widget.book.productRating,
                                product: widget.book,
                                productImage: widget.book.productImage,
                                typeOfProduct: ProductType.BOOKS),
                          );
                        });
                      },
                      child: Container(
                          child: widget.book.status != 1
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
                          widget.book.status == 2
                              ? widget.book.status = 0
                              : widget.book.status = 2;
                        });
                      },
                      child: Container(
                        child: widget.book.status != 2
                            ? Icon(
                                Icons.library_add_check_outlined,
                                size: 40,
                              )
                            : Icon(
                                Icons.library_add_check,
                                size: 40,
                              ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Text(
              widget.book.productTitle,
              style: Theme.of(context).textTheme.headline5,
            ),
            Text(
              widget.book.productDescription,
              style: Theme.of(context).textTheme.bodyText2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text("Rating:",
                    style: Theme.of(context)
                        .textTheme
                        .headline2
                        .copyWith(fontSize: 18.0)),
                Row(
                  children: _ratingToStars(widget.book.productRating),
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
                      tooltip: 'Find book near me',
                      onPressed: () {
                        setState(() {});
                      },
                    ),
                    Text('Find book near me')
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
