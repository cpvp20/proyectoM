import 'package:estructura_practica_1/colors.dart';
import 'package:flutter/material.dart';
import 'package:estructura_practica_1/models/product_movie.dart';

class ItemMovie extends StatefulWidget {
  final ProductMovie movie;
  ItemMovie({
    Key key,
    @required this.movie,
  }) : super(key: key);

  @override
  _ItemMovieState createState() => _ItemMovieState();
}

class _ItemMovieState extends State<ItemMovie> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Stack(alignment: Alignment.center, children: [
        Container(
          padding: const EdgeInsets.all(30.0),
          width: 500,
          height: 260,
          decoration: BoxDecoration(color: grey, boxShadow: [
            BoxShadow(
                color: Colors.grey, offset: Offset(0.0, 1.0), blurRadius: 4.0)
          ]),
          child: Row(
            children: [
              Container(
                width: 120,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("Movie", style: TextStyle(fontSize: 15)),
                    Text(
                      "${widget.movie.productTitle}",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                    Text("95/100", style: TextStyle(fontSize: 24))
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 5.0),
                width: 200,
                height: 200,
                child: Image.network(
                  widget.movie.productImage,
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: 10,
          right: 12,
          child: Container(
              child: widget.movie.liked
                  ? Icon(Icons.favorite)
                  : Icon(Icons.favorite_border)),
        )
      ]),
    );
  }
}
