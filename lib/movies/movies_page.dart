import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shimmer/flutter_shimmer.dart';
import 'package:proyectoM/bloc/movie_bloc.dart';
import 'package:proyectoM/movies/item_movie.dart';
import 'package:proyectoM/movies/item_movie_details.dart';
import 'package:proyectoM/models/movie.dart';

class MoviesPage extends StatefulWidget {
  final List<Movie> moviesToWatch;
  final List<Movie> moviesWatched;

  MoviesPage(
      {Key key, @required this.moviesToWatch, @required this.moviesWatched})
      : super(key: key);

  @override
  _MoviesPageState createState() => _MoviesPageState();
}

class _MoviesPageState extends State<MoviesPage> {
  MovieBloc _MovieBloc;

  @override
  void dispose() {
    _MovieBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        _MovieBloc = MovieBloc();
        return _MovieBloc;
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
                  labelText: "Search by name or author",
                  suffixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onSubmitted: (content) {
                  _MovieBloc.add(SearchMovieEvent(queryText: content));
                },
              ),
              Expanded(
                child: BlocConsumer<MovieBloc, MovieState>(
                  listener: (context, state) {
                    if (state is MovieErrorState) {
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
                    if (state is MovieLoadedState) {
                      return ListView.builder(
                          itemCount: state.moviesList.length,
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.of(context)
                                    .push(MaterialPageRoute(builder: (context) {
                                  return MovieDetails(
                                    movie: state.moviesList[index],
                                    moviesToWatch: widget.moviesToWatch,
                                    moviesWatched: widget.moviesWatched,
                                  );
                                })).then((value) => setState(() {}));
                              },
                              child: ItemMovie(movie: state.moviesList[index]),
                            );
                          });
                    } else if (state is MovieLoadingState) {
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
