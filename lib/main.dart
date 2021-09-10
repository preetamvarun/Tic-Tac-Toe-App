import 'package:flutter/material.dart';
import 'package:tic_tac_toe/screens/welcome_screen.dart';
import 'constants.dart';


// TODO : Add SOUND WHEN USER TAPS ON THE WRAPPING CONTAINER.
// TODO : X sound should be different from O sound.
// TODO : play sound when the game has been won or drawn.

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
