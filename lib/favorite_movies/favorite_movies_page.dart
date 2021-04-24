import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shimmer/flutter_shimmer.dart';
import 'package:proyectoM/movies/item_movie.dart';
import 'package:proyectoM/movies/item_movie_details.dart';

import 'bloc/favorite_movies_bloc.dart';

class FavoriteMovies extends StatefulWidget {
  FavoriteMovies({Key key}) : super(key: key);

  @override
  _FavoriteMoviesState createState() => _FavoriteMoviesState();
}

class _FavoriteMoviesState extends State<FavoriteMovies> {
  FavoriteMoviesBloc _bloc;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        _bloc = FavoriteMoviesBloc();
        _bloc..add(GetFavoriteMoviesEvent()); //show this initially

        return _bloc;
      },
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Favorite Movies"),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 30),
          child: Column(
            children: [
              Expanded(
                child: BlocConsumer<FavoriteMoviesBloc, FavoriteMoviesState>(
                  listener: (context, state) {
                    if (state is FavoriteMoviesErrorState) {
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
                    if (state is FavoriteMoviesLoadedState) {
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
                    } else if (state is FavoriteMoviesLoadingState) {
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
