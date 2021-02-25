import 'package:estructura_practica_1/colors.dart';
import 'package:estructura_practica_1/models/product_book.dart';
import 'package:estructura_practica_1/models/product_item_cart.dart';
import 'package:estructura_practica_1/models/product_repository.dart';
import 'package:flutter/material.dart';

class BookDetails extends StatefulWidget {
  final ProductBook book;
  final List<ProductItemCart> cartItems;
  BookDetails({Key key, @required this.book, @required this.cartItems})
      : super(key: key);

  @override
  _BookDetailsState createState() => _BookDetailsState();
}

class _BookDetailsState extends State<BookDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.book.productTitle),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Card(
              color: grey,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            Container(
                              width: 200,
                              height: 200,
                              child: Image.network(widget.book.productImage),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  widget.book.status == 1
                                      ? widget.book.status = 0
                                      : widget.book.status = 1;
                                  widget.cartItems.add(
                                    ProductItemCart(
                                        productTitle: widget.book.productTitle,
                                        productRating:
                                            widget.book.productRating,
                                        product: widget.book,
                                        productImage: widget.book.productImage,
                                        typeOfProduct: ProductType.BOOKS),
                                  );
                                });
                              },
                              child: Container(
                                  child: widget.book.status != 1
                                      ? Icon(
                                          Icons.library_add_outlined,
                                          size: 40,
                                        )
                                      : Icon(Icons.library_add, size: 40)),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            GestureDetector(
                                onTap: () {
                                  setState(() {
                                    widget.book.status == 2
                                        ? widget.book.status = 0
                                        : widget.book.status = 2;
                                  });
                                },
                                child: Container(
                                    child: widget.book.status != 2
                                        ? Icon(
                                            Icons.library_add_check_outlined,
                                            size: 40,
                                          )
                                        : Icon(
                                            Icons.library_add_check,
                                            size: 40,
                                          ))),
                          ],
                        ),
                      ],
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 0, vertical: 20),
                      child: Text(
                        widget.book.productTitle,
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Text(
              widget.book.productDescription,
              style: TextStyle(fontSize: 16),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text("RATING"),
                Text("${widget.book.productRating}",
                    style: TextStyle(
                        fontFamily: 'AkzidenzGrotesk BQ Medium', fontSize: 30))
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Column(
                  children: <Widget>[
                    IconButton(
                      iconSize: 55,
                      icon: Icon(Icons.find_in_page_outlined),
                      tooltip: 'Find book near me',
                      onPressed: () {
                        setState(() {});
                      },
                    ),
                    Text('Find book near me')
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
