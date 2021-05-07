import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart';
import 'package:proyectoM/models/book.dart';

class Place extends StatefulWidget {
  final Book book;
  const Place({Key key, @required this.book}) : super(key: key);

  @override
  _PlaceState createState() => _PlaceState();
}

class _PlaceState extends State<Place> {
  final Map<String, Marker> _markers = {};
  GoogleMapController _mapController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Libraries where you can find ${widget.book.title}'),
      ),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: const LatLng(
              20.7249, -103.4372), //estas son unas coord equis de guadalajara
          zoom: 12,
        ),
        markers: _markers.values.toSet(),
      ),
    );
  }

  Future<void> _onMapCreated(controller) async {
    _mapController = controller;
    final librariesfromAPI = await getLibraries();
    setState(() {
      _markers.clear();
      for (final office in librariesfromAPI["libraries"]) {
        final marker = Marker(
          markerId: MarkerId(office["name"]),
          position: LatLng(office["lat"], office["lng"]),
          infoWindow: InfoWindow(
            title: office["name"],
            snippet: office["address"] + "\n" + office["phone"],
          ),
        );
        _markers[office["name"]] = marker;
      }
    });
  }

  Future<Map<String, dynamic>> getLibraries() async {
    final url =
        'https://news-app-client-caro.herokuapp.com/libraries?rating=${widget.book.averageRating}';
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
