import 'dart:async';
import 'package:connectivity/connectivity.dart';
import 'package:share/share.dart';
import 'package:http/http.dart';
import 'package:path_provider/path_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:proyectoM/colors.dart';
import 'package:proyectoM/models/book.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:io';

class BookDetails extends StatefulWidget {
  final Book book;
  BookDetails({Key key, @required this.book}) : super(key: key);

  @override
  _BookDetailsState createState() => _BookDetailsState();
}

class _BookDetailsState extends State<BookDetails> {
  final _cFirestore = FirebaseFirestore.instance;

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
                          setState(() async {
                            await _saveInBooksToRead(widget.book);
                          });
                        },
                        child: Icon(Icons.library_add_outlined, size: 40)),
                    SizedBox(height: 20),
                    GestureDetector(
                        onTap: () {
                          setState(() async {
                            await _saveInFavoriteBooks(widget.book);
                          });
                        },
                        child: Icon(Icons.favorite_outline, size: 40)),
                    SizedBox(height: 20),
                    GestureDetector(
                      onTap: () {
                        setState(() async {
                          await _share(widget.book, context);
                        });
                      },
                      child: Icon(Icons.share, size: 40),
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
              widget.book.authors.toString() ?? "No author",
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
                    children: widget.book.averageRating != null
                        ? _averageRatingToStars(widget.book.averageRating)
                        : _averageRatingToStars(0))
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: InkWell(
                onTap: () async {
                  if (widget.book.previewLink != null) {
                    launch(widget.book.previewLink,
                        enableJavaScript: true,
                        forceWebView: true,
                        enableDomStorage: true);
                  } else {
                    launch("https://google.com",
                        enableJavaScript: true,
                        forceWebView: true,
                        enableDomStorage: true);
                  }
                },
                child: Text(
                  "Online book",
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 16,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
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

//funcionalidad de compartir libros por Whatsapp o instagram o facebook o email, etc.
  void _share(Book book, context) async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult != ConnectivityResult.mobile &&
        connectivityResult != ConnectivityResult.wifi) {
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(
          SnackBar(
            behavior: SnackBarBehavior.floating,
            content: Text("No se puede compartir, No hay conexión."),
          ),
        );
      return;
    }
    try {
      String image = book.image ??
          "https://socialistmodernism.com/wp-content/uploads/2017/07/placeholder-image.png";
      final response = await get(Uri.parse(image));
      String extension = image.split(".").last.split('?').first;

      final Directory temp = await getTemporaryDirectory();
      final File imageFile =
          File('${temp.path}/${book.title ?? "book"}.$extension');
      imageFile.writeAsBytesSync(response.bodyBytes);

      Share.shareFiles(
        ['${temp.path}/${book.title ?? "book"}.$extension'],
        text:
            '${book.title ?? "book"} - ${book.description ?? "No descripcion"}" \n ${book.previewLink ?? ""}',
        subject: 'Check out this amazing book: ',
      );
    } catch (e) {
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(
          SnackBar(
            behavior: SnackBarBehavior.floating,
            content: Text("Unable to share book: $e"),
          ),
        );
    }
  }

  Future<void> _saveInBooksToRead(Book book) async {
    try {
      _cFirestore
          .collection('books_to_read')
          .where('id', isEqualTo: widget.book.id)
          .get()
          .then((QuerySnapshot snapshot) async {
        if (snapshot.docs.length > 0) {
          print('Document data: ${snapshot.docs}');
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                behavior: SnackBarBehavior.floating,
                content: Text("Book already in books to read"),
              ),
            );
          //FALTA BORRARLO
        } else {
          print('Document does not exist on the database');
          await _cFirestore.collection("books_to_read").add(book.toJson());
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                behavior: SnackBarBehavior.floating,
                content: Text("Book saved in books to read"),
              ),
            );
        }
      });
    } catch (e) {
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(
          SnackBar(
            behavior: SnackBarBehavior.floating,
            content: Text("Error saving book: $e"),
          ),
        );
    }
  }

  Future<void> _saveInFavoriteBooks(Book book) async {
    try {
      _cFirestore
          .collection('favorite_books')
          .where('id', isEqualTo: widget.book.id)
          .get()
          .then((QuerySnapshot snapshot) async {
        if (snapshot.docs.length > 0) {
          print('Document data: ${snapshot.docs}');
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                behavior: SnackBarBehavior.floating,
                content: Text("Book already in favorite books"),
              ),
            );
          //FALTA BORRARLO
        } else {
          print('Document does not exist on the database');
          await _cFirestore.collection("favorite_books").add(book.toJson());
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                behavior: SnackBarBehavior.floating,
                content: Text("Book saved in favorite books"),
              ),
            );
        }
      });
    } catch (e) {
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(
          SnackBar(
            behavior: SnackBarBehavior.floating,
            content: Text("Error saving book: $e"),
          ),
        );
    }
  }
}
