import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shimmer/flutter_shimmer.dart';
import 'package:proyectoM/movies/item_movie.dart';
import 'package:proyectoM/movies/item_movie_details.dart';

import 'bloc/movies_bloc.dart';

class Movies extends StatefulWidget {
  Movies({Key key}) : super(key: key);

  @override
  _MoviesState createState() => _MoviesState();
}

class _MoviesState extends State<Movies> {
  MoviesBloc _moviesBloc;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        _moviesBloc = MoviesBloc();
        _moviesBloc
          ..add(SearchMoviesEvent(queryText: "titanic")); //show this initially
        return _moviesBloc;
      },
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Movies"),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 30),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  labelText: "Search by name or keyword",
                  suffixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onSubmitted: (content) {
                  _moviesBloc.add(SearchMoviesEvent(queryText: content));
                },
              ),
              Expanded(
                child: BlocConsumer<MoviesBloc, MoviesState>(
                  listener: (context, state) {
                    if (state is MoviesErrorState) {
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
                    if (state is MoviesLoadedState) {
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
                    } else if (state is MoviesLoadingState) {
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
