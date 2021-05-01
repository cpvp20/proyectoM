import 'package:auth_buttons/auth_buttons.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
import '../colors.dart';
import '../register/register.dart';

class FormBody extends StatelessWidget {
  // cambiar a un solo value changed que reciba enum de login
  final ValueChanged<bool> onAnonymousLoginTap;
  final ValueChanged<bool> onGoogleLoginTap;
  final Function loginWithEmailAndPassword;
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  FormBody({
    Key key,
    @required this.onAnonymousLoginTap,
    @required this.onGoogleLoginTap,
    @required this.loginWithEmailAndPassword,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 40.0, right: 40.0, bottom: 40.0),
          child: Image.network(
              'http://cdn.cnn.com/cnnnext/dam/assets/200505134923-the-good-stuff-special-article-page-logo-large-169.png'),
        ),
        Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child:
                Text('Email:', style: Theme.of(context).textTheme.headline6)),
        TextField(
          controller: _usernameController,
        ),
        SizedBox(
          height: 10,
        ),
        Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Text('Password:',
                style: Theme.of(context).textTheme.headline6)),
        TextField(
          controller: _passwordController,
          style: Theme.of(context).textTheme.headline6,
          decoration: InputDecoration(
            filled: false,
          ),
          obscureText: true,
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          color: secondary,
          child: ElevatedButton(
            child: Container(
              height: 50,
              child: Center(
                child: Text(
                  "LOGIN",
                  style: Theme.of(context).textTheme.headline4,
                ),
              ),
            ),
            onPressed: () {
              if (_usernameController.text.length > 0 &&
                  _passwordController.text.length > 0) {
                loginWithEmailAndPassword(
                    _usernameController.text, _passwordController.text);
              }
            },
          ),
        ),
        SizedBox(height: 10),
        Text(
          'OR',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.grey[500],
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 10),
        Container(
          color: secondary,
          child: ElevatedButton(
            child: Container(
              height: 50,
              child: Center(
                child: Text(
                  "Login Anonimously",
                  style: Theme.of(context).textTheme.headline4,
                ),
              ),
            ),
            onPressed: () => onAnonymousLoginTap(true),
          ),
        ),
        SizedBox(height: 10),
        Text(
          'OR',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.grey[500],
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 10),
        Container(
          child: Row(
            children: [
              Expanded(
                child: GoogleAuthButton(
                  onPressed: () => onGoogleLoginTap(true),
                  text: "Login with Google",
                  // borderRadius: 18.0,
                  darkMode: false,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 50),
        Text(
          "¿Not yet part of our awesome community?",
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headline6,
        ),
        Container(
          color: secondary,
          child: ElevatedButton(
              child: Container(
                height: 50,
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
              }),
        ),
      ],
    );
  }
}
