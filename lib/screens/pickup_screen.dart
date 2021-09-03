import 'package:flutter/material.dart';
import 'package:tic_tac_toe/widgets/container_widget.dart';
import 'package:tic_tac_toe/constants.dart';


class PickUpScreen extends StatefulWidget {

  @override
  _PickUpScreenState createState() => _PickUpScreenState();
}

class _PickUpScreenState extends State<PickUpScreen> {

  Color xCardColor = kTextColor, oCardColor = kBackgroundColor;
  Color xTextColor = kBackgroundColor, oTextColor = kTextColor;

  // if colorNo == 1 X is pressed ; colorNo == 2 O is pressed;
  void updateColor(int colorNo){
    if(colorNo == 2){
      if(oCardColor == kBackgroundColor && oTextColor == kTextColor){
        oCardColor = kTextColor;
        oTextColor = kBackgroundColor;
        xCardColor = kBackgroundColor;
        xTextColor = kTextColor;
      }
    }
    if(colorNo == 1){
      if(xCardColor == kBackgroundColor && xTextColor == kTextColor){
        oCardColor = kBackgroundColor;
        oTextColor = kTextColor;
        xCardColor = kTextColor;
        xTextColor = kBackgroundColor;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  'Choose a side',
                  style: TextStyle(
                    color: kTextColor,
                    fontSize: 30.0,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Carter',
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: (){
                setState(() {
                  updateColor(1);
                });
              },
              child: ContainerWidget(
                color: xCardColor,
                text: "X",
                textColor: xTextColor,
              ),
            ),
            GestureDetector(
              onTap: (){
                setState(() {
                  updateColor(2);
                });
              },
              child: ContainerWidget(
                color: oCardColor,
                text: "O",
                textColor: oTextColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
