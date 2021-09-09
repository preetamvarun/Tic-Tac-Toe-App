import 'package:flutter/material.dart';
import 'package:tic_tac_toe/Models/TicTacToeLogic.dart';
import 'package:tic_tac_toe/widgets/container_widget.dart';
import 'package:tic_tac_toe/constants.dart';
import 'package:tic_tac_toe/widgets/reusable_button.dart';
import 'package:tic_tac_toe/screens/game_screen.dart';
import 'package:tic_tac_toe/Models/UiLogic.dart';
import 'package:tic_tac_toe/widgets/wp_screen_text_widget.dart';

TicTacToe g = TicTacToe();
UI u = UI();

class PickUpScreen extends StatefulWidget {

  @override
  _PickUpScreenState createState() => _PickUpScreenState();
}

class _PickUpScreenState extends State<PickUpScreen> {

  @override
  void initState() {
    u.initVariables();
    super.initState();
  }

  void updateColor(letter selectedLetter) {
    ui.updateColor(selectedLetter);
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
                child: TextWidget(text: 'Choose a side',fontSize: 35.0,fontWeight: FontWeight.w500,)
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
                  color: UI.xCardColor, text: "X",
                  textColor: UI.xTextColor,
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
                  color: UI.oCardColor, text: "O",
                  textColor: UI.oTextColor,
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