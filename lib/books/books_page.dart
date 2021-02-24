import 'package:estructura_practica_1/cart/cart.dart';
import 'package:estructura_practica_1/books/item_book_details.dart';
import 'package:estructura_practica_1/models/product_item_cart.dart';
import 'package:flutter/material.dart';
import 'package:estructura_practica_1/books/item_book.dart';
import 'package:estructura_practica_1/models/product_book.dart';

class BooksPage extends StatefulWidget {
  final List<ProductBook> booksList;
  final List<ProductItemCart> cartItems;
  BooksPage({Key key, @required this.booksList, @required this.cartItems})
      : super(key: key);

  @override
  _BooksPageState createState() => _BooksPageState();
}

class _BooksPageState extends State<BooksPage> {
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
        title: Text("Books"),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 50),
        itemCount: widget.booksList.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return BookDetails(
                  book: widget.booksList[index],
                  cartItems: widget.cartItems,
                );
              })).then((value) => setState(() {}));
            },
            child: ItemBook(
              book: widget.booksList[index],
            ),
          );
        },
      ),
    );
  }
}
