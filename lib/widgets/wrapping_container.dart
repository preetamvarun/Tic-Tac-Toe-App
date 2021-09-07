import 'package:flutter/material.dart';
import 'package:tic_tac_toe/constants.dart';
import 'package:tic_tac_toe/screens/game_screen.dart';

class WrappingContainer extends StatelessWidget{

  final onTap,containerNo; String letter = "";

  WrappingContainer({this.onTap,required this.letter, this.containerNo});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              color: kProfileContainerColor,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Text(
              chars[containerNo] == "" ? letter : chars[containerNo],
              style: TextStyle(
                fontFamily: chars[containerNo] == "X" ? 'Carter' : "Paytone",
                fontSize: 80.0,
                color: chars[containerNo] == "X" ? kLetterXColor : kLetterOColor,
              ),
              textAlign : TextAlign.center,
            ),
            height: 110.0,
            width: 110.0,
          ),
        ),
    );
  }
}