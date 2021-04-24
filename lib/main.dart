import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'splash_screen.dart';
import 'auth/bloc/auth_bloc.dart';
import 'colors.dart';
import 'home/home_page.dart';
import 'login/login_page.dart';

void main() async {
  // inicializar firebase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    BlocProvider(
      create: (context) => AuthBloc()..add(VerifyAuthenticationEvent()),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final ThemeData _ = ThemeData.light();
    return MaterialApp(
      title: "GoodStuff",
      home: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          if (state is AlreadyAuthState) return HomePage();
          if (state is UnAuthState) return LoginPage();
          return SplashScreen();
        },
      ),
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
          headline2: TextStyle(fontSize: 16.0, color: dark),
          headline3: TextStyle(fontSize: 12.0, color: secondary),
          headline4: TextStyle(
              fontSize: 14, fontWeight: FontWeight.w800, color: secondary),
          headline5: TextStyle(fontSize: 30, color: dark),
          headline6: TextStyle(fontSize: 12, color: black),
          bodyText1: TextStyle(fontSize: 16, color: darkgrey),
          bodyText2: TextStyle(fontSize: 10, color: darkgrey),
        ),
      ),
    );
  }
}
