import 'package:tic_tac_toe/constants.dart';
import 'package:flutter/material.dart';

enum letter { cardX, cardO }

class UI{

  static late Color xCardColor; static late Color oCardColor;
  static late Color xTextColor; static late Color oTextColor;
  static late String character; static late List<String>chars;
  static late String side,a,b,finalResult,ans,ansLetter,winningDirection;
  static late List<bool>isSelected;
  static late bool letterX,letterO; static late double deviceW;
  static var colorMap = {}; static var playerMap = {};
  static var containerWidth,bw,mat;

  void colorsAndSide(){
    xCardColor = kProfileContainerColor;oTextColor = kTextColor;
    oCardColor = kGameScreenBackgroundColor;xTextColor = Colors.white;
    side = "X";
  }

  void remainingVars(){
    finalResult = "";character = ""; ans = ""; ansLetter = ""; winningDirection = "";
    isSelected = [false,false,false,false,false,false,false,false,false];
    chars = ["","","","","","","","",""]; mat = [["","",""],["","",""],["","",""]];
    colorMap={};
  }

  void initializeColorMap() {for(int i = 0; i < 9; i++){colorMap[i] = "kProfileContainerColor";}}


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

  void startLetterX() {UI.letterO = true; UI.letterX = false;UI.playerMap['O'] = 'player 1'; UI.playerMap['X'] = 'player 2';}
  void startLetterO() {UI.letterX = true; UI.letterO = false; UI.playerMap['X'] = 'player 1'; UI.playerMap['O'] = 'player 2'; }

  void letterXTurn() {UI.character = "X"; UI.letterX = false; UI.letterO = true;}
  void letterOTurn() {UI.character = "O";UI.letterX = true;UI.letterO = false;}

  void setRow1() {UI.colorMap[0] = UI.colorMap[3] = UI.colorMap[6] = kG;}
  void setRow2() {UI.colorMap[1] = UI.colorMap[4] = UI.colorMap[7] = kG;}
  void setRow3() {UI.colorMap[2] = UI.colorMap[5] = UI.colorMap[8] = kG;}

  void setCol1() {UI.colorMap[0] = UI.colorMap[1] = UI.colorMap[2] = kG;}
  void setCol2() {UI.colorMap[3] = UI.colorMap[4] = UI.colorMap[5] = kG;}
  void setCol3() {UI.colorMap[6] = UI.colorMap[7] = UI.colorMap[8] = kG;}

  void setLeftDiagnol() {UI.colorMap[0] = UI.colorMap[4] = UI.colorMap[8] = kG;}

  void setRightDiagnol() {UI.colorMap[2] = UI.colorMap[4] = UI.colorMap[6] = kG;}

  bool checkR1(){if(mat[0][0] != "" && mat[0][0] == mat[0][1] && mat[0][1] == mat[0][2]){return true;}return false;}
  bool checkR2(){if(mat[1][0] != "" && mat[1][0] == mat[1][1] && mat[1][1] == mat[1][2]){return true;}return false;}
  bool checkR3(){if(mat[2][0] != "" && mat[2][0] == mat[2][1] && mat[2][1] == mat[2][2]){return true;}return false;}

  bool checkC1(){if(mat[0][0] != "" && mat[0][0] == mat[1][0] && mat[1][0] == mat[2][0]){return true;}return false;}
  bool checkC2(){if(mat[0][1] != "" && mat[0][1] == mat[1][1] && mat[1][1] == mat[2][1]){return true;}return false;}
  bool checkC3(){if(mat[0][2] != "" && mat[0][2] == mat[1][2] && mat[1][2] == mat[2][2]){return true;}return false;}

  bool checkLeftDiagnol(){if(mat[0][0] == mat[1][1] && mat[1][1] == mat[2][2]){return true;}return false;}
  bool checkRightDiagnol(){if(mat[2][0] == mat[1][1] && mat[1][1] == mat[0][2]){return true;}return false;}

}