import 'package:tic_tac_toe/Models/TicTacToeLogic.dart';
import 'package:tic_tac_toe/constants.dart';
import 'package:flutter/material.dart';

enum letter { cardX, cardO }

bool isGameRestarted = false;

TicTacToe game = TicTacToe();

class UI{

  static late Color xCardColor; static late Color oCardColor;
  static late Color xTextColor; static late Color oTextColor;
  static late String character; static late List<String>chars;
  static late String side,a,b,finalResult,ans,ansLetter,winningDirection;
  static late List<bool>isSelected; static var colorMap = {},playerMap = {};
  static late bool letterX,letterO; static late double deviceW;
  static var containerWidth,bw,mat,deviceHeight,wpHeight,wpWidth;
  static bool muteSound = false;

  void remainingVars(){
    finalResult = "";character = ""; ans = ""; ansLetter = ""; winningDirection = "";
    isSelected = [false,false,false,false,false,false,false,false,false];
    chars = ["","","","","","","","",""]; mat = [["","",""],["","",""],["","",""]];
    colorMap={};
  }

  void initializeColorMap() {for(int i = 0; i < 9; i++){colorMap[i] = "kProfileContainerColor";}}

  void updateMatrix(int row, int col, String val) {game.insertIntoCell(row, col, val);}


  void updateColor(letter selectedLetter){

    if(selectedLetter == letter.cardO){
      if(oCardColor == kGameScreenBackgroundColor && oTextColor == kLetterOColor){
        oCardColor = kProfileContainerColor; oTextColor = kLetterXColor;
        xCardColor = kGameScreenBackgroundColor; xTextColor = kLetterOColor;
      }
    }
    if(selectedLetter == letter.cardX){
      if(xCardColor == kGameScreenBackgroundColor && xTextColor == kLetterOColor){
        oCardColor = kGameScreenBackgroundColor; oTextColor = kLetterOColor;
        xCardColor = kProfileContainerColor; xTextColor = kLetterXColor;
      }
    }
  }

  void startLetterX() {letterO = true; letterX = false;playerMap['O'] = 'player 1'; playerMap['X'] = 'player 2';}
  void startLetterO() {letterX = true; letterO = false;playerMap['X'] = 'player 1'; playerMap['O'] = 'player 2'; }

  void colorsAndSide(){
    xCardColor = kProfileContainerColor;oTextColor = kLetterOColor;
    oCardColor = kGameScreenBackgroundColor;xTextColor = kLetterXColor;
    isGameRestarted == false ? side = "X" : side = side == "X" ? "O" : "X";
    if(isGameRestarted){ side == "X" ? startLetterO() : startLetterX(); }
  }

  void letterXTurn() {character = "X"; letterX = false; letterO = true;}
  void letterOTurn() {character = "O";letterX = true;letterO = false;}

  void setRow1() {colorMap[0] = colorMap[3] = colorMap[6] = kG;}
  void setRow2() {colorMap[1] = colorMap[4] = colorMap[7] = kG;}
  void setRow3() {colorMap[2] = colorMap[5] = colorMap[8] = kG;}

  void setCol1() {colorMap[0] = colorMap[1] = colorMap[2] = kG;}
  void setCol2() {colorMap[3] = colorMap[4] = colorMap[5] = kG;}
  void setCol3() {colorMap[6] = colorMap[7] = colorMap[8] = kG;}

  void setLeftDiagnol() {colorMap[0] = colorMap[4] = colorMap[8] = kG;}

  void setRightDiagnol() {colorMap[2] = colorMap[4] = colorMap[6] = kG;}

  bool checkR1(){if(mat[0][0] != "" && mat[0][0] == mat[0][1] && mat[0][1] == mat[0][2]){return true;}return false;}
  bool checkR2(){if(mat[1][0] != "" && mat[1][0] == mat[1][1] && mat[1][1] == mat[1][2]){return true;}return false;}
  bool checkR3(){if(mat[2][0] != "" && mat[2][0] == mat[2][1] && mat[2][1] == mat[2][2]){return true;}return false;}

  bool checkC1(){if(mat[0][0] != "" && mat[0][0] == mat[1][0] && mat[1][0] == mat[2][0]){return true;}return false;}
  bool checkC2(){if(mat[0][1] != "" && mat[0][1] == mat[1][1] && mat[1][1] == mat[2][1]){return true;}return false;}
  bool checkC3(){if(mat[0][2] != "" && mat[0][2] == mat[1][2] && mat[1][2] == mat[2][2]){return true;}return false;}

  bool checkLeftDiagnol(){if(mat[0][0] == mat[1][1] && mat[1][1] == mat[2][2]){return true;}return false;}
  bool checkRightDiagnol(){if(mat[2][0] == mat[1][1] && mat[1][1] == mat[0][2]){return true;}return false;}

}