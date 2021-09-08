import 'package:tic_tac_toe/constants.dart';
import 'package:flutter/material.dart';

enum letter { cardX, cardO }
String side = "X";

class UI{

  Color xCardColor = kProfileContainerColor, oCardColor = kGameScreenBackgroundColor;
  Color xTextColor = Colors.white, oTextColor = kTextColor;

  void updateColor(letter selectedLetter){
    if(selectedLetter == letter.cardO){
      if(oCardColor == kGameScreenBackgroundColor && oTextColor == kTextColor){
        oCardColor = kProfileContainerColor; oTextColor = Colors.white;
        xCardColor = kGameScreenBackgroundColor; xTextColor = kTextColor;
      }
    }
    if(selectedLetter == letter.cardX){
      if(xCardColor == kGameScreenBackgroundColor && xTextColor == kTextColor){
        oCardColor = kGameScreenBackgroundColor; oTextColor = kTextColor;
        xCardColor = kProfileContainerColor; xTextColor = Colors.white;
      }
    }
  }

}