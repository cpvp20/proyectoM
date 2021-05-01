import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyectoM/auth/bloc/auth_bloc.dart';
import 'package:proyectoM/colors.dart';
import 'package:flutter/material.dart';
import 'package:proyectoM/register/bloc/register_bloc.dart';
import 'package:proyectoM/register/register_content.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  RegisterBloc _registerBloc;
  bool _showLoading = false;

  void _emailRegister(String email, String password) {
    _registerBloc.add(RegisterWithEmailEvent(email: email, password: password));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            height: MediaQuery.of(context).size.height,
            padding: const EdgeInsets.only(top: 100),
            color: secondary,
            child: BlocProvider(
              create: (context) {
                _registerBloc = RegisterBloc();
                return _registerBloc;
              },
              child: BlocConsumer<RegisterBloc, RegisterState>(
                listener: (context, state) {
                  if (state is RegisterErrorState) {
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
                  } else if (state is RegisterLoadingState) {
                    _showLoading = !_showLoading;
                  } else if (state is RegisterSuccessState) {
                    BlocProvider.of<AuthBloc>(context)
                        .add(VerifyAuthenticationEvent());
                  }
                },
                builder: (context, state) {
                  return Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: RegisterContent(onRegister: _emailRegister),
                  );
                },
              ),
            )));
  }
}
