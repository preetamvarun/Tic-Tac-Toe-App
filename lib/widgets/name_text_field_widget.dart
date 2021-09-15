import 'package:flutter/material.dart';
import 'package:tic_tac_toe/constants.dart';

class NameTextFieldWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text("Your Name"),
          Container(
            width: 100.0,
            height: 30.0,
            child: TextField(
              decoration: kTextFieldDecoration,
            ),
          ),
        ],
      ),
    );
  }
}
