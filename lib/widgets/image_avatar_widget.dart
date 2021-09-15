import 'package:flutter/material.dart';
import 'package:tic_tac_toe/screens/welcome_screen.dart';
import 'package:tic_tac_toe/widgets/circle_avartar_widget.dart';

class ImageAvatarWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CircleAvatarWidget(),
          CircleAvatarWidget(),
          CircleAvatarWidget(),
          CircleAvatarWidget(),
        ],
      ),
    );
  }
}
