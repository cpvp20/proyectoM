import 'package:proyectoM/cart/cart.dart';
import 'package:proyectoM/plays/item_play_details.dart';
import 'package:proyectoM/models/product_item_cart.dart';
import 'package:flutter/material.dart';
import 'package:proyectoM/plays/item_play.dart';
import 'package:proyectoM/models/product_play.dart';

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
    ProductPlay _playItem;
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
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 30),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: "Search by name",
                suffixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onSubmitted: (content) {},
            ),
            Expanded(
              child: ListView.builder(
                itemCount: widget.playsList.length,
                itemBuilder: (BuildContext context, int index) {
                  _playItem = widget.playsList[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return PlayDetails(
                          play: widget.playsList[index],
                          cartItems: widget.cartItems,
                        );
                      })).then((value) => setState(() {}));
                    },
                    child: ItemPlay(
                      play: _playItem,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
