import 'package:proyectoM/colors.dart';
import 'package:flutter/material.dart';
import 'package:proyectoM/cart/item_cart.dart';
import 'package:proyectoM/models/product_item_cart.dart';

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
      int i = 0;
      _total += i;
      i++;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("To Do List"),
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
                          product: widget.productsList[index],
                        ),
                        Positioned(
                            top: 30,
                            right: 30,
                            child:
                                widget.productsList[index].product.status == 1
                                    ? Icon(Icons.favorite, color: lightgrey)
                                    : Icon(Icons.favorite_border,
                                        color: lightgrey)),
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
              child: Text("Total", style: TextStyle(fontSize: 20)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
              child: Text("$_total MX\$", style: TextStyle(fontSize: 30)),
            ),
            SizedBox(
              height: 14,
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 10),
              color: lightgrey,
              child: GestureDetector(
                child: Container(
                  height: 40,
                  child: Center(
                    child: Text(
                      "Back",
                      style: TextStyle(
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
}
