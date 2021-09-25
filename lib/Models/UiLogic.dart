import 'package:tic_tac_toe/Models/TicTacToeLogic.dart';
import 'package:tic_tac_toe/constants.dart';
import 'package:flutter/material.dart';

enum letter { cardX, cardO }

TicTacToe game = TicTacToe();

class UI{

  static late Color xCardColor,oCardColor,oTextColor,xTextColor;
  static late List<String>chars;
  static late String side,a,b,finalResult,ans,ansLetter,winningDirection,character;
  static late List<bool>isSelected;
  static late bool letterX,letterO;
  static late double deviceW;
  static var containerWidth,bw,mat,deviceHeight,wpHeight,wpWidth,colorMap = {},playerMap = {};
  static bool muteSound = true; 
  static String player1Name = "Player 1", player2Name = "Player 2",player1ImageName = "avatar-1", player2ImageName = "avatar-2";
  static int xWins = 0, oWins = 0, noOfWins = 2, noOfDraws = 2, draws = 0, maxWins = 25, maxDraws = 25;
  static int minWins = 1,minDraws = 1;

  static var avatar1Map = { 'avatar-1' : kSettingsBoxColor, 'avatar-2' : kSettingsBoxColor, 'avatar-3' : kSettingsBoxColor, 'avatar-4' : kSettingsBoxColor};
  static var avatar2Map = {'avatar-1' : kSettingsBoxColor, 'avatar-2' : kSettingsBoxColor, 'avatar-3' : kSettingsBoxColor, 'avatar-4' : kSettingsBoxColor};

  void remainingVars(){
    finalResult = "";character = ""; ans = ""; ansLetter = ""; winningDirection = "";
    isSelected = [false,false,false,false,false,false,false,false,false];
    chars = ["","","","","","","","",""]; mat = [["","",""],["","",""],["","",""]];
    colorMap={};
  }

  void setWinningVariables(){
    xWins = 0;oWins = 0; draws = 0;
  }

  void initializeColorMap() {for(int i = 0; i < 9; i++) colorMap[i] = "kProfileContainerColor";}

  void updateMatrix(int row,int col, String val){
    if(mat[row][col] == "") game.insertIntoCell(row, col, val);
  }

  void setRemainingVarsColorMap(){
    initializeColorMap();
    remainingVars();
  }

  void setCardO(){
    oCardColor = kProfileContainerColor; oTextColor = kLetterXColor;
    xCardColor = kGameScreenBackgroundColor; xTextColor = kLetterOColor;
  }

  void setCardX(){
    oCardColor = kGameScreenBackgroundColor; oTextColor = kLetterOColor;
    xCardColor = kProfileContainerColor; xTextColor = kLetterXColor;
  }

  void updateColor(letter selectedLetter){
    if(selectedLetter == letter.cardO){
      if(oCardColor == kGameScreenBackgroundColor && oTextColor == kLetterOColor) setCardO();
    }
    if(selectedLetter == letter.cardX){
      if(xCardColor == kGameScreenBackgroundColor && xTextColor == kLetterOColor) setCardX();
    }
  }

  void startLetter(String c){
    c == "X" ? letterO = false : letterO = true;
    letterX = !letterO;
    c == "X" ? playerMap['X'] = player1Name : playerMap['X'] = player2Name;
    c == "X" ? playerMap['O'] = player2Name : playerMap['O'] = player1Name;
  }

  void colorsAndSide(){
    xCardColor = kProfileContainerColor;oTextColor = kLetterOColor;
    oCardColor = kGameScreenBackgroundColor;xTextColor = kLetterXColor;
    side = "X";
  }

  void letterXTurn() {character = "X"; letterX = false; letterO = true;}
  void letterOTurn() {character = "O";letterX = true;letterO = false;}

  void setRow1() => colorMap[0] = colorMap[3] = colorMap[6] = kG;
  void setRow2() => colorMap[1] = colorMap[4] = colorMap[7] = kG;
  void setRow3() => colorMap[2] = colorMap[5] = colorMap[8] = kG;

  void setCol1() => colorMap[0] = colorMap[1] = colorMap[2] = kG;
  void setCol2() => colorMap[3] = colorMap[4] = colorMap[5] = kG;
  void setCol3() => colorMap[6] = colorMap[7] = colorMap[8] = kG;


  void setLeftDiagnol() => colorMap[0] = colorMap[4] = colorMap[8] = kG;

  void setRightDiagnol() => colorMap[2] = colorMap[4] = colorMap[6] = kG;


  bool checkR1() => mat[0][0] != "" && mat[0][0] == mat[0][1] && mat[0][1] == mat[0][2];
  bool checkR2() => mat[1][0] != "" && mat[1][0] == mat[1][1] && mat[1][1] == mat[1][2];
  bool checkR3() => mat[2][0] != "" && mat[2][0] == mat[2][1] && mat[2][1] == mat[2][2];

  bool checkC1() => mat[0][0] != "" && mat[0][0] == mat[1][0] && mat[1][0] == mat[2][0];
  bool checkC2() => mat[0][1] != "" && mat[0][1] == mat[1][1] && mat[1][1] == mat[2][1];
  bool checkC3() => mat[0][2] != "" && mat[0][2] == mat[1][2] && mat[1][2] == mat[2][2];

  bool checkLeftDiagnol() => mat[0][0] == mat[1][1] && mat[1][1] == mat[2][2];
  bool checkRightDiagnol() => mat[2][0] == mat[1][1] && mat[1][1] == mat[0][2];

}