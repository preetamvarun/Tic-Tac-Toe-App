import 'package:flutter/material.dart';
import 'package:tic_tac_toe/screens/welcome_screen.dart';
import 'constants.dart';

// TODO : COMPLETE THESE TODOS TO PUBLISH YOUR APP ON PLAY STORE AND APP STORE

// TODO : USE FLEXIBLE WIDGET AND LAYOUT BUILDER TO MAKE UI MORE RESPONSIVE
// TODO : MAKE UI RESPONSIVE IN LANDSCAPE MODE ALSO OR RESTRICT THE APP FOR NORMAL MODE
// TODO : MAKE THE USER TO SET HIS AVATAR AND A NAME
// TODO : TOGGLE THEMES
// TODO : ALLOW PLAYERS TO PLAY ONLINE
// TODO : ADD BACKGROUND MUSIC
// TODO : IMPLEMENT PLAYER VS COMPUTER
// TODO : WHEN USER PLAYS PLAYER VS COMPUTER ADD THREE LEVELS. EASY,MEDIUM,HARD.

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          body: WelcomeScreen(),
          backgroundColor: kBackgroundColor,
        ),
    );
  }
}
