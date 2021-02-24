import 'package:estructura_practica_1/cart/cart.dart';
import 'package:estructura_practica_1/models/product_item_cart.dart';
import 'package:flutter/material.dart';
import 'package:estructura_practica_1/plays/item_play.dart';
import 'package:estructura_practica_1/models/product_play.dart';

import 'item_play_details.dart';

class PlaysPage extends StatefulWidget {
  final List<ProductPlay> playsList;
  final List<ProductItemCart> cartItems;
  PlaysPage({Key key, @required this.playsList, @required this.cartItems})
      : super(key: key);

  @override
  _PlaysPageState createState() => _PlaysPageState();
}

class _PlaysPageState extends State<PlaysPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => Cart(productsList: widget.cartItems)));
            },
          )
        ],
        title: Text("Plays"),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 50),
        itemCount: widget.playsList.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return PlayDetails(
                    play: widget.playsList[index], cartItems: widget.cartItems);
              })).then((value) => setState(() {}));
            },
            child: ItemPlay(
              play: widget.playsList[index],
            ),
          );
        },
      ),
    );
  }
}
