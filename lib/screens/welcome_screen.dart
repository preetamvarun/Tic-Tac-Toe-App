import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tic_tac_toe/constants.dart';
import 'package:tic_tac_toe/screens/pickup_screen.dart';
import 'package:tic_tac_toe/widgets/reusable_button.dart';
import 'package:tic_tac_toe/widgets/wp_screen_text_widget.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class WelcomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kGameScreenBackgroundColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10.0,right: 10.0),
                  child: GestureDetector(
                    onTap: (){

                    },
                    child: Icon(
                      Icons.settings,
                      size: 40.0,
                      color: Color(0xFF9b70e5),
                    ),
                  ),
                ),
              ],
            ),
            Center(child: TextWidget(text: "Tic Tac Toe", fontSize: 40.0, fontWeight: FontWeight.w500,)),
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
      ),
    );
  }
}

