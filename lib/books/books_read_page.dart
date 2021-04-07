import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shimmer/flutter_shimmer.dart';
import 'package:proyectoM/bloc/book_bloc.dart';
import 'package:proyectoM/books/item_book.dart';
import 'package:proyectoM/books/item_book_details.dart';

class BooksReadPage extends StatefulWidget {
  BooksReadPage({Key key}) : super(key: key);

  @override
  _BooksReadPageState createState() => _BooksReadPageState();
}

class _BooksReadPageState extends State<BooksReadPage> {
  BookBloc _BookBloc;

  @override
  void dispose() {
    _BookBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        _BookBloc = BookBloc();
        return _BookBloc;
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
              Expanded(
                child: BlocConsumer<BookBloc, BookState>(
                  listener: (context, state) {
                    if (state is BookErrorState) {
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
                    if (state is BookLoadedState) {
                      return ListView.builder(
                          itemCount: state.booksList.length,
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.of(context)
                                    .push(MaterialPageRoute(builder: (context) {
                                  return BookDetails(
                                    book: state.booksList[index],
                                  );
                                })).then((value) => setState(() {}));
                              },
                              child: ItemBook(book: state.booksList[index]),
                            );
                          });
                    } else if (state is BookLoadingState) {
                      return ListView.builder(
                        itemCount: 7,
                        itemBuilder: (BuildContext context, int index) {
                          return PlayStoreShimmer();
                        },
                      );
                    } else
                      _BookBloc.add(SearchBooksToReadEvent());
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
