import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:tic_tac_toe/constants.dart';
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
                    child: ProfileContainer(profileName: "Player 1", letter: "X", imageName: 'satoru'),
                  ),
                  ProfileContainer(profileName: "Player 2", letter: "O", imageName: 'mine'),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 25.0),
                child: DelayedDisplay(
                  delay: Duration(milliseconds: 300),
                  child: Image(
                    image: AssetImage('images/$finalResult.png'),
                  ),
                ),
              ),
            ),
            finalResult == "Win" ? Center(
              child: Text(
                winningLetter == "X" ? "Player1 Wins" : "Player2 Wins",
                style: kResultText,
              ),
            ): Center(
              child: Text(
                "Game has been Drawn",
                style: kResultText,
              ),
            ),
            ReusableButton(text: 'Restart', onTap: (){
              Navigator.pop(context);
              Navigator.pop(context);
              Navigator.pop(context);
            },)
          ],
        ),
      ),
    );
  }
}

