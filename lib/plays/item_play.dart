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
                    Text("Play",
                        style: TextStyle(
                            fontFamily: 'AkzidenzGrotesk BQ Medium',
                            fontSize: 15)),
                    Text(
                      "${widget.play.productTitle}",
                      style: TextStyle(
                          fontFamily: 'AkzidenzGrotesk BQ Medium',
                          fontSize: 16,
                          color: Colors.white),
                    ),
                    Text("\$${widget.play.productPrice}",
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
              child: widget.play.liked
                  ? Icon(Icons.favorite)
                  : Icon(Icons.favorite_border)),
        )
      ]),
    );
  }
}
