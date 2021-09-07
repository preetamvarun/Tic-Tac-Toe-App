import 'package:flutter/material.dart';
import 'package:tic_tac_toe/widgets/profile_container_widget.dart';
import 'package:tic_tac_toe/widgets/wrapping_container.dart';
import 'package:tic_tac_toe/constants.dart';
import 'package:tic_tac_toe/screens/winning_screen.dart';
import 'package:tic_tac_toe/Models/TicTacToeLogic.dart';

TicTacToe game = TicTacToe();

List<bool>isSelected = [false,false,false,false,false,false,false,false,false];

List<String>chars = ["","","","","","","","",""];

String a = "Your Turn", b = "";


late bool letterX,letterO;

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

    void fun(int r,int c, int containerNo){

      widget.letter = "";

      isSelected[containerNo] = true;

      if(letterX && isSelected[containerNo]){
        setState(() {
          if(widget.letter == ""){
            widget.letter = "X";
            letterX = false;
            letterO = true;
          }
        });
        chars[containerNo] = widget.letter;
      }

      else if(letterO && isSelected[containerNo]){
        setState(() {
          if(widget.letter == ""){
            widget.letter = "O";
            letterX = true;
            letterO = false;
          }
        });
        chars[containerNo] = widget.letter;
      }

      if(isSelected[containerNo]) game.insertIntoCell(r, c, widget.letter);

      if(game.checkWinningCondition() != ""){
        Navigator.push(context, MaterialPageRoute(builder: (context) => WinningScreen(result: game.checkWinningCondition())));
      }
      else if(game.checkDrawCondition() == "Draw"){
        Navigator.push(context, MaterialPageRoute(builder : (context) => WinningScreen(result: "It's a Draw",)));
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
                    child: ProfileContainer(profileName: "Player 1", letter : "X",imageName: 'satoru',),
                  ),
                  ProfileContainer(profileName: "Player 2", letter : "O",imageName: 'mine',),
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
