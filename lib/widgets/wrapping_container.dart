import 'package:flutter/material.dart';
import 'package:tic_tac_toe/constants.dart';
import 'package:tic_tac_toe/Models/UiLogic.dart';

var containerWidth;

var bw;

class WrappingContainer extends StatelessWidget{

  final onTap,containerNo; String letter = "";

  WrappingContainer({this.onTap,required this.letter, this.containerNo});

  @override
  Widget build(BuildContext context) {

    containerWidth = MediaQuery.of(context).size.width - 40;

    bw = containerWidth / 3;

    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.all(8.0),
          child: Container(
            decoration: finalResult != "Win" ? BoxDecoration(
              color: kProfileContainerColor,
              borderRadius: BorderRadius.circular(10.0),
            ) : BoxDecoration(
              color: colorMap[containerNo] == 'GreenColor' ? Colors.lightGreen : kProfileContainerColor,
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
            height: bw - 16,
            width: bw - 16,
          ),
        ),
    );
  }
}