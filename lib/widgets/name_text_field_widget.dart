import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tic_tac_toe/constants.dart';
import 'package:tic_tac_toe/Models/UiLogic.dart';

class NameTextFieldWidget extends StatelessWidget {

  final name;
  NameTextFieldWidget({this.name});

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
              child: TextField(
                inputFormatters: [LengthLimitingTextInputFormatter(20)],
                style: TextStyle(
                  color: Colors.white,
                ),
                decoration: kTextFieldDecoration.copyWith(hintText: name),
                onChanged: (value){
                  name == "Player 1" ? UI.player1Name = value :  UI.player2Name = value;
                },
              ),
              height: 45.0,
              width: 160.0,
            ),
          ),
        ],
      ),
    );
  }
}
