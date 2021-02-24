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
  final List<String> _sizes = ["250 G", "1K"];
  @override
  Widget build(BuildContext context) {
    int _size_selection = widget.book.productWeight.index;
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
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 50,
            ),
            Stack(alignment: Alignment.center, children: [
              Container(
                color: orange,
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
                      widget.book.liked = !widget.book.liked;
                    });
                  },
                  child: Container(
                      child: widget.book.liked
                          ? Icon(Icons.favorite)
                          : Icon(Icons.favorite_border)),
                ),
              )
            ]),
            SizedBox(height: 14),
            Text(
              widget.book.productTitle,
              style: TextStyle(
                  fontFamily: 'AkzidenzGrotesk BQ Medium', fontSize: 25),
            ),
            SizedBox(height: 14),
            Text(widget.book.productDescription,
                style: TextStyle(
                    fontFamily: 'AkzidenzGrotesk BQ Medium', fontSize: 18)),
            SizedBox(height: 14),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text("TAMAÑOS DISPONIBLES"),
                Text("\$${widget.book.productPrice}",
                    style: TextStyle(
                        fontFamily: 'AkzidenzGrotesk BQ Medium', fontSize: 30))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(2, (index) {
                return ChoiceChip(
                  selectedColor: Colors.purple[50],
                  backgroundColor: Colors.grey[50],
                  shape: StadiumBorder(
                      side: _size_selection == index
                          ? BorderSide(color: Colors.purple)
                          : BorderSide.none),
                  selected: _size_selection == index ? true : false,
                  label: Text(_sizes[index]),
                  labelStyle: TextStyle(
                      fontFamily: 'AkzidenzGrotesk BQ Medium',
                      color: _size_selection == index
                          ? Colors.purple
                          : Colors.grey),
                  onSelected: (selected) {
                    setState(() {
                      _size_selection = index;
                      widget.book.productWeight = ProductWeight.values[index];
                      widget.book.productPrice =
                          widget.book.productPriceCalculator();
                    });
                  },
                );
              }),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RaisedButton(
                    child: Text("ADD TO MY LIST",
                        style: TextStyle(
                            fontFamily: 'AkzidenzGrotesk BQ Medium',
                            fontSize: 12,
                            color: Colors.white)),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    onPressed: () {
                      widget.cartItems.add(ProductItemCart(
                          productTitle: widget.book.productTitle,
                          productAmount: 1,
                          productPrice: widget.book.productPrice,
                          product: widget.book,
                          productImage: widget.book.productImage,
                          productSize: widget.book.productWeight.index,
                          typeOfProduct: ProductType.BOOKS));
                    }),
                RaisedButton(
                  child: Text("COMPRAR AHORA",
                      style: TextStyle(
                          fontFamily: 'AkzidenzGrotesk BQ Medium',
                          fontSize: 12,
                          color: Colors.white)),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  onPressed: () {},
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
