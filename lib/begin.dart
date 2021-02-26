import 'package:proyectoM/colors.dart';
import 'package:proyectoM/home/home.dart';
import 'package:proyectoM/login.dart';
import 'package:proyectoM/register.dart';
import 'package:flutter/material.dart';

class BeginPage extends StatelessWidget {
  const BeginPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: const EdgeInsets.all(30),
      color: secondary,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 100.0, horizontal: 60.0),
            child: Image.network(
                'http://cdn.cnn.com/cnnnext/dam/assets/200505134923-the-good-stuff-special-article-page-logo-large-169.png'),
          ),
          Container(
            color: secondary,
            child: ElevatedButton(
              child: Container(
                height: 60,
                child: Center(
                  child: Text(
                    "REGISTER",
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ),
              ),
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => RegisterPage()));
              },
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Container(
            color: secondary,
            child: ElevatedButton(
              child: Container(
                height: 60,
                child: Center(
                  child: Text(
                    "LOGIN",
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ),
              ),
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => LoginPage()));
              },
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Container(
            color: wine,
            child: ElevatedButton(
              child: Container(
                height: 60,
                child: Center(
                  child: Text(
                    "SKIP (solo mientras para no tener q estar logueandonos cada vez)",
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ),
              ),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => Home(
                      title: 'Good Stuff',
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    ));
  }
}
