import 'package:flutter/material.dart';

class CircleAvatarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 25.0,
      backgroundColor: Colors.green,
      child: Image(
        image: AssetImage("images/Draw.png"),
        height: 40.0,
      ),
    );
  }
}