import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyectoM/auth/bloc/auth_bloc.dart';
import '../colors.dart';
import 'bloc/login_bloc.dart';
import 'form_body.dart';

class LoginForm extends StatefulWidget {
  LoginForm({Key key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  LoginBloc _loginBloc;
  bool _showLoading = false;

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

  void _anonymousLogIn(bool _) {
    print("anonimo");
    _loginBloc.add(LoginAnonymousEvent());
  }

  void _googleLogIn(bool _) {
    // invocar al login de firebase con el bloc
    // recodar configurar pantallad Oauth en google Cloud
    print("google");
    _loginBloc.add(LoginWithGoogleEvent());
  }

  void _emailLogIn(bool _) {
    print("email");
    _loginBloc.add(LoginWithEmailEvent(email: "email", password: "1213"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        padding: const EdgeInsets.only(top: 100),
        color: secondary,
        child: BlocProvider(
          create: (context) {
            _loginBloc = LoginBloc();
            return _loginBloc;
          },
          child: BlocConsumer<LoginBloc, LoginState>(
            listener: (context, state) {
              if (state is LoginErrorState) {
                _showLoading = false;
                showDialog(
                  context: context,
                  builder: (_) {
                    return AlertDialog(
                      content: Text("${state.error}"),
                      actions: [
                        MaterialButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text("OK"),
                        )
                      ],
                    );
                  },
                );
              } else if (state is LoginLoadingState) {
                _showLoading = !_showLoading;
              } else if (state is LoginSuccessState) {
                BlocProvider.of<AuthBloc>(context)
                    .add(VerifyAuthenticationEvent());
              }
            },
            builder: (context, state) {
              return Padding(
                padding: const EdgeInsets.all(20.0),
                child: FormBody(
                  onGoogleLoginTap: _googleLogIn,
                  onAnonymousLoginTap: _anonymousLogIn,
                  onEmailLoginTap: _emailLogIn,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
