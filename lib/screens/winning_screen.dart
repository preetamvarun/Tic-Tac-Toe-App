import 'package:delayed_display/delayed_display.dart';
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
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 0.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 25.0),
                    child: ProfileContainer(profileName: "Player 1", letter : UI.side == "X" ? "X" : "O" , imageName: 'satoru'),
                  ),
                  ProfileContainer(profileName: "Player 2",  letter : UI.side == "X" ? "O" : "X" , imageName: 'mine'),
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
                  child: DelayedDisplay(
                    delay: Duration(milliseconds: 500),
                    child: Image(
                      image: AssetImage('images/${UI.finalResult}.png'),
                    ),
                  ),
                ),
              ),
            ),
            UI.finalResult == "Win" ? Center(
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
            ReusableButton(text: 'Play Again', onTap: (){
              ui.colorsAndSide();
              ui.remainingVars();
             Navigator.pop(context);
             Navigator.pop(context);
             Navigator.push(context, MaterialPageRoute(builder: (context) => GameScreen()));
            },),
            ReusableButton(text: 'Restart', onTap: (){
              ui.colorsAndSide();
              ui.remainingVars();
             Navigator.pop(context);
             Navigator.pop(context);
             Navigator.pop(context);
            },),
          ],
        ),
      ),
    );
  }
}

