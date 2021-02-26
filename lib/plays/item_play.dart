import 'package:proyectoM/colors.dart';
import 'package:flutter/material.dart';
import 'package:proyectoM/models/product_play.dart';

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
                    Text("play", style: TextStyle(fontSize: 15)),
                    Text(
                      "${widget.play.productTitle}",
                      style: TextStyle(fontSize: 16, color: darkgrey),
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
                  widget.play.productImage,
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
