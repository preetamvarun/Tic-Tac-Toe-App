import 'package:tic_tac_toe/constants.dart';
import 'package:flutter/material.dart';
import 'package:tic_tac_toe/Models/TicTacToeLogic.dart';

TicTacToe game = TicTacToe();


bool isTheGameRestarted = false;

enum letter { cardX, cardO }
late String side,a,b,finalResult,ans,ansLetter,winningDirection;
late List<bool>isSelected;
late List<String>chars;
late bool letterX,letterO;
late double deviceW;
var colorMap = {};
var containerWidth;
var bw;
var mat;

class UI{

  static late Color xCardColor; static late Color oCardColor;
  static late Color xTextColor; static late Color oTextColor;

  static late String character;

  void initVariables(){
    side = "X";
    isSelected = [false,false,false,false,false,false,false,false,false];
    chars = ["","","","","","","","",""];
    a = "Your Turn"; b = ""; finalResult = "";
    ans = ""; ansLetter = ""; winningDirection = "";
    colorMap={};
    xCardColor = kProfileContainerColor;
    oCardColor = kGameScreenBackgroundColor;
    xTextColor = Colors.white;
    oTextColor = kTextColor;
    character = "";
    mat = [["","",""],["","",""],["","",""]];
  }

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

  void initializeColorMap(){
    for(int i = 0; i < 9; i++){
      colorMap[i] = "kProfileContainerColor";
    }
  }

}