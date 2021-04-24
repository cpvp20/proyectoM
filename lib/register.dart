import 'package:proyectoM/colors.dart';
import 'package:flutter/material.dart';
import 'login/login_page.dart';
import 'home/home_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool checked = false;
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool conditions = false;
  Color iconColor = secondary;

  bool obscureText = true;

  _checkConditions() {
    if (checked &&
        _passwordController.text.length != 0 &&
        _usernameController.text.length != 0 &&
        _emailController.text.length != 0) {
      setState(() {
        conditions = true;
      });
    } else {
      setState(() {
        conditions = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: MediaQuery.of(context).size.height,
      padding: const EdgeInsets.only(top: 100),
      color: secondary,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
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
                child: Text(
                  'Full name:',
                  style: Theme.of(context).textTheme.headline6,
                ),
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
                child: Text(
                  'Email:',
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
              TextField(
                controller: _emailController,
                onChanged: _checkConditions(),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text(
                  'Password:',
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
              TextField(
                controller: _passwordController,
                onChanged: _checkConditions(),
                style: Theme.of(context).textTheme.headline6,
                decoration: InputDecoration(
                    filled: false,
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            obscureText = !obscureText;
                            if (obscureText) {
                              iconColor = secondary;
                            } else {
                              iconColor = black;
                            }
                          });
                        },
                        icon: Icon(Icons.remove_red_eye, color: iconColor))),
                obscureText: obscureText,
              ),
              CheckboxListTile(
                activeColor: black,
                title: Text(
                  'I ACCEPT TERMS AND CONDITIONS',
                  style: Theme.of(context).textTheme.headline6,
                ),
                value: checked,
                onChanged: (newValue) {
                  checked = newValue;
                  _checkConditions();
                },
                controlAffinity: ListTileControlAffinity.leading,
                contentPadding: const EdgeInsets.all(0.0),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                color: secondary,
                child: ElevatedButton(
                  child: Container(
                    height: 70,
                    child: Center(
                      child: Text(
                        "REGISTER",
                        style: Theme.of(context).textTheme.headline4,
                      ),
                    ),
                  ),
                  onPressed: () {
                    if (conditions) {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => HomePage(),
                        ),
                      );
                    }
                  },
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Text(
                "¿Already have an account?",
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    .copyWith(fontWeight: FontWeight.w700),
              ),
              ElevatedButton(
                child: Text(
                  "LOGIN",
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .headline4
                      .copyWith(decoration: TextDecoration.underline),
                ),
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => LoginPage()));
                },
              )
            ],
          ),
        ),
      ),
    ));
  }
}
