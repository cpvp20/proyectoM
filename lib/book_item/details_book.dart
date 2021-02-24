import 'package:flutter/material.dart';
import 'package:google_books_api/models/book.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailsBook extends StatefulWidget {
  final Book bookDetails;

  DetailsBook({Key key, @required this.bookDetails}) : super(key: key);

  @override
  _DetailsBookState createState() => _DetailsBookState();
}

class _DetailsBookState extends State<DetailsBook> {
  bool _showLongDescription = false;

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detalles del libro"),
        actions: [
          IconButton(
            tooltip: "Visitar webpage",
            icon: Icon(Icons.public),
            onPressed: () {
              //TODO: implementar web view o abrir con el navegador
              // Navigator.of(context).push(
              //   MaterialPageRoute(
              //     builder: (context) => WebViewPage(
              //       url: "https://generated.photos/face/joyfull-white-young-adult-female-with-medium-brown-hair-and-grey-eyes--5e6889416d3b380006f230c1",
              //     ),
              //   ),
              // );
              _launchURL(widget.bookDetails.title);
            },
          ),
          IconButton(
            tooltip: "Recommend to a friend",
            icon: Icon(Icons.share),
            onPressed: () {
              Share.share(
                "Tengo el libro de ${widget.bookDetails.title} para ti en el siguiente link",
                subject: "Mira este libro",
              );
            },
          ),
        ],
      ),
      body: Container(
        margin: EdgeInsets.all(24),
        child: ListView(
          children: [
            Container(
              margin: EdgeInsets.all(24),
              height: MediaQuery.of(context).size.height * .4,
              child: Hero(
                tag: widget.bookDetails.isbn,
                child: Image.network(
                  "https://generated.photos/face/joyfull-white-young-adult-female-with-medium-brown-hair-and-grey-eyes--5e6889416d3b380006f230c1",
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Text(
              widget.bookDetails.title ?? "No title",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w300),
            ),
            SizedBox(height: 24),
            Text(
              "96" ?? "No title",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w300),
            ),
            Text(
              widget.bookDetails.publishedDate ?? "No date",
              style: TextStyle(
                color: Colors.grey[700],
                fontWeight: FontWeight.bold,
              ),
            ),
            GestureDetector(
              child: _showLongDescription
                  ? Text(
                      widget.bookDetails.description ?? "No description",
                      style: TextStyle(
                        fontWeight: FontWeight.w300,
                      ),
                    )
                  : Text(
                      widget.bookDetails.description ??
                          "No description available",
                      maxLines: 6,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
              onTap: () {
                setState(() {
                  _showLongDescription = !_showLongDescription;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
