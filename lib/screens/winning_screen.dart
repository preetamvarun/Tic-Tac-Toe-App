import 'dart:async';

import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tic_tac_toe/constants.dart';
import 'package:tic_tac_toe/screens/game_screen.dart';
import 'package:tic_tac_toe/widgets/profile_container_widget.dart';
import 'package:tic_tac_toe/Models/UiLogic.dart';
import 'package:tic_tac_toe/widgets/reusable_button.dart';

class WinningScreen extends StatelessWidget {

  final winningLetter, startTimer, stopTimer;
  WinningScreen({this.winningLetter, this.startTimer,this.stopTimer});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kGameScreenBackgroundColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            DelayedDisplay(
              delay: Duration(milliseconds: 250),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ProfileContainer(profileName: UI.player1Name, letter : UI.side == "X" ? "X" : "O",imageName: UI.player1ImageName),
                    Column(
                      children: [
                        Text("D", style: kScoreTextStyle,),
                        Text(":", style: kScoreTextStyle,),
                        Text(UI.draws.toString(), style: kScoreTextStyle,),
                      ],
                    ),
                    ProfileContainer(profileName: UI.player2Name,  letter : UI.side == "X" ? "O" : "X" ,imageName: UI.player2ImageName,),
                  ],
                ),
              ),
            ),
            Expanded(
              child: DelayedDisplay(
                delay: Duration(milliseconds: 500),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: kGameScreenContainerColor,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: LayoutBuilder(
                      builder: (context,constraints) => Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(
                              height: constraints.maxHeight * 0.70,
                              image: AssetImage('images/${UI.finalResult}.png'),
                            ),
                            UI.finalResult == "Win" ?
                            Center(
                              child: Text(
                                "${UI.playerMap[winningLetter]} Wins",
                                style: kResultText.copyWith(fontSize: constraints.maxHeight / 10.5),
                              ),
                            ): Center(
                              child: Text(
                                "Drawn",
                                style: kResultText.copyWith(fontSize: constraints.maxHeight / 10.5),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            DelayedDisplay(
              delay: Duration(milliseconds: 850),
              child: Padding(
                padding: EdgeInsets.only(top: 10.0),
                child: Column(
                  children: [
                    ReusableButton(text: 'Play Again', onTap: (){
                      ui.remainingVars();
                      ui.setWinningVariables();
                      Navigator.pop(context);
                    },

                    ),
                    ReusableButton(text: 'Home', onTap: (){
                      ui.remainingVars();
                      Navigator.pop(context);
                      Navigator.pop(context);
                      Navigator.pop(context);
                      UI.muteSound = true;
                    },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
