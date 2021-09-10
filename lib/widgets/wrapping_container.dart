import 'package:flutter/material.dart';
import 'package:tic_tac_toe/constants.dart';
import 'package:tic_tac_toe/Models/UiLogic.dart';

class WrappingContainer extends StatelessWidget{

  final onTap,containerNo; String letter = "";
  WrappingContainer({this.onTap,required this.letter, this.containerNo});

  @override
  Widget build(BuildContext context) {

    UI.containerWidth = MediaQuery.of(context).size.width - 40;
    UI.bw = UI.containerWidth / 3;

    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.all(8.0),
          child: Container(
            decoration: UI.finalResult != "Win" ? BoxDecoration(
              color: kProfileContainerColor,
              borderRadius: BorderRadius.circular(10.0),
            ) : BoxDecoration(
              color: UI.colorMap[containerNo] == kG ? Colors.lightGreen : kProfileContainerColor,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Text(
              UI.chars[containerNo] == "" ? letter : UI.chars[containerNo],
              style: UI.finalResult != "Win" ? TextStyle(
                fontFamily: UI.chars[containerNo] == "X" ? 'Carter' : "Paytone",
                fontSize: 80.0,
                color: UI.chars[containerNo] == "X" ? kLetterXColor : kLetterOColor,
              ) : TextStyle(
                fontFamily: UI.chars[containerNo] == "X" ? 'Carter' : "Paytone",
                fontSize: 80.0,
                color: UI.colorMap[containerNo] == kG ? Colors.white :
                UI.chars[containerNo] == "X" ? kLetterXColor : kLetterOColor
              ),
              textAlign : TextAlign.center,
            ),
            height: UI.bw - 16,
            width: UI.bw - 16,
          ),
        ),
    );
  }
}