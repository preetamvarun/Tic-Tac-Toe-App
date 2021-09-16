import 'package:flutter/material.dart';
import 'package:tic_tac_toe/constants.dart';

class NameTextFieldWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text("Your Name",style: kSettingsBoxLetterStyle,),
          Padding(
            padding: EdgeInsets.only(left: 10.0),
            child: Container(
              height: 50.0,
              width: 160.0,
              child: TextField(
                decoration: kTextFieldDecoration,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
