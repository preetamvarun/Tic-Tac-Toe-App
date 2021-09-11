import 'package:flutter/material.dart';
import 'package:tic_tac_toe/constants.dart';

class ReusableButton extends StatelessWidget {

  final onTap,text,fontSize;
  ReusableButton({this.onTap,this.text,this.fontSize});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: MaterialButton(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
        textColor: kBackgroundColor,
        color: kTextColor,
        minWidth : double.infinity,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        child: Text(
          text,
          style: TextStyle(fontFamily: 'Paytone', fontSize: fontSize, fontWeight: FontWeight.w500),
        ),
        onPressed: onTap,
      ),
    );
  }
}