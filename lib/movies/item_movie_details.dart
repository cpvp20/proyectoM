import 'package:estructura_practica_1/colors.dart';
import 'package:estructura_practica_1/models/product_movie.dart';
import 'package:estructura_practica_1/models/product_item_cart.dart';
import 'package:estructura_practica_1/models/product_repository.dart';
import 'package:flutter/material.dart';

class MovieDetails extends StatefulWidget {
  final ProductMovie movie;
  final List<ProductItemCart> cartItems;
  MovieDetails({Key key, @required this.movie, @required this.cartItems})
      : super(key: key);

  @override
  _MovieDetailsState createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {
  final List<String> _sizes = ["Chico", "Mediano", "Grande"];
  @override
  Widget build(BuildContext context) {
    int _sizeSelection = widget.movie.productSize.index;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.movie.productTitle),
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
                child: Image.network(widget.movie.productImage),
              ),
              Positioned(
                top: 10,
                right: 60,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      widget.movie.liked = !widget.movie.liked;
                    });
                  },
                  child: Container(
                      child: widget.movie.liked
                          ? Icon(Icons.favorite)
                          : Icon(Icons.favorite_border)),
                ),
              )
            ]),
            SizedBox(height: 14),
            Text(
              widget.movie.productTitle,
              style: TextStyle(
                  fontFamily: 'AkzidenzGrotesk BQ Medium', fontSize: 25),
            ),
            SizedBox(height: 14),
            Text(widget.movie.productDescription,
                style: TextStyle(
                    fontFamily: 'AkzidenzGrotesk BQ Medium', fontSize: 18)),
            SizedBox(height: 14),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text("TAMAÑOS DISPONIBLES"),
                Text("\$${widget.movie.productPrice}",
                    style: TextStyle(
                        fontFamily: 'AkzidenzGrotesk BQ Medium', fontSize: 30))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(3, (index) {
                return ChoiceChip(
                  selectedColor: Colors.purple[50],
                  backgroundColor: Colors.grey[50],
                  shape: StadiumBorder(
                      side: _sizeSelection == index
                          ? BorderSide(color: Colors.purple)
                          : BorderSide.none),
                  selected: _sizeSelection == index ? true : false,
                  label: Text(_sizes[index]),
                  labelStyle: TextStyle(
                      fontFamily: 'AkzidenzGrotesk BQ Medium',
                      color: _sizeSelection == index
                          ? Colors.purple
                          : Colors.grey),
                  onSelected: (selected) {
                    setState(() {
                      _sizeSelection = index;
                      widget.movie.productSize = ProductSize.values[index];
                      widget.movie.productPrice =
                          widget.movie.productPriceCalculator();
                    });
                  },
                );
              }),
            ),
            SizedBox(height: 40),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RaisedButton(
                    color: grey,
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
                          productTitle: widget.movie.productTitle,
                          productAmount: 1,
                          productPrice: widget.movie.productPrice,
                          product: widget.movie,
                          productImage: widget.movie.productImage,
                          productSize: widget.movie.productSize.index,
                          typeOfProduct: ProductType.MOVIES));
                    }),
                RaisedButton(
                    color: grey,
                    child: Text("FIND NEAR ME",
                        style: TextStyle(fontSize: 12, color: Colors.white)),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    onPressed: () {}),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
