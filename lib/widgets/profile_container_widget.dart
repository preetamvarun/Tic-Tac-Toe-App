import 'package:flutter/material.dart';
import 'package:tic_tac_toe/constants.dart';

// ignore: must_be_immutable
class ProfileContainer extends StatelessWidget {

  final profileName,imageName,letter;
  // String letter = '';
  ProfileContainer({this.profileName,this.letter,this.imageName});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: kProfileContainerColor,
        borderRadius: BorderRadius.circular(20.0),
      ),
      height: 170.0,
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
              fontFamily: "carter",
              color: letter == "X" ? kLetterXColor : kLetterOColor,
            ),
          ),
        ],
      ),
    );
  }
}
