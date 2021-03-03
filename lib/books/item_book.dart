import 'package:flutter/material.dart';
import 'package:proyectoM/models/book.dart';
import 'package:proyectoM/colors.dart';

class ItemBook extends StatefulWidget {
  final Book book;
  ItemBook({
    Key key,
    @required this.book,
  }) : super(key: key);

  @override
  _ItemBookState createState() => _ItemBookState();
}

class _ItemBookState extends State<ItemBook> {
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
                    Text("${widget.book.volumeInfo.title}",
                        style: Theme.of(context).textTheme.headline2),
                    Text(
                      widget.book.volumeInfo.description != null
                          ? "${widget.book.volumeInfo.description.substring(0, 70)}..."
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
                      children: _ratingToStars(70),
                    )
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 5.0),
                width: MediaQuery.of(context).size.width * 0.3,
                child: Image.network(
                  widget.book.volumeInfo.imageLinks.thumbnail ??
                      "https://via.placeholder.com/150",
                  fit: BoxFit.fill,
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
