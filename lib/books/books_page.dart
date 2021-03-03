import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shimmer/flutter_shimmer.dart';
import 'package:proyectoM/bloc/home_bloc.dart';
import 'package:proyectoM/books/item_book.dart';
import 'package:proyectoM/books/item_book_details.dart';
import 'package:proyectoM/models/book.dart';

class BooksPage extends StatefulWidget {
  final List<Book> booksToRead;
  final List<Book> booksRead;

  BooksPage({Key key, @required this.booksToRead, @required this.booksRead})
      : super(key: key);

  @override
  _BooksPageState createState() => _BooksPageState();
}

class _BooksPageState extends State<BooksPage> {
  HomeBloc _homeBloc;

  @override
  void dispose() {
    _homeBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        _homeBloc = HomeBloc();
        return _homeBloc;
      },
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Books"),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 30),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  labelText: "Search by name or author",
                  suffixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onSubmitted: (content) {
                  _homeBloc.add(SearchBookEvent(queryText: content));
                },
              ),
              Expanded(
                child: BlocConsumer<HomeBloc, HomeState>(
                  listener: (context, state) {
                    if (state is HomeErrorState) {
                      Scaffold.of(context)
                        ..hideCurrentSnackBar()
                        ..showSnackBar(
                          SnackBar(
                            content: Text("Error: ${state.errorMessage}"),
                          ),
                        );
                    }
                  },
                  builder: (context, state) {
                    if (state is HomeLoadedState) {
                      return ListView.builder(
                          itemCount: state.booksList.length,
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.of(context)
                                    .push(MaterialPageRoute(builder: (context) {
                                  return BookDetails(
                                    book: state.booksList[index],
                                    booksToRead: widget.booksToRead,
                                    booksRead: widget.booksRead,
                                  );
                                })).then((value) => setState(() {}));
                              },
                              child: ItemBook(book: state.booksList[index]),
                            );
                          });
                    } else if (state is HomeLoadingState) {
                      return ListView.builder(
                        itemCount: 7,
                        itemBuilder: (BuildContext context, int index) {
                          return PlayStoreShimmer();
                        },
                      );
                    } else
                      return Center(
                        child: Text("Lookup anything!"),
                      );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
