import 'package:flutter/material.dart';
import 'package:tic_tac_toe/Models/UiLogic.dart';
import 'package:tic_tac_toe/constants.dart';

// ignore: must_be_immutable
class ProfileContainer extends StatelessWidget {

  final profileName,letter,bckColor,imageName;

  ProfileContainer({this.profileName,this.letter,this.bckColor,this.imageName});

  @override
  Widget build(BuildContext context) {

    return Container(
      decoration: UI.finalResult == "" ? BoxDecoration(
        color: UI.letterO ? letter == "O" ? Colors.green : kProfileContainerColor
        :  letter == "X" ? Colors.green : kProfileContainerColor ,
        borderRadius: BorderRadius.circular(20.0),
      ) : UI.finalResult != "Win" ? BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: kProfileContainerColor,
      ) : BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: UI.letterX == false ? letter == "X" ? Colors.green : kProfileContainerColor
            : letter == "O" ? Colors.green : kProfileContainerColor,
      ),
      height: 170.0,
      width: 125.0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image(
            image: AssetImage("images/$imageName.png"),
            height: 55.0,
          ),
          Text(
            profileName,
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.white,
              fontFamily: 'Carter',
            ),
            textAlign: TextAlign.center,
          ),
          Text(
            letter,
            style: TextStyle(
              fontSize: 30.0,
              fontFamily: 'Carter',
              color: letter == "X" ? kLetterXColor : kLetterOColor,
            ),
          ),
        ],
      ),
    );
  }
}