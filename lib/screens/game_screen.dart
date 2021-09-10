import 'package:flutter/material.dart';
import 'package:tic_tac_toe/Models/TicTacToeLogic.dart';
import 'package:tic_tac_toe/screens/winning_screen.dart';
import 'package:tic_tac_toe/widgets/profile_container_widget.dart';
import 'package:tic_tac_toe/widgets/wrapping_container.dart';
import 'package:tic_tac_toe/constants.dart';
import 'dart:async';
import 'package:tic_tac_toe/Models/UiLogic.dart';

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

    if(widget.chosenLetter != null){
      if(widget.chosenLetter == "O"){
        letterO = true;
        letterX = false;
        playerMap['O'] = 'player 1';
        playerMap['X'] = 'player 2';
      }
      else{
        letterX = true;
        letterO = false;
        playerMap['X'] = 'player 1';
        playerMap['O'] = 'player 2';
      }
    }
    ui.initializeColorMap();
    super.initState();
  }

  @override

  Widget build(BuildContext context) {

    void checkRows(){
      setState(() {
        if(ui.checkR1()) colorMap[0] = colorMap[3] = colorMap[6] = kG;
        if(ui.checkR2()) colorMap[1] = colorMap[4] = colorMap[7] = kG;
        if(ui.checkR3()) colorMap[2] = colorMap[5] = colorMap[8] = kG;
      });
    }

    void checkColumns(){
      setState(() {
        if(ui.checkC1()) colorMap[0] = colorMap[1] = colorMap[2] = kG;
        if(ui.checkC2()) colorMap[3] = colorMap[4] = colorMap[5] = kG;
        if(ui.checkC3()) colorMap[6] = colorMap[7] = colorMap[8] = kG;
      });
    }

    void checkLeftDiagnol(){
      setState(() {
      if(ui.checkLeftDiagnol()) colorMap[0] = colorMap[4] = colorMap[8] = kG;
      });
    }

    void checkRightDiagnol(){
      setState(() {
      if(ui.checkRightDiagnol()) colorMap[2] = colorMap[4] = colorMap[6] = kG;
      });
    }

    void changeWinningLetterColors(String ansLetter){
      String toBeChecked = winningDirection;
      if(toBeChecked == "checkRows") checkRows();
      else if(toBeChecked == "checkColumns") checkColumns();
      else if(toBeChecked == "checkLeftDiagnol") checkLeftDiagnol();
      else if(toBeChecked == "checkRightDiagnol") checkRightDiagnol();
      Future.delayed(Duration(milliseconds: 3000), (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => WinningScreen(winningLetter: ansLetter,)));
      });
    }

    void updateMatrix(int row, int col, String val){
      game.insertIntoCell(row, col, val);
    }

    void fun(int r,int c, int containerNo){

      if(finalResult != "Win") {

        isSelected[containerNo] = true;
        if (letterX && mat[r][c] == "") {
          setState(() {
            UI.character = "X";
            letterX = false;
            letterO = true;
          });
        }
        else if (letterO && mat[r][c] == "") {
          setState(() {
            UI.character = "O";
            letterX = true;
            letterO = false;
          });
        }

        chars[containerNo] = UI.character;
        updateMatrix(r, c, UI.character);

        if (game.checkWinningCondition() == "Win") {
          finalResult = "Win";
          changeWinningLetterColors(ansLetter);
        }

        else if (game.checkDrawCondition() == "Draw") {
          finalResult = "Draw";
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => WinningScreen()));
        }

      }

    }

    deviceW = MediaQuery.of(context).size.width;

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
                    child: ProfileContainer(profileName: "Player 1", letter : side == "X" ? "X" : "O" ,imageName: 'satoru'),
                  ),
                  ProfileContainer(profileName: "Player 2", letter : side == "X" ? "O" : "X",imageName: 'mine'),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Container(
                width: deviceW - 40,
                height: deviceW - 40,
                decoration: BoxDecoration(
                  color: kGameScreenContainerColor,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Wrap(
                  direction: Axis.vertical,
                  alignment: WrapAlignment.center,
                  runAlignment: WrapAlignment.center,
                  children: [
                    WrappingContainer(onTap: (){fun(0,0,0);}, letter: isSelected[0] ?  UI.character: "",containerNo: 0,),
                    WrappingContainer(onTap: (){fun(1,0,1);}, letter: isSelected[1] ?  UI.character: "",containerNo: 1,),
                    WrappingContainer(onTap: (){fun(2,0,2);}, letter: isSelected[2] ?  UI.character: "",containerNo: 2,),
                    WrappingContainer(onTap: (){fun(0,1,3);}, letter: isSelected[3] ?  UI.character: "",containerNo: 3,),
                    WrappingContainer(onTap: (){fun(1,1,4);}, letter: isSelected[4] ?  UI.character: "",containerNo: 4,),
                    WrappingContainer(onTap: (){fun(2,1,5);}, letter: isSelected[5] ?  UI.character: "",containerNo: 5,),
                    WrappingContainer(onTap: (){fun(0,2,6);}, letter: isSelected[6] ?  UI.character: "",containerNo: 6,),
                    WrappingContainer(onTap: (){fun(1,2,7);}, letter: isSelected[7] ?  UI.character: "",containerNo: 7,),
                    WrappingContainer(onTap: (){fun(2,2,8);}, letter: isSelected[8] ?  UI.character: "",containerNo: 8,),
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
