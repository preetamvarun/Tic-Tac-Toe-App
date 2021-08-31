import 'package:flutter/material.dart';
import 'package:tic_tac_toe/constants.dart';

class WinningScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kGameScreenBackgroundColor,
      body: Text("You Won"),
    );
  }
}
