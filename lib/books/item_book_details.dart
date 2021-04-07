import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:proyectoM/colors.dart';
import 'package:proyectoM/models/book.dart';
import 'package:flutter/material.dart';

class BookDetails extends StatefulWidget {
  final Book book;
  BookDetails({Key key, @required this.book}) : super(key: key);

  @override
  _BookDetailsState createState() => _BookDetailsState();
}

class _BookDetailsState extends State<BookDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.book.title),
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
                      child: Image.network(
                        widget.book.image ?? "https://via.placeholder.com/150",
                        fit: BoxFit.fill,
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          var result =
                              true; //isBookInBooksToRead(widget.book.id);
                          var x = isBookInBooksToRead(widget.book.id);
                          print("HELLO");
                          print(x);
                          if (result) {
                            //item not in todo list
                            FirebaseFirestore.instance
                                .collection('books_to_read')
                                .add({
                              'id': widget.book.id,
                              'title': widget.book.title,
                              'selfLink': widget.book.selfLink,
                              'publishedDate': widget.book.publishedDate,
                              'image': widget.book.image,
                              'authors': widget.book.authors,
                              'previewLink': widget.book.previewLink,
                              'language': widget.book.language,
                              'categories': widget.book.categories,
                              'description': widget.book.description,
                              'pageCount': widget.book.pageCount,
                              'rating': widget.book.rating,
                            });
                          } else {
                            //item already in list
                            //await widget.removeBook(widget.book);
                          }
                        });
                      },
                      child: Container(
                          child: true
                              ? Icon(Icons.library_add_outlined, size: 40)
                              : Icon(Icons.library_add, size: 40)),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {});
                      },
                      child: Container(
                          child: true //isBookInBooksToRead(widget.book.id)
                              ? Icon(Icons.library_add_check_outlined, size: 40)
                              : Icon(Icons.library_add_check, size: 40)),
                    ),
                  ],
                ),
              ],
            ),
            Text(
              widget.book.title,
              style: Theme.of(context).textTheme.headline5,
            ),
            Text(
              widget.book.authors.toString(),
              style: Theme.of(context).textTheme.bodyText2,
            ),
            Text(
              widget.book.publishedDate ?? "No date",
              style: Theme.of(context).textTheme.bodyText2,
            ),
            Row(
              children: List.generate(
                widget.book.categories != null
                    ? widget.book.categories.length
                    : 0,
                (index) => Chip(
                  backgroundColor: primary,
                  label: Text(
                    "${widget.book.categories[index]}",
                  ),
                ),
              ),
            ),
            Text(
              widget.book.description ?? "No description",
              style: Theme.of(context).textTheme.bodyText2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text("Rating:",
                    style: Theme.of(context)
                        .textTheme
                        .headline2
                        .copyWith(fontSize: 18.0)),
                Row(
                  children: _ratingToStars(widget.book.rating),
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
                      tooltip: 'Find book near me',
                      onPressed: () {
                        setState(() {});
                      },
                    ),
                    Text('Find book near me')
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

  Future<bool> isBookInBooksToRead(String id) async =>
      FirebaseFirestore.instance
          .collection('users')
          .where('id', isEqualTo: id)
          .get()
          .then((documentSnapshot) => (documentSnapshot != null) ? true : false)
          .then((value) => value);
}
