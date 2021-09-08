import 'package:flutter/material.dart';
import 'package:tic_tac_toe/widgets/container_widget.dart';
import 'package:tic_tac_toe/constants.dart';
import 'package:tic_tac_toe/widgets/reusable_button.dart';
import 'package:tic_tac_toe/screens/game_screen.dart';


String side = "X";

class PickUpScreen extends StatefulWidget {

  @override
  _PickUpScreenState createState() => _PickUpScreenState();
}

enum letter{
  cardX,
  cardO
}


class _PickUpScreenState extends State<PickUpScreen> {

  Color xCardColor = kProfileContainerColor, oCardColor = kGameScreenBackgroundColor;
  Color xTextColor = Colors.white, oTextColor = kTextColor;

  // if colorNo == 1 X is pressed ; colorNo == 2 O is pressed;
  void updateColor(letter selectedLetter){

    if(selectedLetter == letter.cardO){
      if(oCardColor == kGameScreenBackgroundColor && oTextColor == kTextColor){
        oCardColor = kProfileContainerColor;oTextColor = Colors.white;
        xCardColor = kGameScreenBackgroundColor;xTextColor = kTextColor;
      }
    }

    if(selectedLetter == letter.cardX){
      if(xCardColor == kGameScreenBackgroundColor && xTextColor == kTextColor){
        oCardColor = kGameScreenBackgroundColor;oTextColor = kTextColor;
        xCardColor = kProfileContainerColor;xTextColor = Colors.white;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kGameScreenBackgroundColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  'Choose a side',
                  style: TextStyle(
                    color: kTextColor,
                    fontSize: 35.0,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Carter',
                  ),
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: (){
                  setState(() {
                    updateColor(letter.cardX);
                    side = "X";
                  });
                },
                child: ContainerWidget(
                  color: xCardColor,
                  text: "X",
                  textColor: xTextColor,
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: (){
                  setState(() {
                    updateColor(letter.cardO);
                    side = "O";
                  });
                },
                child: ContainerWidget(
                  color: oCardColor,
                  text: "O",
                  textColor: oTextColor,
                ),
              ),
            ),
            // Button Code
            ReusableButton(onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => GameScreen(chosenLetter: side,)));},),
          ],
        ),
      ),
    );
  }
}


