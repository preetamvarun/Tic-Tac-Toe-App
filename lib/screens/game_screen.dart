import 'package:flutter/material.dart';
import 'package:tic_tac_toe/Models/TicTacToeLogic.dart';
import 'package:tic_tac_toe/screens/winning_screen.dart';
import 'package:tic_tac_toe/widgets/profile_container_widget.dart';
import 'package:tic_tac_toe/widgets/wrapping_container.dart';
import 'package:tic_tac_toe/constants.dart';
import 'dart:async';
import 'package:tic_tac_toe/Models/UiLogic.dart';
import 'package:audioplayers/audioplayers.dart';

UI ui = UI();
TicTacToe game = TicTacToe();

class GameScreen extends StatefulWidget{

  String chosenLetter;
  GameScreen({required this.chosenLetter});

  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {

  @override
  void initState() {
    widget.chosenLetter == "O"? ui.startLetterO() : ui.startLetterX();
    ui.initializeColorMap();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    void checkRows() {setState(() {if(ui.checkR1()) ui.setRow1(); if(ui.checkR2()) ui.setRow2(); if(ui.checkR3()) ui.setRow3();});}
    void checkColumns() {setState(() {if(ui.checkC1()) ui.setCol1(); if(ui.checkC2()) ui.setCol2(); if(ui.checkC3()) ui.setCol3();});}
    void checkLeftDiagnol()  {setState(() {if(ui.checkLeftDiagnol()) ui.setLeftDiagnol();});}
    void checkRightDiagnol() {setState(() {if(ui.checkRightDiagnol()) ui.setRightDiagnol();});}

    void changeWinningLetterColors(String ansLetter) {
      UI.winningDirection == "checkRows" ? checkRows() : UI.winningDirection ==
          "checkColumns" ? checkColumns()
          : UI.winningDirection == "checkLeftDiagnol"
          ? checkLeftDiagnol()  : checkRightDiagnol();

      if(ansLetter == "X"){
        UI.xWins++;
        Future.delayed(Duration(milliseconds: 1000),(){
          if(UI.xWins == UI.noOfWins){
            Navigator.push(context, MaterialPageRoute(builder: (context) => WinningScreen(winningLetter: UI.ansLetter,)),).then((value) => setState(() {}));
          }
          else{
            ui.remainingVars();
            ui.initializeColorMap();
            setState(() {
              UI.letterO = true;
            });
          }
        });
      }
      else if(ansLetter == "O"){
        UI.oWins++;
        Future.delayed(Duration(milliseconds: 1000),(){
          if(UI.oWins == UI.noOfWins){
            Navigator.push(context, MaterialPageRoute(builder: (context) => WinningScreen(winningLetter: UI.ansLetter,)),).then((value) => setState(() {}));
          }
          else{
            ui.remainingVars();
            ui.initializeColorMap();
            setState(() {
              UI.letterX = true;
            });
          }
        });
      }
    }

    void fun(int r,int c, int containerNo){

      if(UI.finalResult != "Win") {

        UI.isSelected[containerNo] = true;
        if (UI.letterX && UI.mat[r][c] == "") { ui.letterXTurn(); }
        else if (UI.letterO && UI.mat[r][c] == "") { ui.letterOTurn(); }
        if(UI.chars[containerNo] == "") setState(() {UI.chars[containerNo] = UI.character;});
        ui.updateMatrix(r, c, UI.character);
        if (game.checkWinningCondition() == "Win") {
          if(UI.muteSound == false) {AudioCache().play('winner.wav');}
          UI.finalResult = "Win";
          changeWinningLetterColors(UI.ansLetter);
        }
        else if (game.checkDrawCondition() == "Draw") {
          UI.draws++;
          if(UI.muteSound == false) {AudioCache().play('draw.mpeg');}
          UI.finalResult = "Draw";
          if(UI.draws == UI.noOfDraws){
            Future.delayed(Duration(milliseconds: 1000),(){Navigator.push( context, MaterialPageRoute( builder: (context) => WinningScreen()), ).then((value) => setState(() {}));});
          }
          else{
            Future.delayed(Duration(milliseconds: 1000),(){
              if(UI.ansLetter == "X"){
                ui.remainingVars();
                ui.initializeColorMap();
                setState(() {
                  UI.letterO = true;
                });
              }
              if(UI.ansLetter == "O"){
                ui.remainingVars();
                ui.initializeColorMap();
                setState(() {
                  UI.letterX = true;
                });
              }
            });
          }
        }
        if(UI.muteSound == false)  AudioCache().play(UI.character == "X" ? 'note1.wav' : 'note2.wav');

      }


    }

    
    UI.deviceW = MediaQuery.of(context).size.width;
    
    return Scaffold(
      backgroundColor: kGameScreenBackgroundColor,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ProfileContainer(profileName: UI.player1Name, letter : UI.side == "X" ? "X" : "O" ,imageName: UI.player1ImageName),
                  Column(
                    children: [
                      Text("D", style: kScoreTextStyle,),
                      Text(":", style: kScoreTextStyle,),
                      Text(UI.draws.toString(), style: kScoreTextStyle,),
                    ],
                  ),
                  ProfileContainer(profileName: UI.player2Name, letter : UI.side == "X" ? "O" : "X",imageName: UI.player2ImageName),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
              child: Container(
                width: UI.deviceW - 40,
                height: UI.deviceW - 40,
                decoration: BoxDecoration(
                  color: kGameScreenContainerColor,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Wrap(
                  direction: Axis.vertical,
                  children: [
                    WrappingContainer(onTap: (){fun(0,0,0);}, letter: UI.isSelected[0] ?  UI.character: "",containerNo: 0,),
                    WrappingContainer(onTap: (){fun(1,0,1);}, letter: UI.isSelected[1] ?  UI.character: "",containerNo: 1,),
                    WrappingContainer(onTap: (){fun(2,0,2);}, letter: UI.isSelected[2] ?  UI.character: "",containerNo: 2,),
                    WrappingContainer(onTap: (){fun(0,1,3);}, letter: UI.isSelected[3] ?  UI.character: "",containerNo: 3,),
                    WrappingContainer(onTap: (){fun(1,1,4);}, letter: UI.isSelected[4] ?  UI.character: "",containerNo: 4,),
                    WrappingContainer(onTap: (){fun(2,1,5);}, letter: UI.isSelected[5] ?  UI.character: "",containerNo: 5,),
                    WrappingContainer(onTap: (){fun(0,2,6);}, letter: UI.isSelected[6] ?  UI.character: "",containerNo: 6,),
                    WrappingContainer(onTap: (){fun(1,2,7);}, letter: UI.isSelected[7] ?  UI.character: "",containerNo: 7,),
                    WrappingContainer(onTap: (){fun(2,2,8);}, letter: UI.isSelected[8] ?  UI.character: "",containerNo: 8,),
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

