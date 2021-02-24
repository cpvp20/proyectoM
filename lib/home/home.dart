import 'package:estructura_practica_1/cart/cart.dart';
import 'package:estructura_practica_1/books/books_page.dart';
import 'package:estructura_practica_1/movies/movies_page.dart';
import 'package:estructura_practica_1/plays/plays_page.dart';
import 'package:estructura_practica_1/login.dart';
import 'package:estructura_practica_1/models/product_item_cart.dart';
import 'package:estructura_practica_1/models/product_repository.dart';
import 'package:estructura_practica_1/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:estructura_practica_1/colors.dart';

class Home extends StatefulWidget {
  final String title;

  Home({Key key, this.title}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var _scaffoldKey = GlobalKey<ScaffoldState>();
  var moviesList = ProductRepository.loadProducts(ProductType.MOVIES);
  var booksList = ProductRepository.loadProducts(ProductType.BOOKS);
  var playsList = ProductRepository.loadProducts(ProductType.PLAYS);
  List<ProductItemCart> cartItems = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: orange),
              accountName: Text(PROFILE_NAME),
              accountEmail: Text(PROFILE_EMAIL),
              currentAccountPicture: CircleAvatar(
                backgroundColor: grey,
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                    PROFILE_PICTURE,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            ListTile(
              title: Text(PROFILE_CART),
              leading: Icon(Icons.shopping_cart),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Cart(productsList: cartItems)));
              },
            ),
            ListTile(
              title: Text(PROFILE_WISHES),
              leading: Icon(Icons.favorite_border),
              onTap: () {},
            ),
            ListTile(
              title: Text(PROFILE_HISTORY),
              leading: Icon(Icons.store),
              onTap: () {},
            ),
            ListTile(
              title: Text(PROFILE_SETTINGS),
              leading: Icon(Icons.settings),
              onTap: () {},
            ),
            ListTile(
              title: Text("LOGOUT"),
              leading: Icon(Icons.logout),
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => LoginPage()));
              },
            ),
          ],
        ), // Populate the Drawer in the next step.
      ),
      appBar: AppBar(
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => Cart(productsList: cartItems)));
            },
          )
        ],
        title: Text("Welcome"),
      ),
      key: _scaffoldKey,
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 50),
        children: <Widget>[
          GestureDetector(
            onTap: _openMoviesPage,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(30.0),
                    width: 500,
                    height: 260,
                    decoration: BoxDecoration(color: grey, boxShadow: [
                      BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0.0, 1.0),
                          blurRadius: 4.0)
                    ]),
                    child: Row(
                      children: [
                        Container(
                          width: 120,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text("Movies", style: TextStyle(fontSize: 26)),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(left: 5.0),
                          width: 300,
                          height: 300,
                          child: Image.network(
                              "https://myfcpl.org/wp-content/uploads/2017/01/movie-night.jpg"),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: _openBooksPage,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(30.0),
                    width: 500,
                    height: 300,
                    decoration: BoxDecoration(color: grey, boxShadow: [
                      BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0.0, 1.0),
                          blurRadius: 4.0)
                    ]),
                    child: Row(
                      children: [
                        Container(
                          width: 120,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text("Books", style: TextStyle(fontSize: 26)),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(left: 5.0),
                          width: 300,
                          height: 300,
                          child:
                              Image.network("https://i.imgur.com/5MZocC1.png"),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: _openPlaysPage,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(30.0),
                    width: 500,
                    height: 300,
                    decoration: BoxDecoration(color: grey, boxShadow: [
                      BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0.0, 1.0),
                          blurRadius: 4.0)
                    ]),
                    child: Row(
                      children: [
                        Container(
                          width: 120,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text("Plays", style: TextStyle(fontSize: 26)),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(left: 5.0),
                          width: 300,
                          height: 300,
                          child:
                              Image.network("https://i.imgur.com/fI7Tezv.png"),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _openMoviesPage() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return MoviesPage(
            moviesList: moviesList,
            cartItems: cartItems,
          );
        },
      ),
    );
  }

  void _openBooksPage() {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) {
        return BooksPage(
          booksList: booksList,
          cartItems: cartItems,
        );
      }),
    );
  }

  void _openPlaysPage() {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) {
        return PlaysPage(
          playsList: playsList,
          cartItems: cartItems,
        );
      }),
    );
  }
}
