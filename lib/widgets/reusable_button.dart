import 'package:flutter/material.dart';
import 'package:tic_tac_toe/constants.dart';


class ReusableButton extends StatelessWidget {

  final onTap;

  ReusableButton({this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10.0),
      child: MaterialButton(
        padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 0.0),
        textColor: kBackgroundColor,
        color: kTextColor,
        minWidth : double.infinity,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        child: Text(
          'Start',
          style: TextStyle(fontFamily: 'Paytone', fontSize: 35.0, fontWeight: FontWeight.w500),
        ),
        onPressed: onTap,
      ),
    );
  }
}