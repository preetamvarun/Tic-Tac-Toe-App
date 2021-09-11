import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tic_tac_toe/constants.dart';
import 'package:tic_tac_toe/screens/game_screen.dart';
import 'package:tic_tac_toe/widgets/profile_container_widget.dart';
import 'package:tic_tac_toe/Models/UiLogic.dart';
import 'package:tic_tac_toe/widgets/reusable_button.dart';

class WinningScreen extends StatelessWidget {

  final winningLetter;
  WinningScreen({this.winningLetter});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kGameScreenBackgroundColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 60.0, horizontal: 0.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 25.0),
                    child: Flexible(child: ProfileContainer(profileName: "Player 1", letter : UI.side == "X" ? "X" : "O")),
                  ),
                  Flexible(child: ProfileContainer(profileName: "Player 2",  letter : UI.side == "X" ? "O" : "X" ,)),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: 10.0,right: 10.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: kGameScreenContainerColor,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      DelayedDisplay(
                        delay: Duration(milliseconds: 500),
                        child: Image(
                          height: 200.0,
                          width: 200.0,
                          image: AssetImage('images/${UI.finalResult}.png'),
                        ),
                      ),
                      UI.finalResult == "Win" ?
                      Center(
                        child: Text(
                          "${UI.playerMap[UI.character]} Wins",
                          style: kResultText,
                        ),
                      ): Center(
                        child: Text(
                          "Drawn",
                          style: kResultText,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 30.0),
              child: Column(
                children: [
                  ReusableButton(text: 'Play Again', onTap: (){
                    ui.colorsAndSide();
                    ui.remainingVars();
                    isGameRestarted = true;
                    Navigator.pop(context);
                    },
                  ),
                  ReusableButton(text: 'Home', onTap: (){
                    ui.colorsAndSide();
                    ui.remainingVars();
                    Navigator.pop(context);
                    Navigator.pop(context);
                    Navigator.pop(context);
                  },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}














