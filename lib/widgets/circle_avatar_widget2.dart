import 'package:flutter/material.dart';
import 'package:tic_tac_toe/Models/UiLogic.dart';


class CircleAvatarWidget2 extends StatelessWidget {

  final imageName,color,onTap;
  CircleAvatarWidget2({this.imageName,this.color,this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
        radius: 25.0,
        backgroundColor: UI.avatar2Map[imageName],
        child: Image(
          image: AssetImage("images/$imageName.png"),
          height: 40.0,
        ),
      ),
    );
  }
}