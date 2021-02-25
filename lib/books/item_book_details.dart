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
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        title: Text(widget.book.productTitle),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: 50,
            ),
            Stack(alignment: Alignment.center, children: [
              Container(
                color: wine,
                width: 230,
                height: 230,
              ),
              Container(
                width: 200,
                height: 200,
                child: Image.network(widget.book.productImage),
              ),
              Positioned(
                top: 10,
                right: 60,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      widget.book.status = 0;
                    });
                  },
                  child: Container(
                      child: widget.book.status == 2
                          ? Icon(Icons.favorite)
                          : Icon(Icons.favorite_border)),
                ),
              )
            ]),
            SizedBox(height: 14),
            Text(
              widget.book.productTitle,
              style: TextStyle(fontSize: 25),
            ),
            SizedBox(height: 14),
            Text(widget.book.productDescription,
                style: TextStyle(fontSize: 18)),
            SizedBox(height: 14),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text("RATING"),
                Text("${widget.book.productRating}",
                    style: TextStyle(fontSize: 30))
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RaisedButton(
                    child: Text("WANT TO READ",
                        style: TextStyle(fontSize: 12, color: Colors.white)),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    onPressed: () {
                      widget.cartItems.add(ProductItemCart(
                          productTitle: widget.book.productTitle,
                          productRating: widget.book.productRating,
                          product: widget.book,
                          productImage: widget.book.productImage,
                          typeOfProduct: ProductType.BOOKS));
                    }),
                RaisedButton(
                  child: Text("READ ALREADY",
                      style: TextStyle(fontSize: 12, color: Colors.white)),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  onPressed: () {},
                ),
              ],
            ),
            Row(
              children: [
                Column(
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.location_on),
                      tooltip: 'Find copies of this book near me',
                      onPressed: () {
                        setState(() {});
                      },
                    ),
                    Text('Find copies of this book near me')
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
