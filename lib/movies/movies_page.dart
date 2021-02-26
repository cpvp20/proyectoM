import 'package:proyectoM/cart/cart.dart';
import 'package:proyectoM/movies/item_movie_details.dart';
import 'package:proyectoM/models/product_item_cart.dart';
import 'package:flutter/material.dart';
import 'package:proyectoM/movies/item_movie.dart';
import 'package:proyectoM/models/product_movie.dart';

class MoviesPage extends StatefulWidget {
  final List<ProductMovie> moviesList;
  final List<ProductItemCart> cartItems;
  MoviesPage({Key key, @required this.moviesList, @required this.cartItems})
      : super(key: key);

  @override
  _MoviesPageState createState() => _MoviesPageState();
}

class _MoviesPageState extends State<MoviesPage> {
  @override
  Widget build(BuildContext context) {
    ProductMovie _movieItem;
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
        title: Text("Movies"),
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
                itemCount: widget.moviesList.length,
                itemBuilder: (BuildContext context, int index) {
                  _movieItem = widget.moviesList[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return MovieDetails(
                          movie: widget.moviesList[index],
                          cartItems: widget.cartItems,
                        );
                      })).then((value) => setState(() {}));
                    },
                    child: ItemMovie(
                      movie: _movieItem,
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
