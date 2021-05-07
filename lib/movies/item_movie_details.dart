import 'dart:async';
import 'package:connectivity/connectivity.dart';
import 'package:share/share.dart';
import 'package:http/http.dart';
import 'package:path_provider/path_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:proyectoM/colors.dart';
import 'package:proyectoM/models/movie.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:io';

class MovieDetails extends StatefulWidget {
  final Movie movie;
  MovieDetails({Key key, @required this.movie}) : super(key: key);

  @override
  _MovieDetailsState createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {
  final _cFirestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.movie.title),
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
                        widget.movie.image ?? "https://via.placeholder.com/150",
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
                            await _saveInMoviesToWatch(widget.movie);
                          });
                        },
                        child: Icon(Icons.library_add_outlined, size: 40)),
                    SizedBox(height: 20),
                    GestureDetector(
                        onTap: () {
                          setState(() async {
                            await _saveInFavoriteMovies(widget.movie);
                          });
                        },
                        child: Icon(Icons.favorite_outline, size: 40)),
                    SizedBox(height: 20),
                    GestureDetector(
                      onTap: () {
                        setState(() async {
                          await _share(widget.movie, context);
                        });
                      },
                      child: Icon(Icons.share, size: 40),
                    ),
                  ],
                ),
              ],
            ),
            Text(
              widget.movie.title,
              style: Theme.of(context).textTheme.headline5,
            ),
            Text(
              widget.movie.releaseDate ?? "No date",
              style: Theme.of(context).textTheme.bodyText2,
            ),
            Text(
              widget.movie.description ?? "No description",
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
                    children: widget.movie.averageRating != null
                        ? _averageRatingToStars(widget.movie.averageRating)
                        : _averageRatingToStars(0))
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Column(
                  children: <Widget>[
                    IconButton(
                      iconSize: 55,
                      icon: Icon(Icons.local_movies),
                      tooltip: 'Find movie online',
                      onPressed: () async {
                        launch(
                            "https://www.netflix.com/search?q=${widget.movie.title}",
                            enableJavaScript: true,
                            forceWebView: true,
                            enableDomStorage: true);
                      },
                    ),
                    Text('Find movie online')
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
      if (averageRating > 0 && averageRating / 2 > i) {
        stars.add(Icon(Icons.star));
      } else {
        stars.add(Icon(Icons.star_border));
      }
    }
    return stars;
  }

//funcionalidad de compartir libros por Whatsapp o instagram o facebook o email, etc.
  void _share(Movie movie, context) async {
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
      String image = movie.image ??
          "https://socialistmodernism.com/wp-content/uploads/2017/07/placeholder-image.png";
      final response = await get(Uri.parse(image));
      String extension = image.split(".").last.split('?').first;

      final Directory temp = await getTemporaryDirectory();
      final File imageFile =
          File('${temp.path}/${movie.title ?? "movie"}.$extension');
      imageFile.writeAsBytesSync(response.bodyBytes);

      Share.shareFiles(
        ['${temp.path}/${movie.title ?? "movie"}.$extension'],
        text:
            '${movie.title ?? "movie"} - ${movie.description ?? "No descripcion"}" ',
        subject: 'Check out this amazing movie: ',
      );
    } catch (e) {
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(
          SnackBar(
            behavior: SnackBarBehavior.floating,
            content: Text("Unable to share movie: $e"),
          ),
        );
    }
  }

  Future<void> _saveInMoviesToWatch(Movie movie) async {
    try {
      _cFirestore
          .collection('movies_to_watch')
          .where('id', isEqualTo: widget.movie.id)
          .get()
          .then((QuerySnapshot snapshot) async {
        if (snapshot.docs.length > 0) {
          print('Document data: ${snapshot.docs}');
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                behavior: SnackBarBehavior.floating,
                content: Text("Movie already in movies to watch"),
              ),
            );
          //FALTA BORRARLO
        } else {
          print('Document does not exist on the database');
          await _cFirestore.collection("movies_to_watch").add(movie.toJson());
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                behavior: SnackBarBehavior.floating,
                content: Text("Movie saved in movies to watch"),
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
            content: Text("Error saving movie: $e"),
          ),
        );
    }
  }

  Future<void> _saveInFavoriteMovies(Movie movie) async {
    try {
      _cFirestore
          .collection('favorite_movies')
          .where('id', isEqualTo: widget.movie.id)
          .get()
          .then((QuerySnapshot snapshot) async {
        if (snapshot.docs.length > 0) {
          print('Document data: ${snapshot.docs}');
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                behavior: SnackBarBehavior.floating,
                content: Text("Movie already in favorite movies"),
              ),
            );
          //FALTA BORRARLO
        } else {
          print('Document does not exist on the database');
          await _cFirestore.collection("favorite_movies").add(movie.toJson());
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                behavior: SnackBarBehavior.floating,
                content: Text("Movie saved in favorite movies"),
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
            content: Text("Error saving movie: $e"),
          ),
        );
    }
  }
}
