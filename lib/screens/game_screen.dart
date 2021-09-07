import 'package:flutter/material.dart';
import 'package:tic_tac_toe/widgets/profile_container_widget.dart';
import 'package:tic_tac_toe/widgets/wrapping_container.dart';
import 'package:tic_tac_toe/constants.dart';
import 'package:tic_tac_toe/Models/TicTacToeLogic.dart';
import 'dart:async';

TicTacToe game = TicTacToe();

List<bool>isSelected = [false,false,false,false,false,false,false,false,false];
List<String>chars = ["","","","","","","","",""];
String a = "Your Turn", b = "", finalResult = "";
late bool letterX,letterO;
bool isGameWinOrDraw = false;

var colorMap = {};


class GameScreen extends StatefulWidget{

  final chosenLetter; String letter = "";

  GameScreen({this.chosenLetter});

  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {

  @override
  void initState() {
    if(widget.chosenLetter != null){
      if(widget.chosenLetter == "O"){
        letterO = true;
        letterX = false;
      }
      else{
        letterX = true;
        letterO = false;
      }
    }
    for(int i = 0; i < 9; i++){
      colorMap[i] = "kProfileContainerColor";
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    void vanishYourTurn(){
      setState(() {
        a = "";
        b = "";
      });
    }

    void cr(){
      setState(() {
        if(game.mat[0][0] != "" && game.mat[0][0] == game.mat[0][1] && game.mat[0][1] == game.mat[0][2]) {
          colorMap[0] = 'GreenColor';
          colorMap[3] = 'GreenColor';
          colorMap[6] = 'GreenColor';
        }
        if(game.mat[1][0] != "" && game.mat[1][0] == game.mat[1][1] && game.mat[1][1] == game.mat[1][2]) {
          colorMap[1] = 'GreenColor';
          colorMap[4] = 'GreenColor';
          colorMap[7] = 'GreenColor';
        }
        if(game.mat[2][0] != "" && game.mat[2][0] == game.mat[2][1] && game.mat[2][1] == game.mat[2][2]) {
          colorMap[2] = 'GreenColor';
          colorMap[5] = 'GreenColor';
          colorMap[8] = 'GreenColor';
        }
      });
    }

    void cc(){
      setState(() {
        if(game.mat[0][0] != "" && game.mat[0][0] == game.mat[1][0] && game.mat[1][0] == game.mat[2][0]) {
          colorMap[0] = 'GreenColor';
          colorMap[1] = 'GreenColor';
          colorMap[2] = 'GreenColor';
        }
        if(game.mat[0][1] != "" && game.mat[0][1] == game.mat[1][1] && game.mat[1][1] == game.mat[2][1]) {
          colorMap[3] = 'GreenColor';
          colorMap[4] = 'GreenColor';
          colorMap[5] = 'GreenColor';
          }
        if (game.mat[0][2] != "" && game.mat[0][2] == game.mat[1][2] && game.mat[1][2] == game.mat[2][2]) {
          colorMap[6] = 'GreenColor';
          colorMap[7] = 'GreenColor';
          colorMap[8] = 'GreenColor';
        }
      });
    }

    void cld(){
      setState(() {
      if(game.mat[0][0] == game.mat[1][1] && game.mat[1][1] == game.mat[2][2]){
        colorMap[0] = 'GreenColor';
        colorMap[4] = 'GreenColor';
        colorMap[8] = 'GreenColor';
        }
      });
    }

    void crd(){
      setState(() {
      if(game.mat[2][0] == game.mat[1][1] && game.mat[1][1] == game.mat[0][2]){
        colorMap[2] = 'GreenColor';
        colorMap[4] = 'GreenColor';
        colorMap[6] = 'GreenColor';
         }
      });
    }

    void changeWinningLetterColors(){
      String toBeChecked = game.winningDirection;
      if(toBeChecked == "checkRows") cr();
      else if(toBeChecked == "checkColumns") cc();
      else if(toBeChecked == "checkLeftDiagnol") cld();
      else if(toBeChecked == "checkRightDiagnol") crd();
    }

    void updateMatrix(int row, int col, String val){
      game.insertIntoCell(row, col, val);
    }

    void fun(int r,int c, int containerNo){

      isSelected[containerNo] = true;

      if(letterX && game.mat[r][c] == ""){
        setState(() {
            widget.letter = "X";
            letterX = false; letterO = true;
        });
        chars[containerNo] = widget.letter;
        updateMatrix(r, c, widget.letter);
      }

      else if(letterO && game.mat[r][c] == ""){
        setState(() {
            widget.letter = "O";
            letterX = true; letterO = false;
        });
        chars[containerNo] = widget.letter;
        updateMatrix(r, c, widget.letter);
      }

      if(game.checkWinningCondition() == "Win"){
        finalResult = "Win";
        isGameWinOrDraw = true;
        vanishYourTurn();
        changeWinningLetterColors();
      }

      else if(game.checkDrawCondition() == "Draw"){
        finalResult = "Draw";
        vanishYourTurn();
        isGameWinOrDraw = true;
      }

    }

    return Scaffold(
      backgroundColor: kGameScreenBackgroundColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 0.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 25.0),
                    child: ProfileContainer(profileName: "Player 1", letter : "X",imageName: 'satoru'),
                  ),
                  ProfileContainer(profileName: "Player 2", letter : "O",imageName: 'mine'),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  letterX ? a : b,
                  style: kYourTurnText,
                ),
                Text(
                  letterO ? a : b,
                  style: kYourTurnText,
                ),
              ],
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 25.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: kGameScreenContainerColor,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Wrap(
                    direction: Axis.vertical,
                    alignment: WrapAlignment.center,
                    runAlignment: WrapAlignment.center,
                    children: [
                      WrappingContainer(onTap: (){fun(0,0,0);}, letter: isSelected[0] ? widget.letter : "",containerNo: 0,),
                      WrappingContainer(onTap: (){fun(1,0,1);}, letter: isSelected[1] ? widget.letter : "",containerNo: 1,),
                      WrappingContainer(onTap: (){fun(2,0,2);}, letter: isSelected[2] ? widget.letter : "",containerNo: 2,),
                      WrappingContainer(onTap: (){fun(0,1,3);}, letter: isSelected[3] ? widget.letter : "",containerNo: 3,),
                      WrappingContainer(onTap: (){fun(1,1,4);}, letter: isSelected[4] ? widget.letter : "",containerNo: 4,),
                      WrappingContainer(onTap: (){fun(2,1,5);}, letter: isSelected[5] ? widget.letter : "",containerNo: 5,),
                      WrappingContainer(onTap: (){fun(0,2,6);}, letter: isSelected[6] ? widget.letter : "",containerNo: 6,),
                      WrappingContainer(onTap: (){fun(1,2,7);}, letter: isSelected[7] ? widget.letter : "",containerNo: 7,),
                      WrappingContainer(onTap: (){fun(2,2,8);}, letter: isSelected[8] ? widget.letter : "",containerNo: 8,),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
