import 'package:estructura_practica_1/colors.dart';
import 'package:flutter/material.dart';
import 'package:estructura_practica_1/cart/item_cart.dart';
import 'package:estructura_practica_1/models/product_item_cart.dart';

class Cart extends StatefulWidget {
  final List<ProductItemCart> productsList;
  Cart({
    Key key,
    @required this.productsList,
  }) : super(key: key);

  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  double _total = 0;
  @override
  void initState() {
    super.initState();
    for (var item in widget.productsList) {
      _total += (item.productPrice * item.productAmount);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Lista de Compras"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Stack(
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height * 0.6,
                  child: ListView.builder(
                    itemCount: widget.productsList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Stack(children: [
                        ItemCart(
                          onAmountUpdated: _priceUpdate,
                          product: widget.productsList[index],
                        ),
                        Positioned(
                            top: 30,
                            right: 30,
                            child: widget.productsList[index].product.liked
                                ? Icon(Icons.favorite, color: blue)
                                : Icon(Icons.favorite_border, color: blue)),
                        Positioned(
                            bottom: 12,
                            right: 18,
                            child: IconButton(
                              onPressed: () {
                                _priceUpdate(widget
                                        .productsList[index].productPrice *
                                    widget.productsList[index].productAmount *
                                    -1);
                                widget.productsList.removeAt(index);
                                setState(() {});
                              },
                              icon: Icon(Icons.delete),
                              color: blue,
                            ))
                      ]);
                    },
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
              child: Text("Total",
                  style: TextStyle(
                      fontFamily: 'AkzidenzGrotesk BQ Medium', fontSize: 20)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
              child: Text("$_total MX\$",
                  style: TextStyle(
                      fontFamily: 'AkzidenzGrotesk BQ Medium', fontSize: 30)),
            ),
            SizedBox(
              height: 14,
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                gradient: LinearGradient(
                    colors: [darkgrey, grey],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter),
              ),
              child: GestureDetector(
                child: Container(
                  height: 40,
                  child: Center(
                    child: Text(
                      "PAGAR",
                      style: TextStyle(
                          fontFamily: 'AkzidenzGrotesk BQ Medium',
                          fontSize: 14,
                          color: black,
                          fontWeight: FontWeight.w100),
                    ),
                  ),
                ),
                onTap: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _priceUpdate(double newItemPrice) {
    setState(() {
      _total += newItemPrice;
    });
  }
}
