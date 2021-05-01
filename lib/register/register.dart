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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            height: MediaQuery.of(context).size.height,
            padding: const EdgeInsets.only(top: 100),
            color: secondary,
            child: RegisterContent()));
  }
}
