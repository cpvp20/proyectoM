import 'package:flutter/material.dart';
import 'package:estructura_practica_1/models/product_play.dart';
import 'package:estructura_practica_1/colors.dart';

class ItemPlay extends StatefulWidget {
  final ProductPlay play;
  ItemPlay({
    Key key,
    @required this.play,
  }) : super(key: key);

  @override
  _ItemPlayState createState() => _ItemPlayState();
}

class _ItemPlayState extends State<ItemPlay> {
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
                width: 120,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("Play",
                        style: TextStyle(
                            fontFamily: 'AkzidenzGrotesk BQ Medium',
                            fontSize: 15)),
                    Text(
                      "${widget.play.productTitle}",
                      style: TextStyle(
                          fontFamily: 'AkzidenzGrotesk BQ Medium',
                          fontSize: 16,
                          color: darkgrey),
                    ),
                    Text("\$${widget.play.productRating}",
                        style: TextStyle(
                            fontFamily: 'AkzidenzGrotesk BQ Medium',
                            fontSize: 24))
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 5.0),
                width: 200,
                height: 200,
                child: Image.network(
                  widget.play.productImage,
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: 10,
          right: 12,
          child: Container(
              child: widget.play.status == 2
                  ? Icon(Icons.favorite)
                  : Icon(Icons.favorite_border)),
        )
      ]),
    );
  }
}
