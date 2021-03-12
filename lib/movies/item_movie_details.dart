import 'package:proyectoM/models/movie.dart';
import 'package:flutter/material.dart';

class MovieDetails extends StatefulWidget {
  final Movie movie;
  final List<Movie> moviesToWatch;
  final List<Movie> moviesWatched;

  MovieDetails(
      {Key key,
      @required this.movie,
      @required this.moviesToWatch,
      @required this.moviesWatched})
      : super(key: key);

  @override
  _MovieDetailsState createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.movie.title),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.2,
                      child: Image.network(widget.movie.image),
                    ),
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                          child: true
                              ? Icon(
                                  Icons.library_add_outlined,
                                  size: 30,
                                )
                              : Icon(Icons.library_add, size: 30)),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        child: true
                            ? Icon(
                                Icons.library_add_check_outlined,
                                size: 30,
                              )
                            : Icon(
                                Icons.library_add_check,
                                size: 30,
                              ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Text(
              widget.movie.title,
              style: Theme.of(context).textTheme.headline5,
            ),
            Text(
              widget.movie.description,
              style: Theme.of(context).textTheme.bodyText2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "Rating:",
                  style: Theme.of(context)
                      .textTheme
                      .headline2
                      .copyWith(fontSize: 18.0),
                ),
                Row(
                  children: _ratingToStars(widget.movie.rating),
                ),
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
                      icon: Icon(Icons.web_outlined),
                      tooltip: 'Find movie online',
                      onPressed: () {
                        setState(() {});
                      },
                    ),
                    Text('Find movie online')
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _ratingToStars(rating) {
    List<Widget> stars = [];
    for (var i = 0; i < 5; i++) {
      if (rating > 0 && rating / 20 > i) {
        stars.add(Icon(Icons.star));
      } else {
        stars.add(Icon(Icons.star_border));
      }
    }
    return stars;
  }
}
