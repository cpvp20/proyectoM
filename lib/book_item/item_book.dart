import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_books_api/book_item/details_book.dart';
import 'package:google_books_api/models/book.dart';

class ItemBook extends StatelessWidget {
  final Book book;
  final _onlinePlaceHolder = "https://via.placeholder.com/150";

  ItemBook({Key key, @required this.book}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: GestureDetector(
              child: Card(
                semanticContainer: true,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Hero(
                  tag: book.isbn,
                  child: Image.network(
                    null ?? _onlinePlaceHolder,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => DetailsBook(
                    bookDetails: book,
                  ),
                ),
              ),
            ),
          ),
          Text(
            book.title ?? "No title available",
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.grey[800],
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          Text(
            "95" ?? "No rating available",
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.grey[800],
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
