import 'package:flutter/material.dart';
import 'package:tic_tac_toe/constants.dart';


class CircleAvatarWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
        radius: 25.0,
        backgroundColor: kSettingsBoxColor,
        child: Image(
          image: AssetImage("images/Draw.png"),
          height: 40.0,
        ),
    );
  }
}