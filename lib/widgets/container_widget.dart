import 'package:flutter/material.dart';
import 'package:tic_tac_toe/screens/game_screen.dart';

class ContainerWidget extends StatelessWidget {

  final color, text, textColor;

  ContainerWidget({this.color, this.text, this.textColor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(10.0,0.0, 10.0, 0.0),
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(28.0),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 160.0,
              color: textColor,
              fontWeight: FontWeight.w900,
              fontFamily: 'Carter',
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
