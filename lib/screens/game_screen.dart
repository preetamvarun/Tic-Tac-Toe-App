import 'package:flutter/material.dart';
import 'package:tic_tac_toe/widgets/profile_container_widget.dart';
import 'package:tic_tac_toe/widgets/wrapping_container.dart';
import 'package:tic_tac_toe/constants.dart';

class GameScreen extends StatelessWidget{

  final chosenLetter;

  GameScreen({this.chosenLetter});

  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: kGameScreenBackgroundColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 0.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 25.0),
                    child: ProfileContainer(profileName: "Player 1", letter : "X",imageName: 'satoru',),
                  ),
                  ProfileContainer(profileName: "Player 2", letter : "O",imageName: 'mine',),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Visibility(visible: true, child: kYourTurnText),
                Visibility(visible: false, child: kYourTurnText),
              ],
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 25.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: kGameScreenContainerColor,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Wrap(
                    direction: Axis.vertical,
                    alignment: WrapAlignment.center,
                    runAlignment: WrapAlignment.center,
                    children: [
                      WrappingContainer(rowNo: 0,colNo: 0,chosenLetter: chosenLetter,),
                      WrappingContainer(rowNo: 1,colNo: 0,),
                      WrappingContainer(rowNo: 2,colNo: 0,),
                      WrappingContainer(rowNo: 0,colNo: 1,),
                      WrappingContainer(rowNo: 1,colNo: 1,),
                      WrappingContainer(rowNo: 2,colNo: 1,),
                      WrappingContainer(rowNo: 0,colNo: 2,),
                      WrappingContainer(rowNo: 1,colNo: 2,),
                      WrappingContainer(rowNo: 2,colNo: 2,),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
