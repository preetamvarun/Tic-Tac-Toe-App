import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tic_tac_toe/constants.dart';

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
              height: 45.0,
              width: 180.0,
              child: TextField(
                inputFormatters: [LengthLimitingTextInputFormatter(50)],
                style: TextStyle(
                  color: Colors.white,
                ),
                decoration: kTextFieldDecoration.copyWith(hintText: name),
                onChanged: (value){
                  print(value);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
