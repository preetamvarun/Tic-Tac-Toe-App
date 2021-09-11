import 'package:flutter/material.dart';
import 'package:tic_tac_toe/screens/welcome_screen.dart';
import 'constants.dart';

// TODO : FIX BUG WHEN THE USER CLICKS PLAY AGAIN
// TODO : MAKE UI LOOK MORE ATTRACTIVE
// TODO : USE FLEXIBLE WIDGET AND LAYOUT BUILDER TO MAKE UI MORE RESPONSIVE
// TODO : MAKE UI RESPONSIVE IN LANDSCAPE MODE ALSO
// TODO : MAKE THE USER TO SET HIS AVATAR AND A NAME

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
