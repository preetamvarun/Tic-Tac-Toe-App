import 'package:flutter/material.dart';
import 'package:tic_tac_toe/constants.dart';

class WrappingContainer extends StatelessWidget {

  final letter;

  WrappingContainer({this.letter});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: kProfileContainerColor,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Text(
          letter == null ? '' : letter,
          style: TextStyle(
            fontFamily: 'Carter',
            fontSize: 80.0,
            color: letter == "X" ? kLetterXColor : kLetterOColor,
          ),
          textAlign : TextAlign.center,
        ),
        height: 110.0,
        width: 110.0,
      ),
    );
  }
}


// #EB1751 - red
// #FFD032 - yellow