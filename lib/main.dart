import 'package:flutter/material.dart';
import 'package:proyectoM/utils/constants.dart';
import 'begin.dart';
import 'colors.dart';

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
        primaryColor: primary,
        secondaryHeaderColor: secondary,
        unselectedWidgetColor: white,
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
                textStyle:
                    MaterialStateProperty.all(TextStyle(color: secondary)),
                backgroundColor: MaterialStateProperty.all(primary))),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(0.0),
              borderSide: BorderSide(color: white, width: 1.0)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(0.0),
              borderSide: BorderSide(color: white, width: 1.0)),
        ),
        fontFamily: 'AkzidenzGrotesk',
        textTheme: TextTheme(
          headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
          headline2: TextStyle(fontSize: 20.0, color: dark),
          headline3: TextStyle(fontSize: 12.0, color: secondary),
          headline4: TextStyle(
              fontSize: 14, fontWeight: FontWeight.w800, color: secondary),
          headline6: TextStyle(color: black, fontSize: 12),
          bodyText1: TextStyle(fontSize: 16, color: darkgrey),
        ),
      ),
    );
  }
}
