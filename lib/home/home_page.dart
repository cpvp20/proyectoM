import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyectoM/auth/bloc/auth_bloc.dart';
import 'package:proyectoM/books/books_page.dart';
import 'package:proyectoM/books_to_read/books_to_read_page.dart';
import 'package:proyectoM/favorite_books/favorite_books_page.dart';
import 'package:proyectoM/favorite_movies/favorite_movies_page.dart';
import 'package:proyectoM/models/play.dart';
import 'package:proyectoM/movies/movies_page.dart';
import 'package:proyectoM/movies_to_watch/movies_to_watch_page.dart';
import 'package:proyectoM/plays/plays_page.dart';
import 'package:proyectoM/models/product_repository.dart';
import 'package:proyectoM/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:proyectoM/colors.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _scaffoldKey = GlobalKey<ScaffoldState>();
  var playsList = ProductRepository.loadProducts(ProductType.PLAYS);
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
            IconButton(
              icon: Icon(Icons.logout),
              onPressed: () {
                BlocProvider.of<AuthBloc>(context).add(
                  SignOutAuthenticationEvent(),
                );
              },
            ),
          ],
        ), // Populate the Drawer in the next step.
      ),
      appBar: AppBar(
        centerTitle: true,
        title: Text("Books"),
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
                      onPressed: _openFavoriteBooksPage,
                      child: Text(
                        "My favorite Books",
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
                      onPressed: _openMoviesToWatchPage,
                      child: Text(
                        "My list of Movies To Watch",
                        style: Theme.of(context)
                            .textTheme
                            .headline3
                            .copyWith(color: secondary),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: _openFavoriteMoviesPage,
                      child: Text(
                        "My Favorite Movies",
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
        builder: (context) => Movies(),
      ),
    );
  }

  void _openMoviesToWatchPage() {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => MoviesToWatch(),
    ));
  }

  void _openFavoriteMoviesPage() {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => FavoriteMovies(),
    ));
  }

//book methods
  void _openBooksPage() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => Books(),
      ),
    );
  }

  void _openBooksToReadPage() {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => BooksToRead(),
    ));
  }

  void _openFavoriteBooksPage() {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => FavoriteBooks(),
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
