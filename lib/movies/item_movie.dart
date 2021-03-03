import 'package:flutter/material.dart';
import 'package:proyectoM/models/movie.dart';
import 'package:proyectoM/colors.dart';

class ItemMovie extends StatefulWidget {
  final Movie movie;
  ItemMovie({
    Key key,
    @required this.movie,
  }) : super(key: key);

  @override
  _ItemMovieState createState() => _ItemMovieState();
}

class _ItemMovieState extends State<ItemMovie> {
  @override
  Widget build(BuildContext context) {
    return Padding(
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
                    Text("${widget.movie.title}",
                        style: Theme.of(context).textTheme.headline2),
                    Text(
                      "${widget.movie.description.substring(0, 70)}...",
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
                      children: _ratingToStars(widget.movie.productRating),
                    )
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 5.0),
                width: MediaQuery.of(context).size.width * 0.3,
                child: Image.network(
                  widget.movie.image,
                ),
              ),
            ],
          ),
        ),
      ]),
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
