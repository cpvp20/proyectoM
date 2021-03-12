import 'package:proyectoM/colors.dart';
import 'package:proyectoM/models/book.dart';
import 'package:flutter/material.dart';

class BookDetails extends StatefulWidget {
  final Book book;
  final List<Book> booksToRead;
  final List<Book> booksRead;

  BookDetails(
      {Key key,
      @required this.book,
      @required this.booksToRead,
      @required this.booksRead})
      : super(key: key);

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
                          int index = getIndexOfItemInList(
                              widget.booksToRead, widget.book.id);
                          if (index == -1) {
                            //item not in todo list
                            widget.booksToRead.add(widget.book);
                          } else {
                            //item already in todo list
                            widget.booksToRead.removeAt(index);
                          }
                        });
                      },
                      child: Container(
                          child: getIndexOfItemInList(
                                      widget.booksToRead, widget.book.id) ==
                                  -1
                              ? Icon(Icons.library_add_outlined, size: 40)
                              : Icon(Icons.library_add, size: 40)),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          int index = getIndexOfItemInList(
                              widget.booksRead, widget.book.id);
                          if (index == -1) {
                            //item not in todo list
                            widget.booksRead.add(widget.book);
                          } else {
                            //item already in todo list
                            widget.booksRead.removeAt(index);
                          }
                        });
                      },
                      child: Container(
                          child: getIndexOfItemInList(
                                      widget.booksRead, widget.book.id) ==
                                  -1
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

//this method has 2 purposes, to see if item is present in cart, and if so to find its index
//returns -1 if item is not present in cart
  int getIndexOfItemInList(list, String id) {
    for (Book e in list) {
      int index = 0;
      if (e.id == id) return index;
      index++;
    }
    return -1;
  }
}
