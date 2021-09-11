import 'package:flutter/material.dart';
import 'package:tic_tac_toe/Models/UiLogic.dart';
import 'package:tic_tac_toe/constants.dart';

// ignore: must_be_immutable
class ProfileContainer extends StatelessWidget {

  final profileName,imageName,letter,bckColor;
  ProfileContainer({this.profileName,this.letter,this.imageName,this.bckColor});

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
      height: 160.0,
      width: 120.0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CircleAvatar(
            radius: 30.0,
            backgroundImage: AssetImage('images/$imageName.jpg'),
          ),
          Text(
            profileName,
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
          Text(
            letter,
            style: TextStyle(
              fontSize: 35.0,
              fontFamily: 'Carter',
              color: letter == "X" ? kLetterXColor : kLetterOColor,
            ),
          ),
        ],
      ),
    );
  }
}


// finalResult != "Win" ? TextStyle(
// fontSize: 35.0,
// fontFamily: "carter",
// color: letterO ? letter == "O" ? Colors.white : kLetterXColor
//     : letter == "X" ? Colors.white : kLetterOColor
// ) : TextStyle(
// fontSize: 35.0,
// fontFamily: "carter",
// color: letterX == false ? letter == "X" ? Colors.white : kLetterOColor
//     : letter == "O" ? Colors.white : kLetterXColor,
// ),