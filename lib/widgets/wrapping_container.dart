import 'package:flutter/material.dart';
import 'package:tic_tac_toe/constants.dart';
import 'package:tic_tac_toe/Models/TicTacToeLogic.dart';
import 'package:tic_tac_toe/screens/winning_screen.dart';

late bool letterX , letterO;

TicTacToe game = TicTacToe();

class WrappingContainer extends StatefulWidget {

  final rowNo, colNo, chosenLetter;

  WrappingContainer({this.rowNo,this.colNo, this.chosenLetter});

  String letter = "";

  @override
  _WrappingContainerState createState() => _WrappingContainerState();
}

class _WrappingContainerState extends State<WrappingContainer> {

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
      print(letterX);
      print(letterO);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: (){
         if(letterX){
           setState(() {
             if(widget.letter == ""){
               game.insertIntoCell(widget.rowNo, widget.colNo, "X");
               widget.letter = "X";
               letterX = false;
               letterO = true;
             }
           });
         }
         else if(letterO){
           setState(() {
             if(widget.letter == ""){
               game.insertIntoCell(widget.rowNo, widget.colNo, "O");
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
        },
        child: Container(
          decoration: BoxDecoration(
            color: kProfileContainerColor,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Text(
            widget.letter,
            style: TextStyle(
              fontFamily: 'Carter',
              fontSize: 80.0,
              color: widget.letter == "X" ? kLetterXColor : kLetterOColor,
            ),
            textAlign : TextAlign.center,
          ),
          height: 110.0,
          width: 110.0,
        ),
      ),
    );
  }
}