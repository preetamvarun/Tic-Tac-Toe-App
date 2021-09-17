import 'package:flutter/material.dart';
import 'package:tic_tac_toe/Models/TicTacToeLogic.dart';
import 'package:tic_tac_toe/screens/winning_screen.dart';
import 'package:tic_tac_toe/widgets/profile_container_widget.dart';
import 'package:tic_tac_toe/widgets/wrapping_container.dart';
import 'package:tic_tac_toe/constants.dart';
import 'dart:async';
import 'package:tic_tac_toe/Models/UiLogic.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:tic_tac_toe/widgets/parent_column.dart';

UI ui = UI();

TicTacToe game = TicTacToe();

class GameScreen extends StatefulWidget{

  final chosenLetter;
  GameScreen({this.chosenLetter});

  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {

  @override
  void initState() {
    if(widget.chosenLetter != null){ widget.chosenLetter == "O"? ui.startLetterO() : ui.startLetterX(); print(UI.playerMap);}
    ui.initializeColorMap();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    void checkRows() {setState(() {if(ui.checkR1()) ui.setRow1(); if(ui.checkR2()) ui.setRow2(); if(ui.checkR3()) ui.setRow3();});}
    void checkColumns() {setState(() {if(ui.checkC1()) ui.setCol1(); if(ui.checkC2()) ui.setCol2(); if(ui.checkC3()) ui.setCol3();});}
    void checkLeftDiagnol()  {setState(() {if(ui.checkLeftDiagnol()) ui.setLeftDiagnol();});}
    void checkRightDiagnol() {setState(() {if(ui.checkRightDiagnol()) ui.setRightDiagnol();});}

    void changeWinningLetterColors(String ansLetter){
      UI.winningDirection == "checkRows" ? checkRows() : UI.winningDirection == "checkColumns" ? checkColumns()
      : UI.winningDirection == "checkLeftDiagnol" ? checkLeftDiagnol() : checkRightDiagnol();
      Future.delayed(Duration(milliseconds: 1000), (){
        Navigator.push( context, MaterialPageRoute( builder: (context) => WinningScreen(winningLetter: UI.ansLetter,)), ).then((value) => setState(() {}));
      });
    }

    void fun(int r,int c, int containerNo){

      print("entered into fun function");

      if(UI.finalResult != "Win") {
        UI.isSelected[containerNo] = true;
        if (UI.letterX && UI.mat[r][c] == "") { setState(() { ui.letterXTurn(); }); }
        else if (UI.letterO && UI.mat[r][c] == "") { setState(() {ui.letterOTurn(); }); }
        UI.chars[containerNo] = UI.character;
        ui.updateMatrix(r, c, UI.character);
        if (game.checkWinningCondition() == "Win") {
          if(UI.muteSound == false) {AudioCache().play('winner.wav');}
          UI.finalResult = "Win";
          changeWinningLetterColors(UI.ansLetter);
        }
        else if (game.checkDrawCondition() == "Draw") {
          if(UI.muteSound == false) {AudioCache().play('draw.mpeg');}
          UI.finalResult = "Draw";
          Navigator.push( context, MaterialPageRoute( builder: (context) => WinningScreen()), ).then((value) => setState(() {}));
        }
        if(UI.muteSound == false)  AudioCache().play(UI.character == "X" ? 'note1.wav' : 'note2.wav');
      }
    }

    
    UI.deviceW = MediaQuery.of(context).size.width;
    
    return Scaffold(
      backgroundColor: kGameScreenBackgroundColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 0.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 25.0),
                    child: ProfileContainer(profileName: UI.player1Name, letter : UI.side == "X" ? "X" : "O" ),
                  ),
                  ProfileContainer(profileName: UI.player2Name, letter : UI.side == "X" ? "O" : "X"),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Container(
                width: UI.deviceW - 40,
                height: UI.deviceW - 40,
                decoration: BoxDecoration(
                  color: kGameScreenContainerColor,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Wrap(
                  direction: Axis.vertical,
                  alignment: WrapAlignment.center,
                  runAlignment: WrapAlignment.center,
                  children: [
                    dropDownValue == "3 * 3 Grid" ? WrappingContainer(onTap: (){fun(0,0,0);}, letter: UI.isSelected[0] ?  UI.character: "",containerNo: 0,) : SizedBox.shrink(),
                    dropDownValue == "3 * 3 Grid" ? WrappingContainer(onTap: (){fun(1,0,1);}, letter: UI.isSelected[1] ?  UI.character: "",containerNo: 1,) : SizedBox.shrink(),
                    dropDownValue == "3 * 3 Grid" ? WrappingContainer(onTap: (){fun(2,0,2);}, letter: UI.isSelected[2] ?  UI.character: "",containerNo: 2,) : SizedBox.shrink(),
                    dropDownValue == "3 * 3 Grid" ? WrappingContainer(onTap: (){fun(0,1,3);}, letter: UI.isSelected[3] ?  UI.character: "",containerNo: 3,) : SizedBox.shrink(),
                    dropDownValue == "3 * 3 Grid" ? WrappingContainer(onTap: (){fun(1,1,4);}, letter: UI.isSelected[4] ?  UI.character: "",containerNo: 4,) : SizedBox.shrink(),
                    dropDownValue == "3 * 3 Grid" ? WrappingContainer(onTap: (){fun(2,1,5);}, letter: UI.isSelected[5] ?  UI.character: "",containerNo: 5,) : SizedBox.shrink(),
                    dropDownValue == "3 * 3 Grid" ? WrappingContainer(onTap: (){fun(0,2,6);}, letter: UI.isSelected[6] ?  UI.character: "",containerNo: 6,) : SizedBox.shrink(),
                    dropDownValue == "3 * 3 Grid" ? WrappingContainer(onTap: (){fun(1,2,7);}, letter: UI.isSelected[7] ?  UI.character: "",containerNo: 7,) : SizedBox.shrink(),
                    dropDownValue == "3 * 3 Grid" ? WrappingContainer(onTap: (){fun(2,2,8);}, letter: UI.isSelected[8] ?  UI.character: "",containerNo: 8,) : SizedBox.shrink(),
                    dropDownValue == "4 * 4 Grid" ? WrappingContainer(onTap: (){fun(0,0,0);}, letter: UI.isSelected[0] ?  UI.character: "",containerNo: 0,) : SizedBox.shrink(),
                    dropDownValue == "4 * 4 Grid" ? WrappingContainer(onTap: (){fun(1,0,1);}, letter: UI.isSelected[1] ?  UI.character: "",containerNo: 1,) : SizedBox.shrink(),
                    dropDownValue == "4 * 4 Grid" ? WrappingContainer(onTap: (){fun(2,0,2);}, letter: UI.isSelected[2] ?  UI.character: "",containerNo: 2,) : SizedBox.shrink(),
                    dropDownValue == "4 * 4 Grid" ? WrappingContainer(onTap: (){fun(3,0,3);}, letter: UI.isSelected[3] ?  UI.character: "",containerNo: 3,) : SizedBox.shrink(),
                    dropDownValue == "4 * 4 Grid" ? WrappingContainer(onTap: (){fun(0,1,4);}, letter: UI.isSelected[4] ?  UI.character: "",containerNo: 4,) : SizedBox.shrink(),
                    dropDownValue == "4 * 4 Grid" ? WrappingContainer(onTap: (){fun(1,1,5);}, letter: UI.isSelected[5] ?  UI.character: "",containerNo: 5,) : SizedBox.shrink(),
                    dropDownValue == "4 * 4 Grid" ? WrappingContainer(onTap: (){fun(2,1,6);}, letter: UI.isSelected[6] ?  UI.character: "",containerNo: 6,) : SizedBox.shrink(),
                    dropDownValue == "4 * 4 Grid" ? WrappingContainer(onTap: (){fun(3,1,7);}, letter: UI.isSelected[7] ?  UI.character: "",containerNo: 7,) : SizedBox.shrink(),
                    dropDownValue == "4 * 4 Grid" ? WrappingContainer(onTap: (){fun(0,2,8);}, letter: UI.isSelected[8] ?  UI.character: "",containerNo: 8,) : SizedBox.shrink(),
                    dropDownValue == "4 * 4 Grid" ? WrappingContainer(onTap: (){fun(1,2,9);}, letter: UI.isSelected[9] ?  UI.character: "",containerNo: 9,) : SizedBox.shrink(),
                    dropDownValue == "4 * 4 Grid" ? WrappingContainer(onTap: (){fun(2,2,10);}, letter: UI.isSelected[10] ?  UI.character: "",containerNo: 10,) : SizedBox.shrink(),
                    dropDownValue == "4 * 4 Grid" ? WrappingContainer(onTap: (){fun(3,2,11);}, letter: UI.isSelected[11] ?  UI.character: "",containerNo: 11,) : SizedBox.shrink(),
                    dropDownValue == "4 * 4 Grid" ? WrappingContainer(onTap: (){fun(0,3,12);}, letter: UI.isSelected[12] ?  UI.character: "",containerNo: 12,) : SizedBox.shrink(),
                    dropDownValue == "4 * 4 Grid" ? WrappingContainer(onTap: (){fun(1,3,13);}, letter: UI.isSelected[13] ?  UI.character: "",containerNo: 13,) : SizedBox.shrink(),
                    dropDownValue == "4 * 4 Grid" ? WrappingContainer(onTap: (){fun(2,3,14);}, letter: UI.isSelected[14] ?  UI.character: "",containerNo: 14,) : SizedBox.shrink(),
                    dropDownValue == "4 * 4 Grid" ? WrappingContainer(onTap: (){fun(3,3,15);}, letter: UI.isSelected[15] ?  UI.character: "",containerNo: 15,) : SizedBox.shrink(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// dropDownValue == "5 * 5 Grid" ? WrappingContainer(onTap: (){fun(2,2,16);}, letter: UI.isSelected[16] ?  UI.character: "",containerNo: 16,) : SizedBox.shrink(),
// dropDownValue == "5 * 5 Grid" ? WrappingContainer(onTap: (){fun(2,2,17);}, letter: UI.isSelected[17] ?  UI.character: "",containerNo: 17,) : SizedBox.shrink(),
// dropDownValue == "5 * 5 Grid" ? WrappingContainer(onTap: (){fun(2,2,18);}, letter: UI.isSelected[18] ?  UI.character: "",containerNo: 18,) : SizedBox.shrink(),
// dropDownValue == "5 * 5 Grid" ? WrappingContainer(onTap: (){fun(2,2,19);}, letter: UI.isSelected[19] ?  UI.character: "",containerNo: 19,) : SizedBox.shrink(),
// dropDownValue == "5 * 5 Grid" ? WrappingContainer(onTap: (){fun(2,2,20);}, letter: UI.isSelected[20] ?  UI.character: "",containerNo: 20,) : SizedBox.shrink(),
// dropDownValue == "5 * 5 Grid" ? WrappingContainer(onTap: (){fun(2,2,21);}, letter: UI.isSelected[21] ?  UI.character: "",containerNo: 21,) : SizedBox.shrink(),
// dropDownValue == "5 * 5 Grid" ? WrappingContainer(onTap: (){fun(2,2,22);}, letter: UI.isSelected[22] ?  UI.character: "",containerNo: 22,) : SizedBox.shrink(),
// dropDownValue == "5 * 5 Grid" ? WrappingContainer(onTap: (){fun(2,2,23);}, letter: UI.isSelected[23] ?  UI.character: "",containerNo: 23,) : SizedBox.shrink(),
// dropDownValue == "5 * 5 Grid" ? WrappingContainer(onTap: (){fun(2,2,24);}, letter: UI.isSelected[24] ?  UI.character: "",containerNo: 24,) : SizedBox.shrink(),