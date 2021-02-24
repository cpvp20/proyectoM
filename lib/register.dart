import 'package:estructura_practica_1/colors.dart';
import 'package:flutter/material.dart';
import 'home/home.dart';
import 'login.dart';

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
  Color iconColor = Colors.grey;

  bool obscureText = true;

  Function _checkConditions() {
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
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [blue, black],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter),
      ),
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
                child: Text('Nombre completo:',
                    style: TextStyle(
                        color: white,
                        fontFamily: 'AkzidenzGrotesk BQ Medium',
                        fontSize: 12)),
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
                child: Text('Email:',
                    style: TextStyle(
                        color: white,
                        fontFamily: 'AkzidenzGrotesk BQ Medium',
                        fontSize: 12)),
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
                child: Text('Password:',
                    style: TextStyle(
                        color: white,
                        fontFamily: 'AkzidenzGrotesk BQ Medium',
                        fontSize: 12)),
              ),
              TextField(
                controller: _passwordController,
                onChanged: _checkConditions(),
                style: TextStyle(
                    color: white, fontFamily: 'AkzidenzGrotesk BQ Medium'),
                decoration: InputDecoration(
                    filled: false,
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            obscureText = !obscureText;
                            if (obscureText) {
                              iconColor = Colors.grey;
                            } else {
                              iconColor = white;
                            }
                          });
                        },
                        icon: Icon(Icons.remove_red_eye, color: iconColor))),
                obscureText: obscureText,
              ),
              CheckboxListTile(
                title: Text(
                  'ACEPTO LOS TÉRMINOS Y CONDICIONES DE USO',
                  style: TextStyle(color: Colors.grey[200], fontSize: 10),
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
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  gradient: LinearGradient(
                      colors: [darkgrey, grey],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter),
                ),
                child: GestureDetector(
                  child: Container(
                    height: 70,
                    child: Center(
                      child: Text(
                        "REGISTRATE",
                        style: TextStyle(
                            fontSize: 14,
                            color: black,
                            fontFamily: 'AkzidenzGrotesk BQ Medium',
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                  onTap: () {
                    if (conditions) {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => Home(
                            title: 'Inicio',
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
              Text(
                "¿Ya tienes una cuenta?",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: white,
                    fontFamily: 'AkzidenzGrotesk BQ Medium',
                    fontSize: 12,
                    fontWeight: FontWeight.w700),
              ),
              GestureDetector(
                child: Text(
                  "INGRESA",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: white,
                      fontFamily: 'AkzidenzGrotesk BQ Medium',
                      fontSize: 12,
                      decoration: TextDecoration.underline,
                      fontWeight: FontWeight.w700),
                ),
                onTap: () {
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
