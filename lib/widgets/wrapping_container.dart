import 'package:flutter/material.dart';
import 'package:tic_tac_toe/constants.dart';
import 'package:tic_tac_toe/Models/UiLogic.dart';
import 'package:tic_tac_toe/widgets/parent_column.dart';

class WrappingContainer extends StatelessWidget{

  final onTap,containerNo; String letter = "";
  WrappingContainer({this.onTap,required this.letter, this.containerNo});

  @override
  Widget build(BuildContext context) {

    UI.containerWidth = MediaQuery.of(context).size.width - 40;

    UI.bw = UI.containerWidth / 3;

    UI.wpWidth = UI.bw - 16;
    UI.wpHeight = UI.bw - 16;

    if(dropDownValue == "4 * 4 Grid"){
      UI.wpWidth = UI.wpWidth / 1.4;
      UI.wpHeight = UI.wpHeight / 1.4;
    }
    else if(dropDownValue == "5 * 5 Grid"){
      UI.wpWidth = UI.wpWidth / 1.7;
      UI.wpHeight = UI.wpHeight / 1.7;
    }

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
                fontSize: UI.wpHeight / 1.5,
                color: UI.chars[containerNo] == "X" ? kLetterXColor : kLetterOColor,
              ) : TextStyle(
                fontFamily: UI.chars[containerNo] == "X" ? 'Carter' : "Paytone",
                fontSize: UI.wpHeight / 1.5,
                color: UI.colorMap[containerNo] == kG ? Colors.white :
                UI.chars[containerNo] == "X" ? kLetterXColor : kLetterOColor
              ),
              textAlign : TextAlign.center,
            ),
            height: UI.wpHeight,
            width: UI.wpWidth,
          ),
        ),
    );
  }
}