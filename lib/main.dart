import 'package:flutter/material.dart';
import 'package:proyectoM/utils/constants.dart';
import 'begin.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final ThemeData _ = ThemeData.light();
    return MaterialApp(
      title: APP_TITLE,
      home: BeginPage(),
      theme: ThemeData(
          unselectedWidgetColor: Colors.white,
          inputDecorationTheme: InputDecorationTheme(
            filled: true,
            fillColor: Colors.white,
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(0.0),
                borderSide: BorderSide(color: Colors.white, width: 1.0)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(0.0),
                borderSide: BorderSide(color: Colors.white, width: 1.0)),
          ),
          fontFamily: 'AkzidenzGrotesk'),
    );
  }
}
