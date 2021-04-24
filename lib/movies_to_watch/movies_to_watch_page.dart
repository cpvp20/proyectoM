import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shimmer/flutter_shimmer.dart';
import 'package:proyectoM/books/bloc/book_bloc.dart';
import 'package:proyectoM/books/item_book.dart';
import 'package:proyectoM/books/item_book_details.dart';
import 'package:proyectoM/movies/item_movie.dart';
import 'package:proyectoM/movies/item_movie_details.dart';

import 'bloc/movies_to_watch_bloc.dart';

class MoviesToWatch extends StatefulWidget {
  MoviesToWatch({Key key}) : super(key: key);

  @override
  _MoviesToWatchState createState() => _MoviesToWatchState();
}

class _MoviesToWatchState extends State<MoviesToWatch> {
  MoviesToWatchBloc _bloc;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        _bloc = MoviesToWatchBloc();
        _bloc..add(GetMoviesToWatchEvent()); //show this initially
        return _bloc;
      },
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Movies To Watch"),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 30),
          child: Column(
            children: [
              Expanded(
                child: BlocConsumer<MoviesToWatchBloc, MoviesToWatchState>(
                  listener: (context, state) {
                    if (state is MoviesToWatchErrorState) {
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
                    if (state is MoviesToWatchLoadedState) {
                      return ListView.builder(
                          itemCount: state.moviesList.length,
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.of(context)
                                    .push(MaterialPageRoute(builder: (context) {
                                  return MovieDetails(
                                    movie: state.moviesList[index],
                                  );
                                })).then((value) => setState(() {}));
                              },
                              child: ItemMovie(movie: state.moviesList[index]),
                            );
                          });
                    } else if (state is MoviesToWatchLoadingState) {
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
