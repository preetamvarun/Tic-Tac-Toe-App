import 'package:tic_tac_toe/constants.dart';
import 'package:flutter/material.dart';

enum letter { cardX, cardO }
String side = "X";
List<bool>isSelected = [false,false,false,false,false,false,false,false,false];
List<String>chars = ["","","","","","","","",""];
String a = "Your Turn", b = "", finalResult = "";
late bool letterX,letterO;
late double deviceW;
var colorMap = {};


class UI{

  static Color xCardColor = kProfileContainerColor; static Color oCardColor = kGameScreenBackgroundColor;
  static Color xTextColor = Colors.white; static Color oTextColor = kTextColor;

  static String character = "";

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