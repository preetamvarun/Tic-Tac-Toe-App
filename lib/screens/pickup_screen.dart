import 'package:flutter/material.dart';
import 'package:tic_tac_toe/widgets/container_widget.dart';
import 'package:tic_tac_toe/constants.dart';
import 'package:tic_tac_toe/widgets/reusable_button.dart';
import 'package:tic_tac_toe/screens/game_screen.dart';
import 'package:tic_tac_toe/Models/UiLogic.dart';

UI ui = UI();

class PickUpScreen extends StatefulWidget {

  @override
  _PickUpScreenState createState() => _PickUpScreenState();
}

class _PickUpScreenState extends State<PickUpScreen> {

  void updateColor(letter selectedLetter) {ui.updateColor(selectedLetter);}

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
                  color: ui.xCardColor, text: "X",
                  textColor: ui.xTextColor,
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
                  color: ui.oCardColor, text: "O",
                  textColor: ui.oTextColor,
                ),
              ),
            ),
            // Button Code
            ReusableButton(onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => GameScreen(chosenLetter: side,)));}, text: "Start",),
          ],
        ),
      ),
    );
  }
}


