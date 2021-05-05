import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart';
import 'package:proyectoM/models/book.dart';
//import 'locations.dart' as locations;

class Place extends StatefulWidget {
  final Book book;
  const Place({Key key, @required this.book}) : super(key: key);

  @override
  _PlaceState createState() => _PlaceState();
}

class _PlaceState extends State<Place> {
  final Map<String, Marker> _markers = {};
  Future<void> _onMapCreated(GoogleMapController controller) async {
    final librariesfromAPI = await getLibraries();
    setState(() {
      _markers.clear();
      for (final office in librariesfromAPI["libraries"]) {
        final marker = Marker(
          markerId: MarkerId(office["name"]),
          position: LatLng(office["lat"], office["lng"]),
          infoWindow: InfoWindow(
            title: office["name"],
            snippet: office["address"],
          ),
        );
        _markers[office["name"]] = marker;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Libraries where you can find this book'),
      ),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: const LatLng(20.7249,
              -103.4372), //estas son unas coord equis de guadalajara LOL porque no logre hacer funcionar el getcurrentlocation
          zoom: 12,
        ),
        markers: _markers.values.toSet(),
      ),
    );
  }

  Future<Map<String, dynamic>> getLibraries() async {
    var rating =
        5; //this should be a param instead that is passed from book!!!!!!!!!!!!
    // https://www.googleapis.com/books/v1/volumes?q=query
    final url = rating > 5
        ? "https://news-app-client-caro.herokuapp.com/big"
        : "https://news-app-client-caro.herokuapp.com/small";
    try {
      final response = await get(Uri.parse(url));
      if (response.statusCode == 200) {
        var _responseAsJson = jsonDecode(response.body);
        print(_responseAsJson);
        return _responseAsJson;
      } else
        return null;
    } catch (e) {
      // arroje un error
      throw "Ha ocurrido un error al llamar getLibraries: $e";
    }
  }
}
