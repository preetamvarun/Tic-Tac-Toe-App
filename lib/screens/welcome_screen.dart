import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tic_tac_toe/constants.dart';
import 'package:tic_tac_toe/screens/pickup_screen.dart';
import 'package:tic_tac_toe/widgets/reusable_button.dart';
import 'package:tic_tac_toe/widgets/wp_screen_text_widget.dart';

class WelcomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kGameScreenBackgroundColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 0.0),
              child: Center(child: TextWidget(text: "TIC TAC TOE",fontSize: 40.0,)),
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                LayoutBuilder(
                  builder : (context,constraints) => Text(
                    "X", style: TextStyle(color: kLetterXColor,fontSize: constraints.maxHeight / 2.36,fontFamily: 'Carter'),
                  ),
                ),LayoutBuilder(
                  builder : (context,constraints) => Text(
                    "O", style: TextStyle(color: kLetterOColor,fontSize: constraints.maxHeight / 2.36,fontFamily: 'Carter'),
                  ),
                ),
              ],
            ),
          ),
          ReusableButton(onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => PickUpScreen()));},
          text: "Pick A Side",
          ),
        ],
      ),
    );
  }
}

