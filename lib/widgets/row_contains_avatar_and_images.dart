import 'package:flutter/material.dart';
import 'package:tic_tac_toe/widgets/circle_avatar_widget.dart';
import 'package:tic_tac_toe/constants.dart';

class RowAvatarImages extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text("Avatar",style: kSettingsBoxLetterStyle,),
        CircleAvatarWidget(),
        CircleAvatarWidget(),
        CircleAvatarWidget(),
        CircleAvatarWidget(),
      ],
    );
  }
}

