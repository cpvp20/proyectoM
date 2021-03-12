import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart';
import 'package:proyectoM/models/movie.dart';

class MoviesRepository {
  static final MoviesRepository _moviesRepository =
      MoviesRepository._internal();
  factory MoviesRepository() {
    return _moviesRepository;
  }

  MoviesRepository._internal();

  Future<List<Movie>> getAvailableMovies(String query) async {
//https://api.themoviedb.org/3/search/movie?api_key=346075ab2b6f1b26418e8a4019fdd4e2&language=en-US&query=potter
    String key = "346075ab2b6f1b26418e8a4019fdd4e2";
    final _uri = Uri(
        scheme: "https",
        host: "api.themoviedb.org",
        path: "3/search/movie",
        queryParameters: {
          "api_key": key,
          "language": "en-US",
          "query": query,
        });

    try {
      final response = await get(_uri.toString());
      if (response.statusCode == HttpStatus.ok) {
        var _responseAsJson = jsonDecode(response.body);

        var results = (_responseAsJson['results'] as List<dynamic>)?.map((e) {
          return e == null ? null : Movie.fromJson(e as Map<String, dynamic>);
        })?.toList();

        return results;
      } else
        return null;
    } catch (e) {
      // arroje un error
      throw "Ha ocurrido un error: $e";
    }
  }
}
