import 'package:flutter/material.dart';

const kBackgroundColor = Color(0xFFFF4B4B);
const kTextColor = Color(0xFFFFCA26);
const kGameScreenBackgroundColor = Color(0XFF36248D);
const kGameScreenContainerColor = Color(0XFF6649C4);
const kLetterXColor = Color(0XFFEB1751);
const kLetterOColor = Color(0XFFFFD032);
const kSettingsBoxColor = Color(0xFF9b70e5);
const kProfileContainerColor = Color(0XFF27175D);
const kYourTurnText = TextStyle(color: Colors.white, fontSize: 18.0, fontWeight: FontWeight.w600);
const kResultText = TextStyle(color: Colors.white,fontFamily: 'Carter');
const kReusableButton = "";
const kG = "";
const kTextFieldDecoration = InputDecoration(
  contentPadding: EdgeInsets.fromLTRB(5.0, 1.0, 5.0, 1.0),
  fillColor: kProfileContainerColor,
  filled: true,
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(5.0),),
    borderSide: BorderSide.none,
  ),
  hintStyle: TextStyle(color: Colors.white),

);
const kSettingsBoxLetterStyle = TextStyle(color: Colors.white, fontFamily: 'Carter',
);