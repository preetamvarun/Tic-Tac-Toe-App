import 'package:flutter/material.dart';
import 'package:tic_tac_toe/constants.dart';
import 'package:tic_tac_toe/Models/TicTacToeLogic.dart';
import 'package:tic_tac_toe/screens/winning_screen.dart';

bool letterXReference = true, letterOReference = false;


TicTacToe game = TicTacToe();


class WrappingContainer extends StatefulWidget {

  final rowNo, colNo;

  WrappingContainer({this.rowNo,this.colNo});

  String letter = "";

  @override
  _WrappingContainerState createState() => _WrappingContainerState();
}

class _WrappingContainerState extends State<WrappingContainer> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: GestureDetector(

        onTap: (){
         if(letterXReference){
           setState(() {
             if(widget.letter == ""){
               game.insertIntoCell(widget.rowNo, widget.colNo, "X");
               widget.letter = "X";
               letterXReference = false;
               letterOReference = true;
             }
           });
         }

         else if(letterOReference){
           setState(() {
             if(widget.letter == ""){
               game.insertIntoCell(widget.rowNo, widget.colNo, "O");
               widget.letter = "O";
               letterXReference = true;
               letterOReference = false;
             }
           });
         }

         if(game.checkWinningCondition() == "you win"){
           Navigator.push(context, MaterialPageRoute(builder: (context) => WinningScreen(result: "You Win",)));
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