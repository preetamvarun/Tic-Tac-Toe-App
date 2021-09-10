import 'package:flutter/material.dart';
import 'package:tic_tac_toe/screens/welcome_screen.dart';
import 'constants.dart';

// TODO : play sound when the game has been drawn.
// TODO : MODIFY WINNING SCREEN
// TODO : FIX BUG WHEN THE USER CLICKS PLAY AGAIN
// TODO : USE FLEXIBLE WIDGET AND LAYOUT BUILDER TO MAKE UI MORE RESPONSIVE

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
