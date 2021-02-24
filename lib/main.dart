import 'package:flutter/material.dart';
import 'package:google_books_api/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Goood Stuff App',
      theme: ThemeData(
        primaryColor: Colors.blue[800],
        accentColor: Colors.blue[400],
        cursorColor: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}
