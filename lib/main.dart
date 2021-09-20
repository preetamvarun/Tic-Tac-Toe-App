import 'package:flutter/material.dart';
import 'package:tic_tac_toe/screens/welcome_screen.dart';
import 'constants.dart';
import 'package:flutter/services.dart';

// TODO : COMPLETE THESE TODOS TO PUBLISH YOUR APP ON PLAY STORE AND APP STORE

// TODO : IMPLEMENT PLAYER VS COMPUTER.
// TODO : WHEN USER PLAYS PLAYER VS COMPUTER ADD THREE LEVELS. EASY,MEDIUM,HARD.

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
    return MaterialApp(
        home: Scaffold(
          body: WelcomeScreen(),
          backgroundColor: kBackgroundColor,
        ),
    );
  }
}
