import 'package:proyectoM/cart/cart.dart';
import 'package:proyectoM/books/item_book_details.dart';
import 'package:proyectoM/models/product_item_cart.dart';
import 'package:flutter/material.dart';
import 'package:proyectoM/books/item_book.dart';
import 'package:proyectoM/models/product_book.dart';

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
    ProductBook _bookItem;
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
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 30),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: "Search by name or author",
                suffixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onSubmitted: (content) {},
            ),
            Expanded(
              child: ListView.builder(
                itemCount: widget.booksList.length,
                itemBuilder: (BuildContext context, int index) {
                  _bookItem = widget.booksList[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return BookDetails(
                          book: widget.booksList[index],
                          cartItems: widget.cartItems,
                        );
                      })).then((value) => setState(() {}));
                    },
                    child: ItemBook(
                      book: _bookItem,
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
