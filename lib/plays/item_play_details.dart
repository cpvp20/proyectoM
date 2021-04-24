import 'package:proyectoM/models/play.dart';
import 'package:flutter/material.dart';

class PlayDetails extends StatefulWidget {
  final Play play;
  final List<Play> playsToSee;
  PlayDetails({Key key, @required this.play, @required this.playsToSee})
      : super(key: key);

  @override
  _PlayDetailsState createState() => _PlayDetailsState();
}

class _PlayDetailsState extends State<PlayDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.play.title),
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
                      child: Image.network(widget.play.image),
                    ),
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          widget.play.status == 1
                              ? widget.play.status = 0
                              : widget.play.status = 1;
                          widget.playsToSee.add(
                            widget.play,
                          );
                        });
                      },
                      child: Container(
                          child: widget.play.status != 1
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
                      onTap: () {
                        setState(() {
                          widget.play.status == 2
                              ? widget.play.status = 0
                              : widget.play.status = 2;
                        });
                      },
                      child: Container(
                        child: widget.play.status != 2
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
              widget.play.title,
              style: Theme.of(context).textTheme.headline5,
            ),
            Text(
              widget.play.description,
              style: Theme.of(context).textTheme.bodyText2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text("averageRating:",
                    style: Theme.of(context)
                        .textTheme
                        .headline2
                        .copyWith(fontSize: 18.0)),
                Row(
                  children:
                      _averageRatingToStars(widget.play.productaverageRating),
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
                      icon: Icon(Icons.location_on_outlined),
                      tooltip: 'Find showtimes near me',
                      onPressed: () {
                        setState(() {});
                      },
                    ),
                    Text('Find showtimes near me')
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _averageRatingToStars(averageRating) {
    List<Widget> stars = [];
    for (var i = 0; i < 5; i++) {
      if (averageRating > 0 && averageRating / 20 > i) {
        stars.add(Icon(Icons.star));
      } else {
        stars.add(Icon(Icons.star_border));
      }
    }
    return stars;
  }
}
