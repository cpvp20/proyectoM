import 'package:proyectoM/colors.dart';
import 'package:flutter/material.dart';
import 'home/home.dart';
import 'register.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  bool conditions = false;

  Function _checkConditions() {
    return (value) {
      if (_usernameController.text.length > 0 &&
          _passwordController.text.length > 0) {
        setState(() {
          conditions = true;
        });
      } else {
        setState(() {
          conditions = false;
        });
      }
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        padding: const EdgeInsets.only(top: 100),
        color: secondary,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    left: 50.0, right: 50.0, bottom: 50.0),
                child: Image.network(
                    'http://cdn.cnn.com/cnnnext/dam/assets/200505134923-the-good-stuff-special-article-page-logo-large-169.png'),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text('Full name:',
                    style: TextStyle(color: black, fontSize: 12)),
              ),
              TextField(
                controller: _usernameController,
                onChanged: _checkConditions(),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text('Password:',
                    style: TextStyle(color: black, fontSize: 12)),
              ),
              TextField(
                controller: _passwordController,
                onChanged: _checkConditions(),
                style: TextStyle(color: black),
                decoration: InputDecoration(
                  filled: false,
                ),
                obscureText: true,
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                color: secondary,
                child: ElevatedButton(
                  child: Container(
                    height: 70,
                    child: Center(
                      child: Text(
                        "LOGIN",
                        style: TextStyle(
                            fontSize: 14,
                            color: black,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                  onPressed: () {
                    if (conditions) {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => Home(
                            title: 'Good stuff',
                          ),
                        ),
                      );
                    }
                  },
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                child: Text(
                  "Forgot your password? No problem!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: black,
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              SizedBox(
                height: 100,
              ),
              Text(
                "¿Not yet part of our awesome community?",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: black,
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                ),
              ),
              ElevatedButton(
                child: Text(
                  "REGISTER",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: black,
                    fontSize: 12,
                    decoration: TextDecoration.underline,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => RegisterPage()));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
