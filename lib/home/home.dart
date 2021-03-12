import 'package:proyectoM/books/books_page.dart';
import 'package:proyectoM/books/books_read_page.dart';
import 'package:proyectoM/books/books_to_read_page.dart';
import 'package:proyectoM/models/book.dart';
import 'package:proyectoM/models/movie.dart';
import 'package:proyectoM/models/play.dart';
import 'package:proyectoM/movies/movies_page.dart';
import 'package:proyectoM/plays/plays_page.dart';
import 'package:proyectoM/login.dart';
import 'package:proyectoM/models/product_repository.dart';
import 'package:proyectoM/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:proyectoM/colors.dart';

class Home extends StatefulWidget {
  final String title;

  Home({Key key, this.title}) : super(key: key);

  @override
  _BookState createState() => _BookState();
}

class _BookState extends State<Home> {
  var _scaffoldKey = GlobalKey<ScaffoldState>();
  var playsList = ProductRepository.loadProducts(ProductType.PLAYS);
  List<Book> booksToRead = [];
  List<Book> booksRead = [];

  List<Movie> moviesToWatch = [];
  List<Movie> moviesWatched = [];

  List<Play> playsToSee = [];
  List<Play> playsSeen = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: wine),
              accountName: Text(PROFILE_NAME),
              accountEmail: Text(PROFILE_EMAIL),
              currentAccountPicture: CircleAvatar(
                backgroundColor: secondary,
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                    PROFILE_PICTURE,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 12,
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
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => LoginPage(),
                ));
              },
            ),
          ],
        ), // Populate the Drawer in the next step.
      ),
      appBar: AppBar(
        centerTitle: true,
        title: Text(APP_TITLE),
      ),
      key: _scaffoldKey,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.2,
                      child: Image.network(
                          "https://media.wired.com/photos/5be4cd03db23f3775e466767/master/w_2560%2Cc_limit/books-521812297.jpg"),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: _openBooksPage,
                      child: Text(
                        "Browse All Books",
                        style: Theme.of(context)
                            .textTheme
                            .headline2
                            .copyWith(color: secondary),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: _openBooksToReadPage,
                      child: Text(
                        "My list of Books To Read",
                        style: Theme.of(context)
                            .textTheme
                            .headline3
                            .copyWith(color: secondary),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: _openBooksReadPage,
                      child: Text(
                        "Books Read by Me",
                        style: Theme.of(context)
                            .textTheme
                            .headline3
                            .copyWith(color: secondary),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.2,
                      child: Image.network(
                          "https://myfcpl.org/wp-content/uploads/2017/01/movie-night.jpg"),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: _openMoviesPage,
                      child: Text(
                        "Browse All Movies",
                        style: Theme.of(context)
                            .textTheme
                            .headline2
                            .copyWith(color: secondary),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: _openMoviesPage,
                      child: Text(
                        "My list of Movies To Watch",
                        style: Theme.of(context)
                            .textTheme
                            .headline3
                            .copyWith(color: secondary),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: _openMoviesPage,
                      child: Text(
                        "Movies Watched by Me",
                        style: Theme.of(context)
                            .textTheme
                            .headline3
                            .copyWith(color: secondary),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.2,
                      child: Image.network(
                          "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/stream-broadway-1584627330.jpg?crop=0.502xw:1.00xh;0.250xw,0&resize=640:*"),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: _openPlaysPage,
                      child: Text(
                        "Browse All Plays",
                        style: Theme.of(context)
                            .textTheme
                            .headline2
                            .copyWith(color: secondary),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: _openPlaysPage,
                      child: Text(
                        "My list of Plays To See",
                        style: Theme.of(context)
                            .textTheme
                            .headline3
                            .copyWith(color: secondary),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: _openPlaysPage,
                      child: Text(
                        "Plays Seen by Me",
                        style: Theme.of(context)
                            .textTheme
                            .headline3
                            .copyWith(color: secondary),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

//movie methods
  void _openMoviesPage() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => MoviesPage(
          moviesToWatch: moviesToWatch,
          moviesWatched: moviesWatched,
        ),
      ),
    );
  }

//book methods
  void _openBooksPage() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => BooksPage(
          booksToRead: booksToRead,
          booksRead: booksRead,
        ),
      ),
    );
  }

  void _openBooksToReadPage() {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => BooksToRead(
        booksToRead: booksToRead,
        booksRead: booksRead,
      ),
    ));
  }

  void _openBooksReadPage() {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => BooksRead(
        booksToRead: booksToRead,
        booksRead: booksRead,
      ),
    ));
  }

//play methods
  void _openPlaysPage() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => PlaysPage(
          playsList: playsList,
          playsToSee: playsToSee,
        ),
      ),
    );
  }
}
