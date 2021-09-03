import 'package:flutter/material.dart';
import 'package:tic_tac_toe/widgets/container_widget.dart';
import 'package:tic_tac_toe/constants.dart';
import 'package:tic_tac_toe/screens/game_screen.dart';

String side = "";

class PickUpScreen extends StatefulWidget {

  @override
  _PickUpScreenState createState() => _PickUpScreenState();
}

enum letter{
  cardX,
  cardO
}

class _PickUpScreenState extends State<PickUpScreen> {

  Color xCardColor = kTextColor, oCardColor = kBackgroundColor;
  Color xTextColor = kBackgroundColor, oTextColor = kTextColor;

  // if colorNo == 1 X is pressed ; colorNo == 2 O is pressed;
  void updateColor(letter selectedLetter){

    if(selectedLetter == letter.cardO){
      if(oCardColor == kBackgroundColor && oTextColor == kTextColor){
        oCardColor = kTextColor;
        oTextColor = kBackgroundColor;
        xCardColor = kBackgroundColor;
        xTextColor = kTextColor;
      }
    }

    if(selectedLetter == letter.cardX){
      if(xCardColor == kBackgroundColor && xTextColor == kTextColor){
        oCardColor = kBackgroundColor;
        oTextColor = kTextColor;
        xCardColor = kTextColor;
        xTextColor = kBackgroundColor;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
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
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10.0),
              child: MaterialButton(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 0.0),
                textColor: kBackgroundColor,
                color: kTextColor,
                minWidth : double.infinity,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                child: Text(
                  'Start',
                  style: TextStyle(fontFamily: 'Paytone', fontSize: 35.0),
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => GameScreen(chosenLetter: side,)));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
