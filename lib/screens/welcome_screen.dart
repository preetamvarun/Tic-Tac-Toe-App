import 'package:flutter/material.dart';
import 'package:tic_tac_toe/constants.dart';
import 'package:tic_tac_toe/screens/pickup_screen.dart';
import 'package:tic_tac_toe/widgets/reusable_button.dart';
import 'package:tic_tac_toe/widgets/wp_screen_text_widget.dart';

class WelcomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kProfileContainerColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 0.0),
              child: Center(
                child: TextWidget(text: "TIC TAC TOE",fontSize: 40.0,),
              ),
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: TextWidget(text: "XO", fontSize: 200.0,),
              ),
            ),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: ReusableButton(onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => PickUpScreen()));},
              text: "Pick A Side",
              ),
            ),
          ),
        ],
      ),
    );
  }
}

