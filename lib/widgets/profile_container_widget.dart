import 'package:flutter/material.dart';
import 'package:tic_tac_toe/Models/UiLogic.dart';
import 'package:tic_tac_toe/constants.dart';

double sch = 0.0;


// ignore: must_be_immutable
class ProfileContainer extends StatelessWidget {

  final profileName,letter,bckColor,imageName,boxHeight;

  ProfileContainer({this.profileName,this.letter,this.bckColor,this.imageName,this.boxHeight});

  @override
  Widget build(BuildContext context) {


    return Container(
      decoration: UI.finalResult == "" ? BoxDecoration(
        color: UI.letterO ? letter == "O" ? kActiveCardColor: kProfileContainerColor
        :  letter == "X" ? kActiveCardColor: kProfileContainerColor ,
        borderRadius: BorderRadius.circular(20.0),
        border: UI.letterO ?
        letter == "O" ? Border.all(color: Colors.white,width: 1.0) : Border.all(color: kGameScreenBackgroundColor,width : 1.5) :
        letter == "X" ? Border.all(color: Colors.white,width: 1.0) : Border.all(color: kGameScreenBackgroundColor,width : 1.5)
      ) : UI.finalResult != "Win" ? BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: kProfileContainerColor,
      ) : BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: UI.letterX == false ? letter == "X" ? kActiveCardColor: kProfileContainerColor
            : letter == "O" ? kActiveCardColor: kProfileContainerColor,
          border: UI.letterX == false ?
          letter == "X" ? Border.all(color: Colors.white,width: 1.0) : Border.all(color: kGameScreenBackgroundColor,width : 1.5) :
          letter == "O" ? Border.all(color: Colors.white,width: 1.0) : Border.all(color: kGameScreenBackgroundColor,width : 1.5)
      ),
      width: 130.0,
      height: 160.0,
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