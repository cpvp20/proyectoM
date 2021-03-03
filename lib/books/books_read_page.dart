import 'package:flutter/material.dart';
import 'package:proyectoM/books/item_book.dart';
import 'package:proyectoM/books/item_book_details.dart';
import 'package:proyectoM/models/book.dart';

class BooksRead extends StatefulWidget {
  final List<Book> booksToRead;
  final List<Book> booksRead;

  BooksRead({
    Key key,
    @required this.booksToRead,
    @required this.booksRead,
  }) : super(key: key);

  @override
  _BooksReadState createState() => _BooksReadState();
}

class _BooksReadState extends State<BooksRead> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Books Read by Me"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 30),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: widget.booksRead.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return BookDetails(
                          book: widget.booksToRead[index],
                          booksToRead: widget.booksToRead,
                          booksRead: widget.booksRead,
                        );
                      })).then((value) => setState(() {}));
                    },
                    child: ItemBook(book: widget.booksRead[index]),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
