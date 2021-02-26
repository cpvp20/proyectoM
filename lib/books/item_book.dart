import 'package:flutter/material.dart';
import 'package:proyectoM/models/product_book.dart';
import 'package:proyectoM/colors.dart';

class ItemBook extends StatefulWidget {
  final ProductBook book;
  ItemBook({
    Key key,
    @required this.book,
  }) : super(key: key);

  @override
  _ItemBookState createState() => _ItemBookState();
}

class _ItemBookState extends State<ItemBook> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Stack(alignment: Alignment.center, children: [
        Container(
          padding: const EdgeInsets.all(30.0),
          width: 500,
          height: 260,
          child: Row(
            children: [
              Container(
                height: 200,
                width: 200,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("${widget.book.productTitle}",
                        style: TextStyle(
                            fontFamily: 'AkzidenzGrotesk BQ Medium',
                            fontSize: 18)),
                    Text(
                      "${widget.book.productDescription.substring(0, 70)}...",
                      style: TextStyle(
                          fontFamily: 'AkzidenzGrotesk BQ Medium',
                          fontSize: 16,
                          color: darkgrey),
                    ),
                    Text("Rating:",
                        style: TextStyle(
                            fontFamily: 'AkzidenzGrotesk BQ Medium',
                            fontSize: 18)),
                    Row(
                      children: _ratingToStars(widget.book.productRating),
                    )
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 5.0),
                width: 200,
                child: Image.network(
                  widget.book.productImage,
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: 10,
          right: 12,
          child: Container(
              child: widget.book.status == 1
                  ? Icon(Icons.favorite)
                  : Icon(Icons.favorite_border)),
        )
      ]),
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
