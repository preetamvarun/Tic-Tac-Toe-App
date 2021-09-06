import 'package:flutter/material.dart';
import 'package:tic_tac_toe/widgets/profile_container_widget.dart';
import 'package:tic_tac_toe/widgets/wrapping_container.dart';
import 'package:tic_tac_toe/constants.dart';
import 'package:tic_tac_toe/screens/winning_screen.dart';
import 'package:tic_tac_toe/Models/TicTacToeLogic.dart';

TicTacToe game = TicTacToe();

late bool letterX,letterO;

List<bool>isSelected = [];

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
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    void fun(int r,int c){

      if(letterX){
        setState(() {
          if(widget.letter == ""){
            widget.letter = "X";
            letterX = false;
            letterO = true;
          }
        });
      }

      else if(letterO){
        setState(() {
          if(widget.letter == ""){
            widget.letter = "O";
            letterX = true;
            letterO = false;
          }
        });
      }

      if(game.checkWinningCondition() != ""){
        Navigator.push(context, MaterialPageRoute(builder: (context) => WinningScreen(result: game.checkWinningCondition())));
      }
      else if(game.checkDrawCondition() == "Draw"){
        Navigator.push(context, MaterialPageRoute(builder : (context) => WinningScreen(result: "It's a Draw",)));
      }
      game.insertIntoCell(r, c, widget.letter);
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
                    child: ProfileContainer(profileName: "Player 1", letter : "X",imageName: 'satoru',),
                  ),
                  ProfileContainer(profileName: "Player 2", letter : "O",imageName: 'mine',),
                ],
              ),
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
                      WrappingContainer(onTap: (){fun(0,0);}, letter: widget.letter,rowNo: 0,colNo: 0),
                      WrappingContainer(onTap: (){fun(1,0);}, letter: widget.letter,rowNo: 1,colNo: 0),
                      WrappingContainer(onTap: (){fun(2,0);}, letter: widget.letter,rowNo: 2,colNo: 0),
                      WrappingContainer(onTap: (){fun(0,1);}, letter: widget.letter,rowNo: 0,colNo: 1),
                      WrappingContainer(onTap: (){fun(1,1);}, letter: widget.letter,rowNo: 1,colNo: 1),
                      WrappingContainer(onTap: (){fun(2,1);}, letter: widget.letter,rowNo: 2,colNo: 1),
                      WrappingContainer(onTap: (){fun(0,2);}, letter: widget.letter,rowNo: 0,colNo: 2),
                      WrappingContainer(onTap: (){fun(1,2);}, letter: widget.letter,rowNo: 1,colNo: 2),
                      WrappingContainer(onTap: (){fun(2,2);}, letter: widget.letter,rowNo: 2,colNo: 2),
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
