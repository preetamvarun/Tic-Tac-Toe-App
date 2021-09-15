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
          Text("Your Name is preetam"),
          SizedBox(width: 10.0,),
          Container(
            height: 40.0,
            width: 100.0,
            child: TextField(
              decoration: kTextFieldDecoration,
            ),
          ),
        ],
      ),
    );
  }
}
