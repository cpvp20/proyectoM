import 'package:flutter/material.dart';
import 'package:proyectoM/models/movie.dart';
import 'package:proyectoM/colors.dart';
import 'item_movie_details.dart';

class ItemMovie extends StatelessWidget {
  final Movie movie;
  ItemMovie({Key key, @required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => MovieDetails(movie: movie),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Stack(alignment: Alignment.center, children: [
          Container(
            color: secondary,
            padding: const EdgeInsets.all(30.0),
            height: MediaQuery.of(context).size.height * 0.3,
            width: MediaQuery.of(context).size.width * 0.8,
            child: Row(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.3,
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("${movie.title}",
                          style: Theme.of(context).textTheme.headline2),
                      Text(
                        movie.description != null
                            ? "${movie.description.substring(0, 70)}..."
                            : "No description",
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      Text(
                        "Rating:",
                        style: Theme.of(context)
                            .textTheme
                            .headline2
                            .copyWith(fontSize: 18.0),
                      ),
                      Row(
                          children: movie.averageRating != null
                              ? _averageRatingToStars(movie.averageRating)
                              : _averageRatingToStars(0))
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 5.0),
                  width: MediaQuery.of(context).size.width * 0.3,
                  child: (movie.image == null || movie.image == "")
                      ? Image.asset(
                          'assets/placeholder.png',
                          fit: BoxFit.fill,
                        )
                      : Image.network(
                          movie.image,
                          fit: BoxFit.fill,
                        ),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }

  List<Widget> _averageRatingToStars(averageRating) {
    List<Widget> stars = [];
    for (var i = 0; i < 5; i++) {
      if (averageRating > 0 && averageRating > i) {
        stars.add(Icon(Icons.star));
      } else {
        stars.add(Icon(Icons.star_border));
      }
    }
    return stars;
  }
}
