import 'package:flutter/material.dart';
import 'package:tic_tac_toe/constants.dart';


class WrappingContainer extends StatelessWidget{

  final rowNo, colNo, letter, onTap;

  WrappingContainer({this.onTap,this.letter,this.rowNo,this.colNo});

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
              letter,
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
        ),
    );
  }
}