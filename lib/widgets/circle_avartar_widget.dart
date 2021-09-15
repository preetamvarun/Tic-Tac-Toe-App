import 'package:flutter/material.dart';

class CircleAvatarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      child: Image(
        image: AssetImage("images/Draw.png"),
        height: 30.0,
      ),
    );
  }
}