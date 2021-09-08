import 'package:flutter/material.dart';
import 'package:tic_tac_toe/constants.dart';

class TextWidget extends StatelessWidget {

  TextWidget({this.text,this.fontSize});
  final text,fontSize;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: kTextColor,
        fontFamily: 'Carter',
        fontSize: fontSize,
      ),
    );
  }
}
